//引入模块
const express=require('express');
const pool=require('../pool.js');
const router=express.Router();
//注册页面
router.get('/checkUname',(req,res)=>{
	var $uname=req.query.uname;
	if(!$uname){
			res.send("用户名不能为空");
			return;
		}
	var sql='select * from my_music_user where uname=?';
	pool.query(sql,[$uname],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send("1")
		}else{
			res.send("0")	
		}
	})
})
router.post('/register',(req,res)=>{
	var $uname=req.body.uname;
	var $upwd=req.body.upwd;
	var $cpwd=req.body.cpwd;
	var $email=req.body.email;
	var $gender=req.body.gender;
	if(!$uname){
	res.send({code:'请输入用户名',msg:'uname required'});
	return;
	}
	if(!$upwd){
	res.send({code:'请输入用户密码',msg:'upwd required'});
	return;
	}
	if(!$email){
	res.send({code:'请输入用户邮箱',msg:'email required'});
	return;
	}
	if(!$gender){
	res.send({code:'请输入性别',msg:'gender required'});
	return;
	}
	var sql='insert into my_music_user values(NULL,?,?,?,?)';
	pool.query(sql,[$uname,$upwd,$email,$gender],(err,result)=>{
		if(err) throw err;
		res.send('您已注册成功！欢迎加入图图')
	})	
})
//登录页面
router.get('/login',(req,res)=>{
	var obj=req.query;
	var $uname=obj.uname;
	var $upwd=obj.upwd;
	if(!$uname){
			res.send("用户名不存在");
			return;
	}
	if(!$upwd){
			res.send("用户密码不存在");
			return;
	}
	var sql='select * from my_music_user where uname=? and upwd=?';
	pool.query(sql,[$uname,$upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send('登录成功')
		}else{
			res.send('用户名或密码错误')	
		}	
	})
});
//导出路由器
module.exports=router;
