FROM python:3.8

RUN apt-get update && \
	apt-get install -y libjemalloc-dev libboost-dev \
                       libboost-filesystem-dev \
                       libboost-system-dev \
                       libboost-regex-dev \
                       python-dev \
                       autoconf \
                       flex \
                       bison \
                       cmake

ADD ./ $HOME/jupyter/

WORKDIR $HOME/jupyter

RUN pip install -r requirements.txt

EXPOSE 8888

ENTRYPOINT ["jupyter","lab","--no-browser","--ip=0.0.0.0","--allow-root","--NotebookApp.token=''","--NotebookApp.password=''"]