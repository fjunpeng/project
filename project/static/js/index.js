new Vue({
   el:"#main>div:first-child>div:nth-child(2)",
   data:{
       res:[]
   },
   created(){
    (async function(self){
        var res=await axios.get("http://127.0.0.1:3000/index/");
        self.res=res.data;
      })(this)
   }
});
(async function(){
    var res=await ajax({
        url:"http://127.0.0.1:3000/index/singer",
        type:"get",
        dataType:"json"
    });
    console.log(res)
    var html="";
    for(var i=0;i<res.length;i++){
        var {img,sname,title}=res[i]
        html+=`<li class="my_bgcolor1 mb-3">
        <a href="#" class="d-flex">
            <img src="${img}">
            <div>
                <h6 class="font-weight-bold text-dark mb-0 pl-3 mb-2 mt-1">${sname}</h6>
                <span class="text-muted my_small pl-3">${title}</span>
            </div>
        </a>
    </li>`
    }
    var prev=document.querySelector("#main>div:nth-child(2)>div:nth-child(2)>ul")
    prev.innerHTML=html
})()




	 