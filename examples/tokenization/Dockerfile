FROM python:3.10.7-buster

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV FASTTEXT=/opt/fasttext
ENV PATH="$FASTTEXT/bin:$PATH"
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV MECAB_KO_DIC_DIR /tmp/mecab-ko-dic-2.1.1-20180720

RUN apt-get update --fix-missing && \
    apt-get install -y build-essential git wget curl net-tools g++ default-jdk make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m venv $FASTTEXT
RUN $FASTTEXT/bin/pip install --upgrade pip

RUN echo ". $FASTTEXT/bin/activate" >> ~/.bashrc

RUN curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh | bash -s

RUN rm $MECAB_KO_DIC_DIR/Person.csv
RUN rm $MECAB_KO_DIC_DIR/Person-actor.csv
COPY app /app
WORKDIR /app
RUN rm $MECAB_KO_DIC_DIR/user-dic/*
RUN cp dictionaries/Person.csv $MECAB_KO_DIC_DIR/user-dic/

WORKDIR $MECAB_KO_DIC_DIR
RUN tools/add-userdic.sh
RUN make install

RUN mkdir -p /app/facebookresearch
WORKDIR /app/facebookresearch
RUN git clone https://github.com/facebookresearch/fastText.git
WORKDIR /app/facebookresearch/fastText
RUN pip install .

RUN $FASTTEXT/bin/pip install requests pandas pandarallel pybind11 python-mecab-ko 