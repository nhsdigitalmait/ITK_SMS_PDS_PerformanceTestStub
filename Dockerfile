FROM nhsdigitalmait/tkw:20201119-performance-SNAPSHOT
RUN useradd -rm -u 1001 service
RUN mkdir /home/service/data/ && chown service:service /home/service/data/
COPY . /home/service/TKW/config/ITK_SMS_PDS_PerformanceTestStub
WORKDIR /home/service/TKW/config/ITK_SMS_PDS_PerformanceTestStub
RUN sh set-all-configurations.sh
ENV getPatientDetailsByNHSNumber_PERCENTAGE_FOUND_RESPONSE=100
ENV getPatientDetailsBySearch_PERCENTAGE_FOUND_RESPONSE=100
ENV getPatientDetailsByNHSNumber_DELAY_MS=0
ENV getPatientDetailsBySearch_DELAY_MS=0
USER service
CMD ["bash", "runtkwfhirvalidator.sh"]

