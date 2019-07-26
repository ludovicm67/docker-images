FROM openjdk:13-alpine
WORKDIR /app
VOLUME /bench

# from: https://confluence.atlassian.com/kb/testing-disk-access-speed-for-a-java-application-818577561.html
RUN wget https://confluence.atlassian.com/jirakb/files/54362304/54591494/3/1444177154112/support-tools.jar

# add script to run the benchmark manually
COPY run.sh ./run_bench.sh
RUN chmod +x run_bench.sh
