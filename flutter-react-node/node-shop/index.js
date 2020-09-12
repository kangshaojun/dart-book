import express from 'express';
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var jwt = require('jsonwebtoken');
var path = require('path');
var config = require("./app/config");

let app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended:true
}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname,'public')));

// //添加拦截器
app.use((req, res, next) =>{
    // 获取请求头中的Authorization认证字符
    let token = req.get('Authorization'); 
    console.log(req.path);
    //排除不需要授权的路由
    if(req.path === '/api/user/login' || 
       req.path === '/api/user/register' ||
       req.path === '/api/client/home/content' ||
       req.path === '/api/client/good/detail' ||
       req.path === '/api/client/category/first'||
       req.path === '/api/client/category/second'||
       req.path === '/api/client/category/good/first' ||
       req.path === '/api/client/category/good/second' ||
       req.path === '/client/category/good/list'
      //  req.path === '/api/client/cart/list' ||
      //  req.path === '/api/client/cart/update' ||
      //  req.path === '/api/client/cart/delete'||
      //  req.path === '/api/client/cart/add' || 
      //  req.path === '/api/client/order/add' || 
      //  req.path === '/api/client/order/list'
       ) {
      next()
    } else{
      jwt.verify(token, "secret",  (err, decode) => {
        if (err) {
          console.log("认证无效,请重新登录.");
          res.status(403).send('认证无效,请重新登录.');
        } else {
          next();
        }
      })
    }
  })
  

app.use('/api',require('./app/user'));
app.use('/api',require('./app/category'));
app.use('/api',require('./app/good'));
app.use('/api',require('./app/upload'));
app.use('/api',require('./app/home'));
app.use('/api',require('./app/cart'));
app.use('/api',require('./app/order'));

app.listen(config.PORT,() => {
    console.log('服务启动完成:8000');
})