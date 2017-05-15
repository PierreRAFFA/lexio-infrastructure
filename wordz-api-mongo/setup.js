const res = [
  db.getName(),
  db.auth('$mongoInitDbRootUsername', '$mongoInitDbRootPassword'),
  mainDb = db.getSiblingDB('api'),
  mainDb.createUser({ user: 'api', pwd: '$mongoApiPassword', roles: ['readWrite'] })
];

print('==============');
printjson(res);
print('==============');