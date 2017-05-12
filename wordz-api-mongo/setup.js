let error = true;

let res = [
  db.getName(),
  db.auth("admin", "password"),
  purchase = db.getSiblingDB('wordz-purchase'),
  purchase.createUser({ user: "api", pwd: "password", roles: ["readWrite"] })
]

print("==============")
print(db)
printjson(res)
print("==============")
// printjson(res);

// if (error) {
//   print('Error, exiting')
//   print(error)
//   quit(1)
// }