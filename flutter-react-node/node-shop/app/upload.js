import express from 'express';
var router = express.Router();
var router = express.Router();
//文件传输
let multer = require('multer');
let upload = multer();
let images = require('images');
let uuidv1 = require('uuid/v1');
var config = require("./config");

router.post("/admin/upload/category", upload.single('file'), (req,res) => {
    doUpload(req,res,'category');
});

router.post("/admin/upload/images", upload.single('file'), (req,res) => {
    doUpload(req,res,'good');
});

router.post("/admin/upload/editor", upload.single('file'), (req,res) => {
    doUpload(req,res,'detail');
});

let doUpload = (req,res,path) => {
    //处理原文件名
    var originalName = req.file.originalname;
    var formate = originalName.split(".");
    //扩展名
    var extName = "." + formate[formate.length - 1];
    var filename = uuidv1();
    //储存文件夹
    var fileFolder = "/images/" + path + "/";
    //处理图片
    images(req.file.buffer).save("public" + fileFolder + filename + extName, {
        quality: 100 //保存图片到文件,图片质量为100
    });
    //返回储存结果
    res.json({
        code: 0,
        message: "图片上传处理成功",
        url: config.IMAGE_URL + fileFolder + filename + extName
    });
}

module.exports = router;