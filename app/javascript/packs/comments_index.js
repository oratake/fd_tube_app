import Vue from 'vue'
import axios from 'axios'
new Vue({
    el: '#comments_index',
    data: {
        comments: [],
        video_id: document.querySelector("[v-model='video_id']").value
    },
    methods: {
        get_comments: function() {
            axios
                // 本番環境
                .get('http://ecs-fd-tube-app-alb-242793914.ap-northeast-1.elb.amazonaws.com/api/v1/comments.json', {
                // ローカル
                // .get('http://localhost:80/api/v1/comments.json', {
                    params: {
                        video_id: this.video_id
                    }
                })
                .then(response => {
                    for(var i = 0; i < response.data.comments.length; i++) {
                        this.comments.push(response.data.comments[i])
                    }
                })
        }
    },
    mounted: function() {
        this.get_comments()
    }
})
