/// tạo đối tượng vue
const app = Vue.createApp({
    data() {
        return {
            ten: "Khánh",
            tuoi: 13,
            rawHTML: '<span style="color: red;">Đây là chữ màu đỏ</span>',
            img: 'img.jpg',
            alt: 'hinhanh1',
        }
    },

    methods: {
        phimEnter() {
            alert('day la phim Enter');
        }
    }
});