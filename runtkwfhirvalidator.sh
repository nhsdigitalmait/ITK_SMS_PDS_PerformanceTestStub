echo $PWD
echo "Running as UID $UID"
echo "getPatientDetailsByNHSNumber_PERCENTAGE_FOUND_RESPONSE = " $getPatientDetailsByNHSNumber_PERCENTAGE_FOUND_RESPONSE
echo "getPatientDetailsBySearch_PERCENTAGE_FOUND_RESPONSE = " $getPatientDetailsBySearch_PERCENTAGE_FOUND_RESPONSE
echo "getPatientDetailsByNHSNumber_DELAY_MS = " $getPatientDetailsByNHSNumber_DELAY_MS
echo "getPatientDetailsBySearch_DELAY_MS = " $getPatientDetailsBySearch_DELAY_MS
echo "Making sure output structure is available"
cd /home/service/data
tar -xvf /home/service/TKW/config/ITK_SMS_PDS_PerformanceTestStub/tkwoutputstructure.tar
cd /home/service
#ClearText
java -version
java -Dtks.skipsignlogs=y -Dtks.percentagechance.getPatientDetailsByNHSNumberChance=$getPatientDetailsByNHSNumber_PERCENTAGE_FOUND_RESPONSE -Dtks.percentagechance.getPatientDetailsBySearchChance=$getPatientDetailsBySearch_PERCENTAGE_FOUND_RESPONSE -Dtks.delaysubstitution.getPatientDetailsByNHSNumber=$getPatientDetailsByNHSNumber_DELAY_MS -Dtks.delaysubstitution.getPatientDetailsBySearch=$getPatientDetailsBySearch_DELAY_MS -jar /home/service/TKW/TKW.jar -httpinterceptor /home/service/TKW/config/ITK_SMS_PDS_PerformanceTestStub/tkw.properties
