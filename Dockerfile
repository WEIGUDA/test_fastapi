FROM python:3.8

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PIPENV_IGNORE_PIPFILE 1
ENV PIPENV_SYSTEM 1

RUN pip install -i https://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com pipenv

WORKDIR /app
ADD Pipfile Pipfile.lock /app/
RUN pipenv install --dev --deploy --pypi-mirror https://mirrors.aliyun.com/pypi/simple/

ADD . /app

CMD ["python", "src/main/app.py"]
