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
                .get('/api/v1/comments.json', {
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
