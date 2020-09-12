let db = require('./db');
var express = require('express');
var router = express.Router();

//添加商品
router.post('/admin/good/add/',(req,res) =>{
    let sql = `insert into shop_good (category_first,category_second,name,price,discount_price,count,good_sn,images,detail,freight) values (?,?,?,?,?,?,?,?,?,?) `;
	db.exec(sql,[req.body.category_first, req.body.category_second, req.body.name, req.body.price,
        req.body.discount_price, req.body.count, req.body.good_sn, req.body.images, req.body.detail, req.body.freight
    ],(results,fields) => {
		res.json({
			code:0,
            message:'添加商品成功',
            data:{
                id:results.insertId
            }
		});
	});
});

//修改商品
router.post('/admin/good/edit/',(req,res) =>{
    let sql = `update shop_good set category_first=?,category_second=?,name=?,price=?,discount_price=?,count=?,good_sn=?,images=?,detail=?,freight=? where id=?`;
	db.exec(sql,[req.body.category_first, req.body.category_second, req.body.name, req.body.price,
        req.body.discount_price, req.body.count, req.body.good_sn,req.body.images, req.body.detail, req.body.freight, req.body.id
    ],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'修改商品成功',
            data: results[0]
		});
	});
});

//商品列表
router.get('/admin/good/list/',(req,res) =>{
    let query = req.query;
    //取出空键值对
    for(let key in query){
        if(!query[key]){
            delete query[key]
        }
    }
    //拼接SQL
    function processSql({pageSize =10, pageIndex = 1, sortByPrice = '', category_first = '', category_second = ''}){
        let size = pageSize;
        let count = size * (pageIndex - 1);
        let sql = `select id,name,price,good_sn,images,count from shop_good `
        if (category_first){
            sql += `where category_first = ${category_first}`;
        }
        if (category_second){
            sql += ` and category_second = ${category_second}`;
        }
        sql += ` order by price ${sortByPrice} limit ${count},${size}`
        return sql;
    }

	db.exec(processSql(req.query),[],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'获取商品列表成功',
            data: results
		});
	});
});

//商品详情
router.get('/admin/good/detail/',(req,res) =>{
    let sql = `select * from shop_good where id = ?`;

	db.exec(sql,[req.query.id],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'获取商品详情成功',
            data: results[0]
		});
	});
});

//删除商品
router.post('/admin/good/delete/',(req,res) =>{
    let sql = `delete from shop_good where id = ?`;

	db.exec(sql,[req.body.id],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'删除商品成功',
            data: results[0]
		});
	});
});


//客户端获取商品详情
router.get('/client/good/detail/',(req,res) =>{
    let sql = `select * from shop_good where id = ?`;

	db.exec(sql,[req.query.id],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'获取商品详情成功',
            data: results[0]
		});
	});
});

module.exports = router;