import Vue from 'vue'
import axios from 'axios'
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};
new Vue({
    el: '#comment',
    data: {
        context: '',
        user_id: document.querySelector("[v-model='user_id']").value,
        video_id: document.querySelector("[v-model='video_id']").value
    },
    methods: {
        comment_create: function() {
            axios
                .post('/api/v1/comments.json', {
                    comment: {
                        context: this.context,
                        user_id: this.user_id,
                        video_id: this.video_id
                    }
                })
                .then(response => (this.info = response))
        }
    }
})
