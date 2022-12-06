FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV FASTTEXT=/opt/fasttext
ENV PATH="$FASTTEXT/bin:$PATH"
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN apt-get update --fix-missing && \
    apt-get install -y build-essential git wget curl net-tools g++ default-jdk make unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN python3 -m venv $FASTTEXT
RUN $FASTTEXT/bin/pip install --upgrade pip
RUN mkdir -p /repos/facebookresearch
WORKDIR /repos/facebookresearch
RUN git clone https://github.com/facebookresearch/fastText.git
WORKDIR /repos/facebookresearch/fastText
RUN pip install .
    
RUN $FASTTEXT/bin/pip install requests pandas tqdm ipywidgets matplotlib scikit-learn timm pyyaml seaborn pandarallel gensim pybind11 python-mecab-ko

RUN echo ". $FASTTEXT/bin/activate" >> ~/.bashrc