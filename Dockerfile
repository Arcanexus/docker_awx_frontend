FROM python:3.7.3
COPY . /app
WORKDIR /app
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev && rm -rf /var/lib/apt/lists/*
RUN pip3 install -r requirements.txt 
ENV http_proxy http://10.20.102.6:3128
ENV https_proxy http://10.20.102.6:3128
ENV HTTP_PROXY http://10.20.102.6:3128
ENV HTTPS_PROXY http://10.20.102.6:3128
ENTRYPOINT ["python"]
CMD ["app.py"]
