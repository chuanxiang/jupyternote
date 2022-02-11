FROM python:3.10-slim

LABEL author=chuanxiang

RUN adduser noteuser && \
    mkdir -p /home/noteuser && \
    mkdir -p /home/noteuser/workspace

USER noteuser

WORKDIR /home/noteuser 

RUN python -m venv env_note && \
    . env_note/bin/activate && \
    pip install -U pip && \
    pip install --no-cache-dir pandas matplotlib seaborn jupyter

RUN echo "cd /home/noteuser && . env_note/bin/activate && cd workspace && jupyter notebook --ip 0.0.0.0" > /home/noteuser/run.sh

CMD ["bash", "/home/noteuser/run.sh"]

