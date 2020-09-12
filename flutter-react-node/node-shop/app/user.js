import express from 'express';
let db = require('./db');
var router = express.Router();
var jwt = require("jsonwebtoken");

//管理员登录 Authorization: `Bearer ${token}`
router.post('/user/login',(req,res) => {
    let {username,password} = req.body;
    console.log(username);
    //查询帐户数据
    let sql = `select * from shop_user where username = ? and password = ?`;
	db.exec(sql,[username,password],(results,fields) => {
        console.log(results[0]);
        // 帐号密码错误
        if(!results.length){
            res.json({
                code:1000,
                message:"帐号或密码错误",
                data: results
            });
            return false;
        }
        let {id} = results[0];
        console.log(results[0]['phone']);
        // 登录成功
        let payload = {
            id,
            username,
        }

        // 生成token "1d", "20h", 60
        let token = jwt.sign(payload,'secret',{expiresIn:'365d'});
        console.log("生成的token:" + token);
        res.json({
            code:0,
            message:'登录成功',
            data: {
                token,
                id,
                username:results[0]['username'],
                mobile:results[0]['mobile'],
                address:results[0]['address'],
                head_image:results[0]['head_image'],
            }
        });
	});
});


//注册
router.post('/user/register',(req,res)  => {
    let {username,password,mobile,address} = req.body;
    //查询帐户是否存在
    let sql = `select * from shop_user where username = ?`;
	db.exec(sql,[username],(results,fields) => {
        if(results.length){
            res.json({
                code:1001,
                message:"帐号已经存在",
                data: results
            });
            return false;
        }
        let sql = `insert into shop_user (username,password,mobile,address) values (?,?,?,?)`;
        db.exec(sql,[username,password,mobile,address],(results,fields) => {
            // 登录成功
            let payload = {
                username,
            }
            // 生成token
            let token = jwt.sign(payload,'secret',{expiresIn:'365d'});
            
            // 存储成功
            res.json({
                code:0,
                message:'注册成功',
                data: {
                    token,
                    id:results.insertId,
                    username,
                }
            });
        });
    });
});

router.get('/admin/user/list',(req,res)  => {
    //查询帐户数据
    let sql = `select id,username,head_image,mobile,address from shop_user order by id`;
	db.exec(sql,[],(results,fields) => {
        if(!results.length){
            res.json({
                code:1002,
                message:"获取用户列表失败",
                data: results
            });
            return false;
        }
		res.json({
			code:0,
            message:'获取成功',
            data: results
		});
	});
});

module.exports = router;