FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod a+x entrypoint.sh

EXPOSE 8080

CMD [ "./entrypoint.sh" ]
