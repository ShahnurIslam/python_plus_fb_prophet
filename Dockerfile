FROM python:3.7.0

RUN apt-get update \
&& apt-get install gcc -y \
&& apt-get clean

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt
