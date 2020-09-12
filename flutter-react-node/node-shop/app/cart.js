import express from 'express';
var router = express.Router();
let db = require('./db');
var router = express.Router();

/**
 * 客户端获取购物车列表
 */
router.get('/client/cart/list',(req,res) => {

    let {user_id} = req.query;

    let sql = `select * from shop_cart where user_id = ?`;
	
	db.exec(sql,[user_id],(results,fields) => {
		res.json({
			code:0,
            message:'查询购物车列表成功',
            data: {
                list:results,
            }
		});
	});
});


//客户端购物车更新
router.post('/client/cart/update',(req,res) => {
    let { id,good_count,is_checked } = req.body;
    let sql = `UPDATE shop_cart SET good_count = ?,is_checked = ? WHERE id = ?`;

        db.exec(sql,[good_count,is_checked,id],(results,fields) => {

            let sql_list = `select * from shop_cart`;
	
            db.exec(sql_list,[],(results,fields) => {
                res.json({
                    code:0,
                    message:'Success! ',
                    data: {
                        list:results,
                    }
                });
            });
        });
});


//添加商品至购物车
router.post('/client/cart/add',(req,res) => {
    let {user_id,good_id, good_count,good_name,good_price,good_image } = req.body;
    // 检查购物车是否已经有此商品
    let sql = `select * from shop_cart where good_id = ?`;

    db.exec(sql,[good_id],(results,fields) => {

        //没有此商品插入一条新记录
        sql = `insert into shop_cart (user_id,good_id, good_count,good_name,good_price,good_image) 
        value (${user_id} , ${good_id} , ${good_count}, '${good_name}', ${good_price}, '${good_image}')`;

        // 已有此商品,增加数量
        if(results.length > 0){
            sql = `update shop_cart SET good_count = good_count + ${good_count} WHERE good_id = ${good_id} AND user_id = '${user_id}'`;
        }

        db.exec(sql,[],(results,fields) => {
            res.json({
                code:0,
                message:'Success! ',
            });
        });
	});
});

//购物车删除商品
router.post('/client/cart/delete',(req,res) => {
    let { id } = req.body;
    let sql = `delete from shop_cart where id = ?`;
    db.exec(sql,[id],(results,fields) => {
       
        let sql_list = `select * from shop_cart`;
	
        db.exec(sql_list,[],(results,fields) => {
            res.json({
                code:0,
                message:'Success! ',
                data: {
                    list:results,
                }
            });
        });
	});
});

module.exports = router;