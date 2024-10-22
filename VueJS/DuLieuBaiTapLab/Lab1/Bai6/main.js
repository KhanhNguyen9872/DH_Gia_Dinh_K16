
const app = Vue.createApp({
    data() {
        return {
					services: [
						{
							name: 'Chocolate freeze',
							price: 69,
							active:true
						},{
							name: 'Phindi Hạnh Nhân',
							price: 50,
							active:false
						},{
							name: 'Cà Phê Sữa',
							price: 40,
							active:false
						},{
							name: 'Trà Sen Vàng',
							price: 40,
							active:false
						}
					]
        }
    },
		methods: {
		}
	
	
  });
	// Filter toàn cục
	//https://v3.vuejs.org/guide/migration/filters.html#_3-x-update
  