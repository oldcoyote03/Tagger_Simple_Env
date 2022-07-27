# syntax=docker/dockerfile:1.0
FROM python:3.8.12-slim-buster
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install git
RUN python -m pip install --upgrade pip
ENV SQLALCHEMY_DATABASE_URI=cockroachdb://root@roach:26257/tagger_db?sslmode=disable
WORKDIR /
ADD https://api.github.com/repos/oldcoyote03/Tagger_App/git/refs/heads/develop version.json
RUN git clone https://github.com/oldcoyote03/Tagger_App.git tagger_api
WORKDIR /tagger_api
RUN git checkout "develop"
RUN pip install -r requirements.txt
CMD [ "python", "./run.py"]