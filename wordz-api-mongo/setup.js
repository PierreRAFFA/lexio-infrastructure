let res = [
  db.getName(),
  db.auth('admin', 'password'),
  mainDb = db.getSiblingDB('wordz-api'),
  mainDb.createUser({ user: 'api', pwd: 'password', roles: ['readWrite'] })
];;

print('==============');
printjson(res);
print('==============');