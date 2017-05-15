const res = [
  db.getName(),
  db.auth('$mongoInitDbRootUsername', '$mongoInitDbRootPassword'),
  mainDb = db.getSiblingDB('purchase'),
  mainDb.createUser({ user: 'api', pwd: '$mongoApiPassword', roles: ['readWrite'] })
];

print('==============');
printjson(res);
print('==============');