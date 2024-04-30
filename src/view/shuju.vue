<template>
  <div class="body1">
    <div class="header">
      <input type="text" v-model="text" @change="find" />
      <el-button type="primary" icon="el-icon-search" @click="find"
        >搜索</el-button
      >
    </div>

    <div class="table">
      <ul class="infinite-list" v-infinite-scroll="load" style="overflow: auto">
        <li v-for="i in data1.length" class="infinite-list-item">
          <el-row>
            <div style="display: inline-block; width: 80%">
              <span>{{ data1[i - 1].houseid }}----{{ data1[i - 1].type1 }}</span>
            </div>
               <router-link :to="{
                path:'/xiugai',
                query:{
                  id:data1[i-1].houseid,
                  type:data1[i-1].type1
                }
               }" class="infinite-list-item" > 
                  <el-button type="primary">修改</el-button></router-link>
          
            <el-button type="danger" @click="dele(i-1)">删除</el-button>
          </el-row>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      data1: [],
      datax: [],
      count: 0,
      text: "",
    };
  },
  methods: {
    load() {
      this.count = this.data1.length;
    },
    find() {
      var data2 = [];
      var n = 0;
      for (var i = 0; i < this.datax.length; i++) {
        if (
          this.datax[i].houseid == this.text ||
          this.datax[i].type1 == this.text
        ) {
          data2[n] = this.datax[i];
          n++;
        }
      }
      this.data1 = data2;
      if (this.text == "") {
        this.data1 = this.datax;
      }
    },
    dele(x){
      axios.post("http://localhost:8081/nhdele",{
        houseid:this.data1[x].houseid,
        type:this.data1[x].type1

      }).then(response=>{
        console.log(response.data)
        alert("删除成功")
      })
      this.data1.splice(x,1)
    }
  },
  created() {
    axios.get("http://localhost:8081/nullhouse").then((response) => {
      this.data1 = response.data;
      this.datax = response.data;
    
    });
  },
};
</script>

<style scoped>
.body1 {
  width: 100%;
}
.table ul {
  list-style-type: none;
  width: 100%;
  height: 650px;

  position: relative;
  top: 750px;
  left: 150px;
  /* border: 1px solid black; */
}
ul li {
  margin-top: 25px;
}
.header {
  width: 100%;
  height: 100px;
  position: relative;
  top: 800px;
  right: -10%;
}
.header input {
  width: 500px;
  height: 35px;
  margin-right: 6px;
  margin-left: 600px;
}
</style>