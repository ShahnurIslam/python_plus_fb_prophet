FROM python:3.7.0 as builder
RUN apt-get update \
&& apt-get install gcc -y \
&& apt-get clean
COPY requirements.txt /app/requirements.txt
WORKDIR app
RUN pip install --user -r requirements.txt
RUN pip freeze
COPY . /app
# Here is the production image

FROM python:3.7.0 as app
COPY --from=builder /root/.local /root/.local
WORKDIR app
ENV PATH=/root/.local/bin:$PATH
Run pip install prophet
