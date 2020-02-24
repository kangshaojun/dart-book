const express = require("express");
const router = express();

router.get("/",(req,res) => {
    var data = {
        "code":"-1",
        "message":"failed",
        "data":[]
    };
    
    res.status(500).send(data);
   
});

module.exports = router;