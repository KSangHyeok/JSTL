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
    border:1px solid black;
    height: 400px;
    width: 260px;
}
td.bound {
    border:2px solid gray;
}    
#selMenu,#selOrder,#selSales,#selMenu1,#selMenu2,#selMenu3{
    width:240px; 
}
#dlgMenu{
	width:600px; height:300px;
}
</style>
<body>
<table align=center>
	<tr>
		<td>
			<table class='bound'>
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
                            <button type=reset id=clean>초기화</button>
                        </td>
                        <td>
                        <button id=s>보보</button>
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
                        <button id=btnPlus>전송</button>
                    </td>
                </tr>
                </table>
            </td>
        </tr>    
        </table>    
    </div>
    <div id=dlgMenu1 style=display:none title='메뉴별 매출' >
       <table>
        <tr>
            <td>
                <select id=selMenu2 size=10></select>
            </td>   
            <td>
                <select id=selMenu3 size=10></select>
            </td>            
        </tr>    
        </table>    
    </div>

</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
let ar1=0;
let ar='';
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
	if($('#mobile').val()=='') $('#mobile').val('-');	
	$('#selOrder option').each(function(){				
		let str=$(this).text();		
		let str1=str.split(' ');		
		let str2='<option>'+str1[0]+' '+$('#mobile').val()+' '+str1[1]+' '+str1[2]+' '+str1[3]+'</option>';
		$('#selSales').append(str2);		
		$.get("selMenu",{code:str1[0],
		 				mobile:$('#mobile').val(),
		 				qty:str1[2],		 				
		 				total:str1[3]},
		function(txt){		
		},'text');
	});
	$('#selOrder').text('');
	$('#mobile').val('');
	$('#total').val('');		
	ar1=0;
	

})
//메뉴관리 옵션 selected
.on('click','#selMenu1',function(){
    let str=$('#selMenu1 option:selected').text();   
    console.log(str);
    let ar=str.split(' ');
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
	}else if($('#_menucode').val()!=''){
		if($('#_menuname').val()!='' && $('#_price').val()!=''){
			operation="update";
		}else{
			operation="delete";
		}
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
	console.log(ar);
    let str='<option>'+ar[0]+' '+$('#menuname').val()+' '+$('#qty').val()+' '+ $('#price').val()+'</option>';	
// 	let str='<option>'+code[0]+' '+code[1]+' '+$('#qty').val()+' '+code[2]+'</option>';
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
.on('click','#s',function() {
      $('#dlgMenu1').dialog({
         width:560,
         open:function() {        	 
        	 $.get('dlgmenu', {}, function(txt) {
        	        if (txt == "")
        	           return false;
        	        let rec = txt.split(';');
        	        for (i = 0; i < rec.length; i++) {
        	           let field = rec[i].split(',');
        	           console.log(field);
        	           let html ='<option>'+field[0]+' '+field[1]+' '+field[2]+'</option>';
        	           console.log(html);
        	           $('#selMenu2').append(html);
        	        }
        	  },'text')
          $.get('dlgmenu1', {}, function(txt) {
        if (txt == "")
           return false;
        let rec = txt.split(';');
        for (i = 0; i < rec.length; i++) {
           let field = rec[i].split(',');
           console.log(field);
           let html ='<option>'+field[0]+' '+field[1]+'</option>';
           console.log(html);
           $('#selMenu3').append(html);
        }
  },'text')
          },
          close:function() {
             $('#selMenu2').empty();
             $('#selMenu3').empty();
         }
         });
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



</script>


</html>