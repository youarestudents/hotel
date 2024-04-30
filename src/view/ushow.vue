<template class="bodyT">
  <div id="app">
    <nav>
      <ul>
        <li><router-link active-class="active" to="/user">首页</router-link></li>
        <li>
          <router-link active-class="active" to="/about">关于我们</router-link>
        </li>
        <li>
          <router-link active-class="active" to="/service">服务</router-link>
        </li>
       
        <li> <router-link to="/hstate">查看房间</router-link></li>
      </ul>
    
    </nav>
    <div class="body1"><router-view></router-view></div>
  </div>
</template>
  
  <script>
export default {
  name: "App",

  data() {
    return {};
  },
};
</script>
  
  <style scoped>
.body1 {
  margin-top: 1%;
  margin-left: 10%;
  width: 80%;
  /* height: 1000px; */
  /* border: 1px solid black; */
  background: #f6f6f6;
  border-radius: 2%;
  box-shadow: -5px -5px 5px 0px rgba(0, 0, 0, 0.3);
}
nav {
  background-color: #333;
  color: #fff;
  padding: 10px;
}
nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  /* text-align: center; */
}
nav ul li {
  display: inline;
  margin-left: 80px;
}
nav ul li a {
  color: #fff;
  text-decoration: none;
  font-size: 18px;
}
nav ul li a:hover {
  color: #ffa500;
}
</style>
  