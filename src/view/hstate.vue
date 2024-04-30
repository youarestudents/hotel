<template>
  <div class="body2">
  <h2 style="text-align: center;">查看房间</h2>
   <div>
    <ul>
      <li v-for=" (value,index) in data1 " :key='index' style="list-style: none;" ck>
        {{ index+1 }} . <span> 房间类型：{{ value.housename }}</span>&nbsp;&nbsp;&nbsp;&nbsp;
          <span>房间号：{{value.houseid}}</span>&nbsp;&nbsp;&nbsp;&nbsp;
          <span>租房时间：{{value.cometime |datefmt('YYYY-MM-DD')}}</span>&nbsp;&nbsp;&nbsp;&nbsp;
          <span>到期时间：{{value.gotime |datefmt('YYYY-MM-DD') }}</span>&nbsp;&nbsp;&nbsp;&nbsp;


      </li>
    </ul>
   </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      id:"",
      data1:[]

    }
  },
    mounted(){
     this.id=localStorage.id
       axios.get("http://localhost:8081/houseAll").then(response=>{
        
         for(var i=0;i<response.data.length;i++){
          if(response.data[i].id==this.id){
            this.data1.push(response.data[i])
             
          }
         }
       })
    }
}
</script>

<style scoped>
.body2{
  width: 80%;
  height: 600px;
}
ul li{
  margin-top: 10px;
  margin-left: 100px;
  width: 100%;
  height: 80px;
  background: rgba(0, 0, 255, 0.3);
}

</style>