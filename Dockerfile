FROM python:3.6

MAINTAINER Bjoern Stierand <bjoern-github@innovention.de>

# These steps follow the official installation docs at
# http://trigger-happy.readthedocs.io/en/latest/quickstart.html

# clone Trigger Happy and install dependencies
RUN mkdir /triggerhappy && \
    git clone https://github.com/foxmask/django-th /triggerhappy && \
    pip install 'Django<1.9a' && \
    pip install django-formtools arrow==0.6.0 django-js-reverse django-redis requests-oauthlib feedparser

WORKDIR /triggerhappy
RUN python manage.py migrate

# TODO: create super user (requires TTY)
# python manage.py createsuperuser

EXPOSE 8000

CMD python manage.py runserver