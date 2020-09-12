import express from 'express';
var router = express.Router();
let db = require('./db');
var router = express.Router();

//查询所有分类
router.get('/admin/category/all/',(req,res) => {
    let sql = `select * from shop_category`;
	db.exec(sql,[],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'查询所有分类成功',
            data:results
		});
	});
});

//添加分类
router.post('/admin/category/add/',(req,res) => {
    let {name,pid,level,image} = req.body;
    let sql = `insert into shop_category (name,pid,level,image) values (?,?,?,?) `;
	db.exec(sql,[name,pid,level,image],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'添加分类成功',
            data:{
                id:results.insertId
            }
		});
	});
});

//更新分类
router.post('/admin/category/edit/',(req,res) => {
    let {name,pid,level,image,id} = req.body;
    let sql = `update shop_category set name = ?,pid = ?,level = ? , image = ? where id = ? `;
	db.exec(sql,[name,pid,level,image,id],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'更新分类成功'
		});
	});
});

//删除分类
router.post('/admin/category/delete/',(req,res) => {
    let sql = `delete from shop_category where id = ? `;
	db.exec(sql,[req.body.id],(results,fields) => {
        //成功
        res.json({
            code:0,
            message:'删除分类成功'
        });
	});
});

//获取子分类
router.get('/admin/category/sub/',(req,res) => {
    let sql = `select * from shop_category where pid = ? `;
	db.exec(sql,[req.query.pid],(results,fields) => {
        //成功
        res.json({
            code:0,
            message:'获取子分类成功',
            data:results
        });    
	});
});



//客户端获取一级分类
router.get('/client/category/first/',(req,res) => {
    let sql = `select * from shop_category where level = 'V1'`;
	db.exec(sql,[],(results,fields) => {
        //成功
		res.json({
			code:0,
            message:'获取一级分类成功',
            data:{
                'list':results,
            }
		});
    });
    
});


//客户端取二级分类
router.get('/client/category/second/',(req,res) => {
    let sql = `select * from shop_category where pid = ? `;
	db.exec(sql,[req.query.pid],(results,fields) => {
        //成功
        res.json({
            code:0,
            message:'获取二级分类成功',
            data:{
                'list':results,
            }
        });    
	});
});



//客户端获取一级分类商品
router.get('/client/category/good/list',(req,res) =>{

    let query = req.query;
    //取出空键值对
    for(let key in query){
        if(!query[key]){
            delete query[key]
        }
    }
    //拼接SQL
    function processSql({page_size = 4, page_index = 1, category_first = '', category_second = ''}){
        let size = page_size;
        let count = size * (page_index - 1);
        let sql = `select id,name,price,discount_price,good_sn,images from shop_good `
        if (category_first){
            sql += `where category_first = ${category_first}`;
        }
        if (category_second && category_second != 0){
            sql += ` and category_second = ${category_second}`;
        }
        sql += ` limit ${count},${size}`;
        console.log(sql);
        return sql;
    }

	db.exec(processSql(req.query),[],(results,fields) => {

        if(results.length > 0){
            //成功
            res.json({
                code:0,
                message:'获取商品列表成功',
                data: {
                    "list":results,
                }
            });
        }else{
            res.json({
                code:0,
                message:'获取商品列表成功',
                data: {
                    "list":[],
                }
            });
        }

        
	});


});

module.exports = router;