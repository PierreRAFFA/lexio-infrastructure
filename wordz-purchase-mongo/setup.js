let res = [
  db.getName(),
  db.auth('admin', 'password'),
  mainDb = db.getSiblingDB('purchase'),
  mainDb.createUser({ user: 'api', pwd: 'password', roles: ['readWrite'] })
];

print('==============');
printjson(res);
print('==============');