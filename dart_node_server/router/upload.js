const express = require('express');
const router = express.Router();
//文件传输
const multer = require('multer');
const upload = multer();
//图片处理
const images = require("images");
//uuid
const uuidv1 = require('uuid/v1');

router.post("/", upload.single('file'), function (req, res) {
    //处理原文件名
    var originalName = req.file.originalname;
    var formate = originalName.split(".");
    //扩展名
    var extName = "." + formate[formate.length - 1];
    var filename = uuidv1();
    //储存文件夹
    var fileFolder = "/images/common/";
    //处理图片
    images(req.file.buffer)
        .save("public" + fileFolder + filename + extName, {
            quality: 70 //保存图片到文件,图片质量为70
        });
    var data = {
        "code":"0",
        "message":"图片上传处理成功",
        "data":[
            {
                "path":fileFolder + filename + extName,
            },
        ]
    };
    res.send(data);

});

module.exports = router;