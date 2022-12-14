FROM python:3.10.7-buster

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV FASTTEXT=/opt/fasttext
ENV PATH="$FASTTEXT/bin:$PATH"
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update --fix-missing && \
    apt-get install -y build-essential git wget curl g++ default-jdk make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN python3 -m venv $FASTTEXT
RUN $FASTTEXT/bin/pip install --upgrade pip
RUN mkdir -p /repos/facebookresearch
WORKDIR /repos/facebookresearch
RUN git clone https://github.com/facebookresearch/fastText.git
WORKDIR /repos/facebookresearch/fastText
RUN pip install .

RUN echo ". $FASTTEXT/bin/activate" >> ~/.bashrc

RUN curl -s https://raw.githubusercontent.com/konlpy/konlpy/master/scripts/mecab.sh | bash -s

RUN $FASTTEXT/bin/pip install pybind11 python-mecab-ko scikit-learn tqdm pandas pandarallel