const express = require("express");
const router = express();
const config = require("./config");
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended:false});

router.post("/",urlencodedParser,(req,res) => {
    var id = req.body.id;
    console.log(id);
    var users = {
        "code":"0",
        "message":"success",
        "data":[
            {
                "name": "张三",
                "age": 20,
            },
            {
                "name": "李四",
                "age": 30,
            },
            {
                "name": "王五",
                "age": 28,
            },
        ]
    };
    res.send(users);

});

module.exports = router;