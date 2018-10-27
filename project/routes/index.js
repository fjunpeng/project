const express=require('express');
const router=express.Router();
const pool=require('../pool.js');
router.get('/',(req,res)=>{
    var sql="SELECT * FROM `hot_pushmusic`  ORDER BY `hot_pushmusic`.`pid` ASC";
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send(result)
    })
})
// 热门歌手推荐
router.get('/singer',(req,res)=>{
    var sql="SELECT * FROM `side_singer` ORDER BY `side_singer`.`pid` ASC";
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        res.send(result)
    })
})
module.exports=router;