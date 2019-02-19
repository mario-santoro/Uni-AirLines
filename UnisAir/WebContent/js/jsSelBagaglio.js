function incrementbag15(){
	var val = document.getElementById("bagNumber15").value;
	
	if(val<5)
		val++;
	document.getElementById("bagNumber15").value = val;
}
function decrementbag15(){
	var val = document.getElementById("bagNumber15").value;
	if(val>0)
		val--;
	else
		val = 0;
	document.getElementById("bagNumber15").value = val;
}
	
	
	
function incrementbag20(){
	var val = document.getElementById("bagNumber20").value;
	
	
	if(val<5){
	var sov=document.getElementById("sovrapprezzo").innerHTML;
	sov=sov*1+35;
	document.getElementById("sovrapprezzo").innerHTML=sov;
	var tot=document.getElementById("totale").innerHTML;
	tot=tot*1+35;
	document.getElementById("totale").innerHTML=tot;
	val++;
	}
	document.getElementById("bagNumber20").value = val;
	
}
function decrementbag20(){
	var val = document.getElementById("bagNumber20").value;
	if(val>0){
		var sov=document.getElementById("sovrapprezzo").innerHTML;
	sov=sov*1-35;
	document.getElementById("sovrapprezzo").innerHTML=sov;
	var tot=document.getElementById("totale").innerHTML;
	tot=tot*1-35;
	document.getElementById("totale").innerHTML=tot;
		val--;
	}else
		val = 0;
	document.getElementById("bagNumber20").value = val;
}
		
	
	
function incrementbag25(){
	var val = document.getElementById("bagNumber25").value;
	if(val<5){
		var sov=document.getElementById("sovrapprezzo").innerHTML;
		sov=sov*1+50;
		document.getElementById("sovrapprezzo").innerHTML=sov;
		var tot=document.getElementById("totale").innerHTML;
		tot=tot*1+50;
		document.getElementById("totale").innerHTML=tot;
		val++;
	}
	document.getElementById("bagNumber25").value = val;
}
function decrementbag25(){
	var val = document.getElementById("bagNumber25").value;
	if(val>0){
		var sov=document.getElementById("sovrapprezzo").innerHTML;
		sov=sov*1-50;
		document.getElementById("sovrapprezzo").innerHTML=sov;
		var tot=document.getElementById("totale").innerHTML;
		tot=tot*1-50;
		document.getElementById("totale").innerHTML=tot;
		val--;
	}else
		val = 0;
	document.getElementById("bagNumber25").value = val;
}
	