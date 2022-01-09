<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<title>Menu</title>
</head>
<style>
table.bound {   
    border-collapse: collapse;
    border:2px solid gray;
    height: 400px;
    width: 260px;
}
td.bound {
    border:2px solid gray;
}    
#selMenu,#selOrder,#selSales,#selMenu1{
    width:240px; align:right;
}
</style>
<body>
<table align=center>
	<tr>
		<td>
			<table>
			<caption>메뉴목록</caption>
				<tr>
					<td align=right colspan=2>
					<button id=btnMenu>메뉴관리</button>
					</td>
				</tr>
				 <tr>
                        <td colspan=2>
                            <select id=selMenu size=13></select>
                        </td>
                    </tr>
                    <tr>
                        <td>메뉴명</td>
                        <td><input type="text" id=menuname readonly></td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td><input type="number" id=qty min=1></td>
                    </tr>
				  <tr>
                        <td>금액</td>
                        <td><input type="number" id=price readonly></td>
                    </tr>
                    <tr>
                        <td><button type=reset id=btnReset>지우기</button></td>
                        <td align="right"><button id=btnAdd>메뉴추가</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound'>
                    <caption id=capt1>주문목록</caption>
                    <tr>
                        <td colspan="2">
                            <select id=selOrder size=14></select>
                        </td>
                    </tr>
                    <tr>
                        <td>총액</td>
                        <td><input type="number" id=total></td>
                    </tr>
                    <tr>
                        <td>모바일</td>
                        <td><input type=text id=mobile size=13></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button type=reset id=btnCancel>주문취소</button></td>
                        <td align="right"><button id=btnDone>주문완료</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound' >
                    <caption id=capt1>판매내역</caption>
                    <tr>
                        <td>
                            <select id=selSales size=17></select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button id=clean>초기화</button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div id=dlgMenu style=display:none title='메뉴 관리' >
       <table>
        <tr>
            <td>
                <select id=selMenu1 size=10></select>
            </td>
            <td>
                <table>
                <tr>
                    <td>메뉴코드</td><td><input type=number id=_menucode></td>
                </tr>
                <tr>
                    <td>메뉴명</td><td><input type=text id=_menuname></td>
                </tr>
                <tr>
                    <td>단가(가격)</td><td><input type=number id=_price step=100 min=100>원</td>
                </tr>
                <tr>
                    <td  colspan=2 align=center>
                        <button id=btnPlus>추가</button>&nbsp;
                        <button id=btnMinus>삭제</button>&nbsp;
                        <button id=btnUpdate>변경</button>&nbsp;
                    </td>
                </tr>
                </table>
            </td>
        </tr>    
        </table>
    
    </div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
let ar1=0;
let ar;
$(document)
.ready(function(){	
	loadmenu();	
	return false;
		})
.on('click','#btnMenu',function(){
	$('#dlgMenu').dialog({
	open:function(){
        $('#selMenu1').empty();
        $.get('menuname',{},function(txt){		
    		let rec=txt.split(';');
    		for(i=0; i<rec.length; i++){
    			let field=rec[i].split(',');
    			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
    			$('#selMenu1').append(html);	
    		}	   
    	},'text');
		return false;
    },
    close:function(){       
        $('#selMenu').empty();
        $.get('menuname',{},function(txt){		
    		let rec=txt.split(';');
    		for(i=0; i<rec.length; i++){
    			let field=rec[i].split(',');
    			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
    			$('#selMenu').append(html);	
    		}	   
    	},'text');
		return false;
    }
	})
})
.on('click','#selMenu',function(){
    let str=$('#selMenu option:selected').text();   
    console.log(str);
    ar=str.split(' ');
    console.log(ar);
    $('#menuname').val(ar[1]);
    $('#price').val(ar[2]);   
    $('#qty').val(1);
    
})
//주문목록 -> 판매내역
.on('click','#btnDone',function(){
	let operation='';
	if($('#mobile').text()=='') $('#mobile').text('-');	
	$('#selOrder option').each(function(){				
		let str=$(this).text();		
		let str1=str.split(' ');
		let str2='<option>'+$('#mobile').text()+' '+str1[0]+' '+str1[1]+' '+str1[2]+'</option>';
		$('#selSales').append(str2);		
		
						
		
// operation="selMenu";
// $.get(operation,{code:$(ar[0]).val(),
// 	mobile:$('#mobile').text(),
// 	qty:$(str[1]).val(),
// 	_price:$(str[2]).val(),
// 	total:$('#total').val()},
// function(txt){
// $('#mobile').text('');
// $('#selOrder').text('');
// $('#total').val('');
// ar1=0;
// },'text');
		
	});
	$('#selOrder').text('');
	$('#mobile').text('');
	$('#total').val('');		
	ar1=0;
	
	
	
	// 	if($('#mobile').val()==''){
// 		$('#mobile').val('guest');
// 		$('#selSales').append(str1);
// 	    $('#selOrder').text('');
// 	    $('#total,#mobile').val('');
// 	    ar1=0;
// 	}else{		
// 		$('#selSales').append(str1);
// 	    $('#selOrder').text('');
// 	    $('#total,#mobile').val('');
// 	    ar1=0;
// 	}
    
})
//메뉴관리 옵션 selected
.on('click','#selMenu1',function(){
    let str=$('#selMenu1 option:selected').text();   
    console.log(str);
    ar=str.split(' ');
    console.log(ar);
    $('#_menucode').val(ar[0]);
    $('#_menuname').val(ar[1]);
    $('#_price').val(ar[2]);    
})
//메뉴관리 insert
.on('click','#btnPlus',function(){
	let operation='';
	if($('#_menucode').val()==''){
		operation="insert";
	}
	$.get(operation,{_menucode:$('#_menucode').val(),
					_menuname:$('#_menuname').val(),
					_price:$('#_price').val()},
		function(txt){
						$('#_menuname,#_price,#_menucode').val();
						loadmenu1();
					},'text');				
	return false;
})
//메뉴관리 delete
.on('click','#btnMinus',function(){
	let operation='';
	if($('#_menucode').val()!=''){
		operation="delete";
	}
	$.get(operation,{_menucode:$('#_menucode').val(),
					_menuname:$('#_menuname').val(),
					_price:$('#_price').val()},
		function(txt){
			$('#_menuname,#_price,#_menucode').val();
			loadmenu1();
			},'text');				
	return false;
})
//메뉴관리 update
.on('click','#btnUpdate',function(){
	let operation='';
	if($('#_menucode').val()!='' && $('#_menuname').val()!='' && $('#_price').val()!=''){
		operation="update";
	}
		$.get(operation,{_menucode:$('#_menucode').val(),
						_menuname:$('#_menuname').val(),
						_price:$('#_price').val()},
		function(txt){
		$('#_menuname,#_price,#_menucode').val();
		loadmenu1();
		},'text');				
		return false;
})
.on('click','#btnAdd',function(){
    let str='<option>'+$('#menuname').val()+' '+$('#qty').val()+' '+ $('#price').val()+'</option>';
    $('#selOrder').append(str);
    let price=$('#price').val();
    price=parseInt(price);
    console.log(price);  
    ar1+=price;
    console.log(ar1);
    $('#total').val(ar1);
    $('#menuname').val('');
    $('#price').val('');   
    $('#qty').val('');
})
.on('change','#qty',function(){
    let str=$('#qty').val();
    $('#price').val(ar[2]*str);
})
.on('click','#btnCancel',function(){
	$('#total').val(0);
	$('#selOrder').text('');
	ar1=0;
})

function loadmenu(){	
	$('#selMenu').empty();
	$.get('menuname',{},function(txt){		
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			$('#selMenu').append(html);	
		}	   
	},'text');
	return false;
}
function loadmenu1(){	
	$('#selMenu1').empty();
	$.get('menuname',{},function(txt){		
		let rec=txt.split(';');
		for(i=0; i<rec.length; i++){
			let field=rec[i].split(',');
			let html='<option value='+field[0]+'>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
			$('#selMenu1').append(html);	
		}	   
	},'text');
	return false;
}

//selMenu insert 함수



</script>


</html>