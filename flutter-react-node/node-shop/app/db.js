const config = require("./config");
var mysql = require('mysql');

var pool = mysql.createPool({
    connectionLimit: 10,
    host:config.DB_HOST,
    user:config.DB_USER,
    password:config.DB_PASSWORD,
    database:config.DB_NAME,
    multipleStatements:true,
});

//执行sql语句
let exec = (sql,params = [],callBack) => {
    //建立链接
    pool.getConnection((err,conn) => {
        if(err){
            console.log(err.message);
        }
        conn.query(sql,params,(error,results,fields) => {
            //将链接返回到连接池中,准备由其他人重复使用
            conn.release();
            if (error){
                console.log(error.message);
            }
            //执行回调函数,将数据返回
            if(callBack){
                callBack(results,fields);
            }
        });
    });
};

module.exports = {
    exec,
}