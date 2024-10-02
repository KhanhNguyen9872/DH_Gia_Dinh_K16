// thấy được form
const formthem=document.getElementById('todoForm');
const taskinput=document.getElementById('task');
let tasks=[];
// gán tai nghe
formthem.addEventListener('submit',(e)=>{
    e.preventDefault();
    // lấy giá trị taskinput
    const taskname=taskinput.value.trim();// loại bỏ khoảng trắng vô nghĩa
    // thực hiện phương thức đem giá vào trong mảng
    themtask(taskname);
    taskinput.value='';
})

// thực hiện phương thức bất đồng bộ
const addTask=(taskname)=>{
    return new Promise((resolve,reject)=>{
        // nếu taskname có giá trị
        if(taskname)
        {
            // tạo ra 1 đối tượng có 2 thuộc tính name, completed
            const newtask={name:taskname,completed:false};
            // đem đối tượng vào tasks
            tasks=[...tasks,newtask];
            resolve(tasks);
        }
        else
        {
            reject("Ko thêm được");
        }
    })
}// end

const message=document.getElementById('message');
// phương thức thực thi promise thêm
const themtask=async(taskname)=>{
    try {
        const newtask=await addTask(taskname);
        tasks=newtask;
        renderTask();
    } catch (error) {
        message.textContent=error;
        message.style.color='red';
    }
}


// phương thức render
const todoList=document.getElementById('todoList');
const renderTask=()=>{
    todoList.innerHTML="";
    tasks.forEach((gt,vitri)=>{
        // tạo li
        const li=document.createElement('li');
        // trong li có span
        const span=document.createElement('span');
        // trong span có class
        span.classList.add('todo-item');
        const {name,completed}=gt;
        if(completed){
            span.classList.add('completed');
        }
        //nội dung
        span.textContent=name;
        // span thuộc về con của li
        li.appendChild(span);
        // tạo nút hoàn thành
        const completeBtn=document.createElement('button');
        // class cho hoàn thành
        completeBtn.classList.add('complete-btn');
        // thêm nội dung cho nút
        completeBtn.textContent="Hoàn Thành";
        // sự kiện
        completeBtn.onclick=()=>{
            htcongviec(vitri);
        }
        // nút thuộc về li
        li.appendChild(completeBtn);
        // tạo nút xóa
        const deleteBtn=document.createElement('button');
        // class cho hoàn thành
        deleteBtn.classList.add('delete-btn');
        // thêm nội dung cho nút
        deleteBtn.textContent="Xóa";
        // nút thuộc về li
        li.appendChild(deleteBtn);
        // đem li vào ul
        todoList.appendChild(li);
    })
}
// end

const completeCV=(index)=>{
    return new Promise((resole)=>{
        const newtasks=tasks.map((p,i)=>i===index?{...p,completed:!p.completed}:p);
        resole(newtasks);
    })
}

// goi pt
const htcongviec=async(index)=>{
    try {
        const cvmoi=await completeCV(index);
        tasks=cvmoi;
        renderTask();
    } catch (error) {
        message.textContent=error;
        message.style.color='red';
    }
}
