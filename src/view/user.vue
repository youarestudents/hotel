<template>
  <div id="app">
    <div class="block">
      <el-carousel height="500px">
        <el-carousel-item v-for="(image, index) in images" :key="index">
          <img :src="image.il" alt="Slide" />
          <h3 class="small">{{ index }}</h3>
        </el-carousel-item>
      </el-carousel>
    </div>

    <br />
    <br />
    <br />

    <div>
      <el-row>
        <router-link active-class="active" to="/dinggou">
          <el-button type="primary" class="dinggou"
            ><span style="font-size: 20px">订购房间</span></el-button
          >
        </router-link>

        <el-button type="danger" class="tuifang"
          ><span style="font-size: 20px">退房服务</span></el-button
        >
      </el-row>
    </div>

    <div>
      <br /><br /><br />
      <el-card class="box-card" shadow="hover">
        <div class="infinite-list-wrapper" style="overflow: auto">
          <ul
            class="list"
            v-infinite-scroll="load"
            infinite-scroll-disabled="disabled"
          >
            <li
              v-for="(i, index) in this.data1"
              :key="index"
              class="list-item"
              style="list-style-type: none"
            >
              <br />
              <div>
                <span>{{ i.type1 }}-- {{ i.houseid }}号房间</span>
                <router-link
                  active-class="active"
                  :to="{
                    path: '/dinggou',
                    query: {
                      housename:i.type1,
                      houseid:i.houseid
                    },
                  }"
                >
                  <el-button type="primary" style="margin-left: 1000px"
                    >订购</el-button
                  ></router-link
                >
              </div>
            </li>
          </ul>
          <p v-if="loading">加载中...</p>
          <p v-if="noMore">已经到底啦！（·~·）</p>
        </div>
      </el-card>
    </div>
  </div>
</template>
  
  <script>
import axios from 'axios';
export default {
  name: "App",
  data() {
    return {
      count: 10,
      loading: false,
      data1:[],
      images: [
        { il: require("../image/image1.jpg") },
        {
          il: require("../image/image2.jpg"),
        },
        {
          il: require("../image/image3.jpg"),
        },
        {
          il: require("../image/image4.jpg"),
        },
      ], // 图片路径
      currentIndex: 0, // 当前显示图片的索引
      intervalId: null, // 定时器ID
    };
  },
  computed: {
    noMore() {
      return this.count >= this.data1.length1;
    },
    disabled() {
      return this.loading || this.noMore;
    },
  },
  methods: {
    load() {
      this.loading = true;
      setTimeout(() => {
        this.count += 2;
        this.loading = false;
      }, 2000);
    },
  },

  components: {},
  mounted(){
    axios.get("http://localhost:8081/nullhouse").then(response=>{
       this.data1=response.data
    })
  }
};
</script>
  
  <style scoped>
.block {
  margin-left: 20%;
  width: 60%;
}
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

img {
  width: 100%;
  height: 100%;
}

.dinggou {
  width: 200px;
  height: 50px;
  position: relative;
  left: 100px;
}
.tuifang {
  width: 200px;
  height: 50px;
  position: relative;
  left: 950px;
}
.text {
  font-size: 14px;
}

.item {
  padding: 18px 0;
}

.box-card {
  width: 480px;
}
.box-card {
  margin-left: 10%;
  width: 80%;
}
</style>
  