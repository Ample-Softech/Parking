window.onload = function(){getTime();}  
function getTime(){  
	var today=new Date();  
	var h=today.getHours();  
	var m=today.getMinutes();  
	var s=today.getSeconds();  
	// add a zero in front of numbers<10  
	h=checkHour(h);
	m=checkTime(m);  
	s=checkTime(s);  
	document.getElementById('txt').innerHTML=h+":"+m+":"+s;  
	setTimeout(function(){getTime()},1000);  
}  
setInterval("getTime()",1000);//another way  
function checkTime(i){  
	if (i<10){  
	  i="0" + i;  
	 }  
	return i;  
}  
function checkHour(i) {
	if (i>12){  
		i-=12;
	}
	return (i);  
}


