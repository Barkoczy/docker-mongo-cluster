FROM mongo:latest

COPY ./mongodb.key /etc/mongodb.key

RUN chown mongodb:mongodb /etc/mongodb.key
RUN chmod 400 /etc/mongodb.key