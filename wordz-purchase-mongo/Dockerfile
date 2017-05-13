FROM mongo

COPY setup.js /docker-entrypoint-initdb.d/

CMD ["mongod", "--auth", "--smallfiles"]