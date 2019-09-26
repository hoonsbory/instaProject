/**
 * 
 */

let id1 = "<c:out value='${id}'/>";
$('.search_input').keyup(function(){
	$('#scroll_mid').css('display', 'block');
	$('#shape_mid').css('display', 'block');
	
		$('#divdelete_mid').remove();
		$.ajax({
			url : 'search.jsp',
			type : 'get',
			dataType : 'json',
			data : {id2 : $('.search_input').val().trim()},
			success : ((data)=>{
				if(data.length==0){
					$('#scroll_mid').html('찾는 사용자가 없습니다.');
				}else{
					$('#scroll_mid').html('');
				}
		if($('.search_input').val()!=""){
			let count2 = 0;
			let divSearch2 = document.createElement('div');
		document.querySelector('#scroll_mid').appendChild(divSearch2);
	divSearch2.setAttribute("class" , "divdelete")
	divSearch2.setAttribute("id" , "divdelete_mid")
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let userimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
	userimg.setAttribute("class" , "userimg");
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan"+i)
		document.querySelector('#divdelete_mid').appendChild(aSearch);
	
		document.querySelector('#aSearch'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch'+i).appendChild(divName);
		$('#divName'+i).html(data[count2].name);
		if(data[count2]!=null){
	userimg.setAttribute("src", data[count2].img);
		}
			
		
		document.querySelector('#SearchImg'+i).appendChild(userimg);
		document.querySelector('#divName'+i).appendChild(divEmail);
		document.querySelector('#divEmail'+i).appendChild(EmailSpan);
		$('#EmailSpan'+i).html(data[count2].email);
		count2++;
		
		}
		}else{
			$('#scroll_mid').hide();
			$('#shape_mid').hide();
		}
		
			}),
			
					error : ((e)=>{
					alert('실패');
			})
			
			
			
		})
		
	
})

$('.like_account').click(()=>{
	$('#scroll_like').css('display', 'block');
	$('#shape_like').css('display', 'block');
	
		$('#divdelete_like').remove();
		$.ajax({
			url : 'likesList.jsp',
			type : 'get',
			dataType : 'json',
			success : ((data)=>{
				if(data.length==0){
					$('#scroll_like').html('기록이 없습니다.');
				}else{
					$('#scroll_like').html('');
				}
		
			let count2 = 0;
			let divSearch2 = document.createElement('div');
		document.querySelector('#scroll_like').appendChild(divSearch2);
	divSearch2.setAttribute("class" , "divdelete")
	divSearch2.setAttribute("id" , "divdelete_like")
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let divImg = document.createElement('div');
			let userimg = document.createElement('img');
			let postimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
	userimg.setAttribute("class" , "userimg");
	postimg.setAttribute("class" , "postimg");
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch_like"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg_like"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divImg.setAttribute("id" , "divImg"+i)
	divImg.setAttribute("class" , "divImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName_like"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail_like"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan_like"+i)
		document.querySelector('#divdelete_like').appendChild(aSearch);
	
		document.querySelector('#aSearch_like'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch_like'+i).appendChild(divName);
		document.querySelector('#aSearch_like'+i).appendChild(divImg);
		if(data[count2].post!='f'){
		if(data[count2]!=null){
		$('#divName_like'+i).html(data[count2].name+" 님이 회원님의 게시글에 좋아요를 표시했습니다."+"<br>");
	userimg.setAttribute("src", data[count2].img);
	postimg.setAttribute("src", data[count2].post);
		document.querySelector('#SearchImg_like'+i).appendChild(userimg);
		//document.querySelector('#divName_like'+i).appendChild(divEmail);
		document.querySelector('#divName_like'+i).appendChild(EmailSpan);
		$('#EmailSpan_like'+i).html(data[count2].time);
		document.querySelector('#divImg'+i).appendChild(postimg);
		}
			
		
		}else{
			if(data[count2]!=null){
				$('#divName_like'+i).html(data[count2].name+" 님이 회원님을 팔로우 했습니다."+"<br>");
			userimg.setAttribute("src", data[count2].img);
			//postimg.setAttribute("src", data[count2].post);
				document.querySelector('#SearchImg_like'+i).appendChild(userimg);
				//document.querySelector('#divName_like'+i).appendChild(divEmail);
				document.querySelector('#divName_like'+i).appendChild(EmailSpan);
				$('#EmailSpan_like'+i).html(data[count2].time);
				//document.querySelector('#divImg'+i).appendChild(postimg);
				}
			
		}
		count2++;
		
		}
		
		
			}),
			
					error : ((e)=>{
					alert(e);
			})
			
			
			
		})
		
	
})
$('body').click(function(e) { if(!$('#divdelete_mid').hasClass("area")) {  //해당 영역 바깥 클릭 시 이벤트
	
	$('#scroll_mid').hide();
	$('#shape_mid').hide();
} });
$(document).mouseup((e)=>{
	var container = $('.like_account');
	if(container.has(e.target).length ===0)
		$('#scroll_like').hide();
	$('#shape_like').hide();
})
$('#btnEdit').click(()=>{
			$('#frmEdit').submit();
		
	})
	$('#btnEdit2').click(()=>{
			$('#frmlogout').submit();
		
	})	
	
	// 팔로우 리스트 기능 
$('#followlist').click(function(){
	$('.followerlist_class').css('display', 'block');
	$('.followerlist_div').css('display', 'block');
	
		$('#divdelete_mid').remove();
		$.ajax({
			url : 'followerlist.jsp',
			type : 'get',
			dataType : 'json',
			success : ((data)=>{
				if(data.length==0){
					$('.followerlist_class').html('찾는 사용자가 없습니다.');
				}
			let count2 = 0;
			let divSearch2 = document.createElement('div');
		document.querySelector('.followerlist_class').appendChild(divSearch2);
	divSearch2.setAttribute("class" , "divdelete")
	divSearch2.setAttribute("id" , "divdelete_mid")
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let userimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
	userimg.setAttribute("class" , "userimg");
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan"+i)
		document.querySelector('#divdelete_mid').appendChild(aSearch);
	
		document.querySelector('#aSearch'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch'+i).appendChild(divName);
		$('#divName'+i).html(data[count2].name);
		if(data[count2]!=null){
	userimg.setAttribute("src", data[count2].img);
		}
			
		
		document.querySelector('#SearchImg'+i).appendChild(userimg);
		document.querySelector('#divName'+i).appendChild(divEmail);
		document.querySelector('#divEmail'+i).appendChild(EmailSpan);
		$('#EmailSpan'+i).html(data[count2].email);
		count2++;
		
		}
		
			}),
			
					error : ((e)=>{
					alert('실패');
			})
			
			
			
		})
	})
	
// 팔로워 리스트 기능 
$('#followerlist').click(function(){
	$('body').css('background' , 'gray');
	$('.followerlist_class').css('display', 'block');
	$('.followerlist_div').css('display', 'block');
	
		$('#divdelete_mid').remove();
		$.ajax({
			url : 'followerlist.jsp',
			type : 'get',
			dataType : 'json',
			success : ((data)=>{
				if(data.length==0){
					$('.followerlist_class').html('찾는 사용자가 없습니다.');
				}
			let count2 = 0;
			let divSearch2 = document.createElement('div');
		document.querySelector('.followerlist_class').appendChild(divSearch2);
	divSearch2.setAttribute("class" , "divdelete")
	divSearch2.setAttribute("id" , "divdelete_mid")
		for(var i = 1; i<data.length+1; i++){
			let aSearch = document.createElement('a');
			let SearchImg = document.createElement('div');
			let userimg = document.createElement('img');
			let divName = document.createElement('div');
			let divEmail = document.createElement('div');
			let EmailSpan = document.createElement('span');
	userimg.setAttribute("class" , "userimg");
	
	aSearch.setAttribute("class" , "aSearch");
	aSearch.setAttribute("id" , "aSearch"+i);
	aSearch.setAttribute("href" , "search.do?id="+data[count2].id);
	
	SearchImg.setAttribute("id" , "SearchImg"+i)
	SearchImg.setAttribute("class" , "SearchImg")
	divName.setAttribute("class" , "divName")
	divName.setAttribute("id" , "divName"+i)
	divEmail.setAttribute("class" , "divEmail")
	divEmail.setAttribute("id" , "divEmail"+i)
	EmailSpan.setAttribute("class" , "EmailSpan")
	EmailSpan.setAttribute("id" , "EmailSpan"+i)
		document.querySelector('#divdelete_mid').appendChild(aSearch);
	
		document.querySelector('#aSearch'+i).appendChild(SearchImg);
		
		document.querySelector('#aSearch'+i).appendChild(divName);
		$('#divName'+i).html(data[count2].name);
		if(data[count2]!=null){
	userimg.setAttribute("src", data[count2].img);
		}
			
		
		document.querySelector('#SearchImg'+i).appendChild(userimg);
		document.querySelector('#divName'+i).appendChild(divEmail);
		document.querySelector('#divEmail'+i).appendChild(EmailSpan);
		$('#EmailSpan'+i).html(data[count2].email);
		count2++;
		
		}
		
			}),
			
					error : ((e)=>{
					alert('실패');
			})
			
			
			
		})
	})
