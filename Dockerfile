FROM python:3.7

RUN pip install pipenv
WORKDIR /usr/src/app
COPY Pipfile* ./
RUN pipenv install --system --deploy

COPY . .

CMD pipenv run gunicorn --bind :$PORT polls.wsgi
