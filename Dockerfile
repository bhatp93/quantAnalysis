FROM continuumio/miniconda3:latest

WORKDIR /home/app

COPY environment.yml ./
COPY compute.py ./
COPY renkoMacd.py ./
COPY boot.sh ./

RUN chmod +x boot.sh

RUN conda env create -f environment.yml

RUN echo "source activate quant" &gt;. ~/.bashrc
ENV PATH /opt/conda/envs/quant/bin:$PATH

EXPOSE 5000

ENTRYPOINT ["./boot.sh"]