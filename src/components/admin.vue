<template>
  <div class="back">
    <br />
    <br />
    <br />
    <div class="denglu" v-if="user">
      <h1>酒店登录</h1>
      <span>账号：</span>
      <input
        type="text"
        placeholder="请输入账号"
        style="margin-top: 60px"
        v-model="username"
      />
      <br />
      <br />
      <br />
      <span>密码：</span>
      <input type="password" placeholder="请输入密码" v-model="password" />
      <br />
      <br />
      <el-row>
        <router-link active-class="active" to="./ushow">
          <el-button
          type="primary"
          style="height: 50px; width: 150px"
          @click="toUser"
          >登录</el-button
        >
        </router-link>
       
        <br />

        <span
          style="margin-left: 450px; cursor: pointer; color: blue"
          @click="madmin2"
        >
          管理员登录</span
        >
        <span
          style=" float: left; cursor: pointer; color: blue"
          @click="zhuce1"
        >
          用户注册</span
        >
      </el-row>
    </div>

    <div class="denglu" v-if="manager">
      <h1>管理员登录</h1>
      <span>账号：</span>
      <input
        type="text"
        placeholder="请输入账号"
        style="margin-top: 60px"
        v-model="username"
      />
      <br />
      <br />
      <br />
      <span>密码：</span>
      <input type="password" placeholder="请输入密码" v-model="password" />
      <br />
      <br />
      <el-row>
        <el-button
          type="primary"
          style="height: 50px; width: 150px"
          @click="toManger"
          >登录</el-button
        >
        <br />

        <span
          style="margin-left: 450px; cursor: pointer; color: blue"
          @click="madmin1"
        >
          用户登录</span
        >
        <span
          style=" float: left; cursor: pointer; color: blue"
          @click="zhuce1"
        >
          用户注册</span
        >
      </el-row>
    </div>
    <div class="denglu" v-if="zhuce2">
      <h1>用户注册</h1>
      <span>姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <input
        type="text"
        placeholder="请输入姓名"
        style="margin-top: 60px"
        v-model="username"
      />
   
      <br />
      <br />
      <span>密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <input type="password" placeholder="请输入密码" v-model="password" />

      <br />
      <br />
      <span>密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <input type="password" placeholder="请再次输入密码" v-model="passwordt" />
      <br />
      <br />
      <span>身份证号：</span>
      <input type="text" placeholder="请输入身份证号" v-model="userid" />

      <br />
      <br />

      <el-row>
        <el-button
          type="primary"
          style="height: 50px; width: 150px"
          @click="tozhuce"
          >注册</el-button
        >
        <br />

        <span
          style="margin-left: 450px; cursor: pointer; color: blue"
          @click="madmin1"
        >
          用户登录</span
        >
      </el-row>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Admin",
  data() {
    return {
      data1: [],
      data2: [],
      username: "",
      password: "",
      manager: false,
      user: true,
      admin: "",
      name: "",
      id:"",
      zhuce2:false,
      passwordt:'',
      userid:''

    };
  },
  methods: {
    zhuce1(){
       this.manager=false
       this.user=false
       this.zhuce2=true
       console.log("111")
    },
    toUser() {
      for (var i = 0; i < this.data1.length; i++) {
        if (
          this.password == this.data1[i].password &&
          this.username == this.data1[i].username
        ) {
          localStorage.setItem("id",this.data1[i].id)
       
          // console.log(this.data1[i].password);
          this.$bus.$emit("touser", 1);
          this.$router.push({
            path:"/ushow"
          }, () => {})
        }
      }
    },
  
    madmin1() {
      this.manager = false;
      this.user = true;
      this.zhuce2=false
      this.username=""
      this.password=""
      console.log("111")

    },
    madmin2() {
      this.manager = true;
      this.user = false;
      this.zhuce2=false
      this.username=""
      this.password=""
      console.log("111")

    },
    toManger() {
      for (var i = 0; i < this.data2.length; i++) {
        if (
          this.password == this.data2[i].name &&
          this.username == this.data2[i].admin
        ) {
          this.$bus.$emit("tomanager", 1);
          this.$router.push({
            path:'/manager'
          },()=>{})
        }
      }
    },
    tozhuce(){
      if(this.password!=this.passwordt){
        alert("输入的密码不一致")
        this.passwordt=""
      }else{
        axios.post('http://localhost:8081/userinto',{
            id:this.userid,
            username:this.username,
            password:this.password
        }).then(response=>{
          alert("注册成功")
          

        })
        this.$bus.$emit("touser", 1);
        this.$router.push({
            path:"/ushow"
          }, () => {})
          localStorage.setItem("id",this.userid)
      }

      
    }
  },
  mounted() {
    axios.get("http://localhost:8081/hello").then((response) => {
      console.log(response.data);
      this.data1 = response.data;
    });
    axios.get("http://localhost:8081/select").then((response) => {
      console.log(response.data);
      this.data2 = response.data;
    });
  },
};
</script>

<style scoped>
.back {
  width: 100%;
  height: 960px;
  background: url("/src/image/image6.jpg");
}
.denglu {
  /* margin-top:5% ; */
  margin-left: 35%;
  text-align: center;
  width: 30%;
  height: 600px;
  background: rgba(255, 255, 255, 0.6);
}
.denglu input {
  width: 50%;
  height: 50px;
}
</style>