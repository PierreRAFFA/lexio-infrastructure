const res = [
  db.getName(),
  db.auth('{{mongoInitDbRootUsername}}', '{{mongoInitDbRootPassword}}'),
  mainDb = db.getSiblingDB('authentication'),
  mainDb.createUser({ user: 'api', pwd: '{{mongoApiPassword}}', roles: ['readWrite'] })
];

print('==============');
printjson(res);
print('==============');