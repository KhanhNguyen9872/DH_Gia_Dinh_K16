const app = Vue.createApp({
    data() {
        return {
            newTask: '',
            tasks: []
        }
    },

    methods: {
        addTask() {
            if (this.newTask.trim() !== '') {
                this.tasks.push({ text: this.newTask });
                this.newTask = '';
            }
        },
        deleteTask(index) {
            this.tasks.splice(index, 1);
        },
        updateTask(index) {
            if (this.tasks[index].text.trim() === '') {
                this.deleteTask(index);
            }
        }
    }
}).mount("#app");