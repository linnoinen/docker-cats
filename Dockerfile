#base img
FROM alpine:3.5

# install py + pip
RUN apk add --update py2-pip

# install py modules
COPY src/requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy app
COPY src/app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# port
EXPOSE 5000

# run app
CMD ["python", "/usr/src/app/app.py"]
