<template>
  <div class="body1">
    <h2>原始数据</h2>
    <br />
    <span>房间号：{{ id }}</span> <br />
    <br />
    <span>房间类型：{{ type }} </span><br />
    <br />
    <span>修改房间号为:</span><br />
    <input type="text" v-model="houseid" /><br />
    <br />
    <span> 修改房间类型为：</span><br />
    <input type="text" v-model="housetype" />
    <br />
    <br />
    <el-row>
      <el-button type="primary" @click="submit">提交</el-button>
      <el-button>清空</el-button>
    </el-row>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      id: 0,
      type: "",
      houseid:0,
      housetype:""
    };
  },
  methods: {
    submit() {
        if(this.houseid!=0 && this.housetype!="" ){
            axios.post("http://localhost:8081/nhupdate", {
        houseid:this.houseid,
        type: this.housetype,
        id: this.id
      }).then((response) => {
        console.log(response);
      });
        } else if(this.houseid==0 && this.housetype!=""){
            axios.post("http://localhost:8081/nhupdate", {
        id:this.id,
        type: this.housetype,
        id: this.id
      }).then((response) => {
        console.log(response);
      });
            
        } else if(this.houseid!=0 && this.housetype==""){
            axios.post("http://localhost:8081/nhupdate", {
        id:this.houseid,
        type: this.type,
        id: this.id
      }).then((response) => {
        console.log(response);
      });
        } else{
            axios.post("http://localhost:8081/nhupdate", {
        id:this.id,
        type: this.type,
        id: this.id
      }).then((response) => {
        console.log(response);
      });

        }
        alert("修改成功")
    
    },
  },

  mounted() {
    this.id = this.$route.query.id;
    this.type = this.$route.query.type;
  },
};
</script>

<style scoped>
.body1 {
  position: relative;
  top: 400px;
  font-size: 20px;
}
.body1 input {
  width: 200px;
  height: 30px;
}
</style>