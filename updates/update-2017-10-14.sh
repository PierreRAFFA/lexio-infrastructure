#!/usr/bin/env bash

db.game.update({}, {$set:{"language": "en"}}, false, true);
db.ranking.update({}, {$set:{"language": "en"}}, false, true);

db.user.updateMany({}, {$rename: {"statistics.en_GB": "statistics.en"}})

Delphine
db.user.update({ "_id" : ObjectId("59e795c8785c4500152c9074")}, {$set: {"statistics.en.highestScoringWord": [ { "l" : "w", "t" : "bn", "p" : 95 }, { "l" : "i", "t" : "nm", "p" : 4 }, { "l" : "t", "t" : "nm", "p" : 8 }, { "l" : "s", "t" : "bn", "p" : 20 } ]}}, false, true)
db.user.update({ "_id" : ObjectId("59e795c8785c4500152c9074")}, {$set: {"statistics.en.longestWord": [ { "l" : "s", "t" : "nm", "p" : 4 }, { "l" : "c", "t" : "nm", "p" : 13 }, { "l" : "a", "t" : "nm", "p" : 7 }, { "l" : "n", "t" : "nm", "p" : 8 }, { "l" : "s", "t" : "nm", "p" : 4 } ]}}, false, true)

Albert
db.user.update({ "_id" : ObjectId("59e200c0ee7f090016cf8609")}, {$set: {"statistics.en.highestScoringWord": [ { "l" : "c", "t" : "bn", "p" : 65 }, { "l" : "u", "t" : "bn", "p" : 70 }, { "l" : "t", "t" : "bn", "p" : 40 }, { "l" : "e", "t" : "nm", "p" : 1 } ]}}, false, true)
db.user.update({ "_id" : ObjectId("59e200c0ee7f090016cf8609")}, {$set: {"statistics.en.longestWord": [ { "l" : "c", "t" : "nm", "p" : 13 }, { "l" : "i", "t" : "nm", "p" : 4 }, { "l" : "r", "t" : "nm", "p" : 8 }, { "l" : "c", "t" : "nm", "p" : 13 }, { "l" : "u", "t" : "nm", "p" : 14 }, { "l" : "s", "t" : "nm", "p" : 4 } ]}}, false, true)

Melanie
db.user.update({ "_id" : ObjectId("59b8589a0e81bd001587cf23")}, {$set: {"statistics.en.highestScoringWord": [ { "l" : "b", "t" : "nm", "p" : 17 }, { "l" : "r", "t" : "bn", "p" : 40 }, { "l" : "o", "t" : "bn", "p" : 45 }, { "l" : "o", "t" : "nm", "p" : 9 }, { "l" : "c", "t" : "bn", "p" : 65 }, { "l" : "h", "t" : "nm", "p" : 16 }  ]}}, false, true)
db.user.update({ "_id" : ObjectId("59b8589a0e81bd001587cf23")}, {$set: {"statistics.en.longestWord": [ { "l" : "s", "t" : "nm", "p" : 4 }, { "l" : "t", "t" : "nm", "p" : 8 }, { "l" : "r", "t" : "nm", "p" : 8 }, { "l" : "i", "t" : "nm", "p" : 4 }, { "l" : "v", "t" : "nm", "p" : 19 }, { "l" : "e", "t" : "nm", "p" : 1 }, { "l" : "s", "t" : "nm", "p" : 4 } ]}}, false, true)

Pierre
db.user.update({ "_id" : ObjectId("59b856330e81bd001587cf21")}, {$set: {"statistics.en.longestWord": [ { "l" : "c", "t" : "nm", "p" : 13 }, { "l" : "h", "t" : "nm", "p" : 16 }, { "l" : "o", "t" : "nm", "p" : 9 }, { "l" : "o", "t" : "nm", "p" : 9 }, { "l" : "s", "t" : "nm", "p" : 4 }, { "l" : "e", "t" : "nm", "p" : 1 }, { "l" : "r", "t" : "nm", "p" : 8 } ]}}, false, true)


db.user.updateMany({}, {$rename: {'statistics.en.totalWordsPerMinute': 'statistics.en.totalNumberWords'} })
db.user.updateMany({}, {$rename: {'statistics.en.highestWordsPerMinute': 'statistics.en.highestNumberWords'} })
db.user.updateMany({}, {$rename: {'statistics.en.averageWordsPerMinute': 'statistics.en.averageNumberWords'} })