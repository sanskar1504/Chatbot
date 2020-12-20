FROM python:3.6-slim


# config
RUN mkdir -p /var/www \
    && apt-get update \
    && apt-get install -y \
        build-essential \
        python-dev \
        git \
        python3-pip \
    && pip3 install -U pip

ENV SPACY_VERSION    2.0.3

# spacy
RUN \
    pip3 install -U jieba \
        ipython \
        numpy \
        pandas \
        requests \
        chardet \
    && pip3 install -U spacy \
    && python3 -m spacy download en \
    && python3 -m spacy download xx

COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt
# Unit tests
#RUN python test_basic.py

EXPOSE 5000 
ENTRYPOINT [ "python" ] 
CMD [ "app.py" ] 