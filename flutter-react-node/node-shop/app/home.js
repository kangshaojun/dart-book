let db = require('./db');
var express = require('express');
var router = express.Router();
const config = require("./config");

//商城首页内容
router.get('/client/home/content/',(req,res) =>{

    let goodSql = `select id,name,price,discount_price,good_sn,images from shop_good limit 0,8 `
    
	db.exec(goodSql,[],(goodResult,fields) => {

        let categorySql = `select * from shop_category where level = 'V1' `;

        db.exec(categorySql,[],(categoryResult,fields) => {

            res.json({
                code:0,
                message:'获取商城首页数据成功',
                data: {
                    "category":categoryResult,
                    "banners": [
                        {
                        "image": config.IMAGE_URL + "/images/banner/1.jpeg",
                        }, 
                        {
                            "image": config.IMAGE_URL + "/images/banner/2.jpeg",
                        },
                        {
                            "image": config.IMAGE_URL + "/images/banner/3.jpeg",
                        },
                        {
                            "image": config.IMAGE_URL + "/images/banner/4.jpeg",
                        },
                    ],
                    "goods":goodResult,
                }
            });
        });
	});
});

module.exports = router;