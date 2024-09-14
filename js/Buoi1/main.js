// let a = 100;
// if (a > 50) {
//     let kq = "Số lớn hơn 50";
//     console.log(kq);
// }

// console.log(a);
// console.log(kq);

//

// var funcs=[];
// debugger;
// for(var i = 0; i < 5; i++) {
//     funcs.push(function() {
//         console.log(i);
//     })
// }

// funcs[3]();

// template string
// var a = 'Nguyễn';
// var b = 'Văn';
// console.log(`Tôi là ${a} ${b}`);

// // \n
// console.log(`Hôm nay tôi đi học
// abcdef
// `);



// let obj = {first: 'Jane', last: 'i'};

// // ES5
// console.log(obj.first);
// console.log(obj.last);

// // ES6
// let {first: a, last: b} = obj;
// console.log(a);
// console.log(b);


// let arr = [123, 'Nghĩa', 'Năm nhất'];


// // ES5
// let ms = arr[0]; // arr[1] arr[2];
// let ten = arr[1];
// let hoclai = arr[2];

// console.log(`${ms} ${ten} ${hoclai}`);

// // ES6
// let [ms1, ten1, hoclai1] = arr;

// console.log(ms1);



// spread operator

let b1 = ['a', 'b', 'c'];
let b2 = ['x', 'y', 'z'];

let c = [...b1, ...b2];

console.log(c);