<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hello Bảo Châu ❤️</title>

<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:#000;
overflow:hidden;
color:white;
}

/* PAGE */

.page{
position:absolute;
width:100%;
height:100vh;
display:none;
justify-content:center;
align-items:center;
flex-direction:column;
overflow:hidden;
}

.active{
display:flex;
}

/* HEART BACKGROUND */

.bg-heart{
position:absolute;
font-size:300px;
color:rgba(255,105,180,0.08);
animation:pulse 4s infinite;
z-index:0;
}

@keyframes pulse{
0%,100%{
transform:scale(0.8);
}
50%{
transform:scale(1.25);
}
}

/* TEXT */

.title{
font-size:5rem;
color:#ff69b4;
text-align:center;
z-index:5;

text-shadow:
0 0 10px #ff69b4,
0 0 20px #ff69b4,
0 0 40px #ff69b4,
0 0 80px #ff69b4;

animation:float 3s ease-in-out infinite;
}

@keyframes float{
0%,100%{
transform:translateY(0);
}
50%{
transform:translateY(-15px);
}
}

/* PARTICLES */

.particle{
position:absolute;
width:4px;
height:4px;
border-radius:50%;
background:#ff69b4;
box-shadow:0 0 20px #ff69b4;
animation:particleMove linear infinite;
pointer-events:none;
}

@keyframes particleMove{
from{
transform:translateY(110vh);
opacity:0;
}
20%{
opacity:1;
}
to{
transform:translateY(-20vh);
opacity:0;
}
}

/* BUTTON */

button{
padding:15px 30px;
margin:10px;
font-size:1.2rem;
border:none;
border-radius:40px;
background:#ff69b4;
color:white;
cursor:pointer;
z-index:10;
}

.next{
position:absolute;
right:30px;
bottom:30px;
font-size:55px;
cursor:pointer;
z-index:10;
}

/* HEARTS */

.heart{
position:absolute;
pointer-events:none;
}

/* FLOWERS */

.flower{
position:absolute;
pointer-events:none;
}

.gift{
margin-top:30px;
font-size:2rem;
color:#ff69b4;
z-index:10;
}

.footer{
font-size:1.5rem;
margin-top:20px;
z-index:10;
}

</style>
</head>
<body>

<!-- PAGE 1 -->

<div class="page active" id="page1">

<div class="bg-heart">❤</div>

<h1 class="title">
Hello Bảo Châu
</h1>

<p style="z-index:10">
✨  một ngày thiếu nhi vui vẻ ✨
</p>

<div class="next" onclick="showPage(2)">
💖➜
</div>

</div>

<!-- PAGE 2 -->

<div class="page" id="page2">

<div class="bg-heart">❤</div>

<h1 class="title" style="font-size:4rem">
Bảo Châu còn là thiếu nhi không?
</h1>

<div style="margin-top:30px;z-index:10">

<button onclick="showPage(3)">
Có
</button>

<button onclick="sayNo()">
Không
</button>

</div>

</div>

<!-- PAGE 3 -->

<div class="page" id="page3">

<h1 class="title" style="font-size:4rem">
🎉 Chúc Mừng Thiếu Nhi Bảo Châu 🎉
</h1>

<div class="gift">
🎁 quà nè
</div>

<div class="next" onclick="showPage(4)">
💖➜
</div>

</div>

<!-- PAGE 4 -->

<div class="page" id="page4">

<h1 class="title">
🌹 gửi a stk  🌹
</h1>

<div class="footer">
💸 Để nhận quà nha nay từ bi không lấy lãi đâu mà lo:> hoa để hè về nhé  💸
</div>

</div>

<script>

/* Hạt hồng */

for(let i=0;i<300;i++){

let p=document.createElement("div");

p.className="particle";

p.style.left=Math.random()*100+"vw";

p.style.animationDuration=
(5+Math.random()*10)+"s";

p.style.animationDelay=
Math.random()*10+"s";

document.body.appendChild(p);

}

/* Chuyển trang */

function showPage(num){

document.querySelectorAll(".page")
.forEach(p=>p.classList.remove("active"));

document.getElementById("page"+num)
.classList.add("active");

if(num===3){
heartFirework();
}

if(num===4){
flowerRain();
}

}

/* Không */

function sayNo(){

alert(
"🤨 Chắc chưa? Bảo Châu vẫn là thiếu nhi mà! Chọn Có nha ❤️"
);

}

/* Trái tim */

function heartFirework(){

for(let i=0;i<150;i++){

let heart=document.createElement("div");

heart.className="heart";

heart.innerHTML="💖";

heart.style.left=
Math.random()*100+"vw";

heart.style.bottom="-50px";

heart.style.fontSize=
(15+Math.random()*40)+"px";

heart.style.transition="all 3s linear";

document.body.appendChild(heart);

setTimeout(()=>{

heart.style.transform=
"translateY(-120vh)";

heart.style.opacity="0";

},50);

setTimeout(()=>{
heart.remove();
},4500);

}

}

/* Hoa + tiền */

function flowerRain(){

for(let i=0;i<180;i++){

let flower=document.createElement("div");

flower.className="flower";

flower.innerHTML=
Math.random()>0.5 ? "🌹" : "💸";

flower.style.left=
Math.random()*100+"vw";

flower.style.top="-50px";

flower.style.fontSize=
(25+Math.random()*25)+"px";

flower.style.transition=
"all "+(4+Math.random()*5)+"s linear";

document.body.appendChild(flower);

setTimeout(()=>{

flower.style.transform=
"translateY(120vh)";

},50);

}

}

</script>

</body>
</html>
