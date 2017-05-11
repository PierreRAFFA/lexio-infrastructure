FROM mongo

#RUN su - mongodb -c "mongod" & sleep 5; mongo --eval "\
#db.createUser({ user: 'admin', pwd: 'password', roles:['root']})" admin

#RUN rm /tmp/mongodb-*.sock
CMD ["mongod", "--auth", "--smallfiles"]