FROM python:3.7-alpine as base
LABEL key="Roy Barak Devs"

ENV PTYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
COPY requirements.base.txt /app
RUN pip install --upgrade pip 
#RUN pip install cython
RUN pip install --upgrade pip -r requirements.base.txt

RUN adduser -D user
USER user                       
#################### start a new image for debug based on "base" ##############
FROM base as dev 

# Install Python dependencies from debug/dev
COPY requirements.dev.txt /app
RUN pip install -r requirements.dev.txt

#run VSCode debugger
CMD python -m ptvsd --host 0.0.0.0 --port 5678                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              --wait --nostatic --multiprocess manage.py runserver 0.0.0.0:8000


#################### start a new image for debug based on "base" ##############
FROM base as prod 

# Add the rest of the code
COPY . /app

# Install Python dependencies from debug/dev
RUN pip install --upgrade pip -r requirements.prod.txt

# Make port 8000 available for the app
EXPOSE 8000

# Collect static files
#RUN python manage.py collectstatic --noinput

# Be sure to use 0.0.0.0 for the host within the Docker container,
# otherwise the browser won't be able to find it
#CMD gunicorn www.wsgi:application --bind 0.0.0.0:8000

