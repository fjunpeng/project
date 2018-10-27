//引入所需要的包
const express=require('express');
const bodyParser=require('body-parser');
const user=require('./routes/user.js');
const index=require('./routes/index.js');
//1.使用express构建web服务器
var app=express();
app.listen(3000);
//2.托管静态资源
app.use(express.static('./static'));
//配置body-parser
app.use(bodyParser.urlencoded({
	extended:false
}));
//3.使用路由器管理用户模块下的路由
app.use('/user',user);
app.use('/index',index);