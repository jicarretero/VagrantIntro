FROM ubuntu:20.04

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt -y update && \
apt install -y python3-pip r-base python-dev && \
pip3 install jupyter notebook voila numpy matplotlib pandas && \
mkdir /.jupyter && \
echo "install.packages('IRkernel') ; IRkernel::installspec(user = FALSE)" | R --no-save

COPY jupyter_notebook_config.json /.jupyter

EXPOSE 8888
USER 9900

ENTRYPOINT jupyter notebook --no-browser --ip 0.0.0.0 --port 8888 --config=/.jupyter/jupyter_notebook_config.json

