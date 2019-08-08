X: db.infos.aggregate({"$project:{"address":1}},{"$group":{"_id":"$address","count":{"$sum":1}}},{"$sort":{"count":-1}},{"$limit":5});

//查看数据库中所有地址指令总数统计情况
db.infos.aggregate({"$group":{"_id":"$address","count":{"$sum":1}}},{"$sort":{"count":-1}},{"$limit":50});
db.infos.aggregate({"$group":{"_id":"$address","count":{"$sum":1}}},{"$sort":{"_id":1}},{"$limit":50});


//查看数据库中某个地址指令分类总数统计情况
db.infos.aggregate({"$match":{"address":242001}},{"$group":{"_id":"$data.type","count":{"$sum":1}}},{"$sort":{"count":-1}});








xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

> db.infos.find({"data.type":"fault_state"},{}).count();
13001
> db.infos.find({"data.type":"fault_state","data.args.flag":true},{}).count();
6495
> db.infos.find({"data.type":"fault_state","data.args.flag":false},{}).count();
6506
> db.infos.find({"address":242001,"data.type":"fault_state","data.args.flag":false},{}).count();
307
//查询某个电台的故障状态的信息
> db.infos.find({"data.type":"fault_state","address":242008,"data.args.flag":false},{}).count();
315
//查询某个电台的故障状态的信息 按照时间排序 
> db.infos.find({"data.type":"fault_state","address":242008,"data.args.flag":false},{"_id":0,"time":1,"data":1}).sort({"time":1});
{ "time" : ISODate("2000-02-02T18:12:30.820Z"), "data" : { "msg" : "report", "type" : "fault_state", "addr" : 241022, "args" : { "flag" : false, "code" : [ 230, 231 ] } } }

//查询某个电台的故障状态的信息-分类
db.infos.aggregate({"$match":{"address":242001}},{"$group":{"_id":"$data.type","count":{"$sum":1}}},{"$sort":{"count":-1}});

//查询本地电台位置信息 按照时间排序
> db.infos.find({"data.type":"local_position","address":242008,"data.args.flag":false},{"_id":0,"time":1,"data":1}).sort({"time":1});


{ "_id" : ObjectId("5d43ebb2e66972299c9d3ce3"), "address" : 242001, "time" : ISODate("2072-07-21T04:18:09.635Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241020, "args" : { "flag" : false, "code" : [ 229, 234 ] } } }
{ "_id" : ObjectId("5d43f1c17d49801668e065f5"), "address" : 242001, "time" : ISODate("2043-09-24T03:10:47.750Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241012, "args" : { "flag" : false, "code" : [ 227, 230 ] } } }
{ "_id" : ObjectId("5d44071309fd9a2d404104a0"), "address" : 242001, "time" : ISODate("2070-03-10T20:22:25.272Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241008, "args" : { "flag" : false, "code" : [ 231, 231 ] } } }
{ "_id" : ObjectId("5d44071309fd9a2d404104a9"), "address" : 242001, "time" : ISODate("2006-05-09T18:09:51.780Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241017, "args" : { "flag" : false, "code" : [ 231, 228 ] } } }
{ "_id" : ObjectId("5d44071309fd9a2d404104c0"), "address" : 242001, "time" : ISODate("2033-09-04T04:16:19.114Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241022, "args" : { "flag" : false, "code" : [ 234, 231 ] } } }
{ "_id" : ObjectId("5d4407224b2c6c2af0042f49"), "address" : 242001, "time" : ISODate("2037-07-05T19:02:18.682Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241011, "args" : { "flag" : false, "code" : [ 232, 226 ] } } }
{ "_id" : ObjectId("5d4407224b2c6c2af0042f60"), "address" : 242001, "time" : ISODate("2059-08-21T20:18:55.720Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241012, "args" : { "flag" : false, "code" : [ 225, 232 ] } } }
{ "_id" : ObjectId("5d4407224b2c6c2af0042fa0"), "address" : 242001, "time" : ISODate("2017-11-06T11:22:26.771Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241016, "args" : { "flag" : false, "code" : [ 226, 234 ] } } }
{ "_id" : ObjectId("5d44072cc0ac1d19187989d4"), "address" : 242001, "time" : ISODate("2043-05-12T01:22:22.786Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241010, "args" : { "flag" : false, "code" : [ 229, 233 ] } } }
{ "_id" : ObjectId("5d44072cc0ac1d19187989f1"), "address" : 242001, "time" : ISODate("2091-04-08T20:03:15.508Z"), "data" : { "msg" : "report", "type" : "fault_s
tate", "addr" : 241006, "args" : { "flag" : false, "code" : [ 227, 233 ] } } }








xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
