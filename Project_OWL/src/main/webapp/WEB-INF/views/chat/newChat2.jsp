<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OWL Chat</title>
<!--     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="resources/css/materialize.min.css"  media="screen,projection"/> -->
<!--     <link rel="stylesheet" href="resources/css/custom.css"> -->
    
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>   -->  
  </head>
  <body>

    <input type="hidden" id='curUserKey'>
    <!-- header Top 영역 -->
    <header class="navbar-fixed">
        <nav>
            <div class="nav-wrapper valign-wrapper">
                <a href="#" id="aBackBtn" class="small material-icons left hiddendiv">arrow_back</a>
                <span id="spTitle" class="brand-logo center">OWL Chat Room</span>
                <a href="#dvAddUser" id="aInvite" class="small material-icons right hiddendiv modal-trigger">add</a>
            </div>
        </nav>
    </header>
    <!-- main 컨텐츠 영역 -->
    <main>
        <!-- 유저리스트탭 영역 -->
        <div id="tab-1" class="col s12 tabContents">
            <ul id="ulUserList" class="collection">
            </ul>
        </div>
        <!-- 채팅방리스트탭 영역 -->
        <div id="tab-2" class="col s12 tabContents" style="display: none">
            <ul id="ulRoomList" class="collection">
            </ul>
        </div>
        <!-- 설정탭 영역 -->
        <div id="tab-3" class="col s12 tabContents">
            <ul class="collection">
                <li id="liLogOut" class="collection-item">로그아웃</li>
            </ul>
        </div>
        <!-- 채팅방 메세지화면 영역 -->
        <div id="tab-4" class="col s12 tabContents ">
            <ul id="ulMessageList" class="collection">
            </ul>
            <div id="dvMsgForm" class="meta-bar chat">
                <div id="dvInputChat" contenteditable="true" placeholder="메세지 작성"></div>
                <i id='iBtnAttach' class="small material-icons">attach_file</i>
                <i id='iBtnSend' class="small material-icons">send</i>
                <input type="file" id="attachFile" style="display:none;"/>
            </div>
        </div>
    </main>
    <!-- footer 탭 영역 -->
    <footer>
        <ul id="tabs" class="tabs tabs-fixed-width">
            <li class="tab col s3 blue darken-2"><a id="tabUserList" href="#tab-1"><i class="small material-icons white-text">person</i></a></li>
            <li class="tab col s3 blue darken-2"><a id="tabRoomList" href="#tab-2"><i class="small material-icons white-text">message</i></a></li>
            <li class="tab col s3 blue darken-2"><a id="tabSetting" href="#tab-3"><i class="small material-icons white-text">settings</i></a></li>
            <li class="tab col s3" style="display:none"><a id="tabMessageList" href="#tab-4"></a></li>
        </ul>
    </footer>
    <!-- 로그인 화면 및 가입화면 영역 -->
   <!-- <div id="dvAuth">
      <div id="dvLogin">
          <h5>로그인</h5>
          <div id="dvSocial">
              <ul class="btnGroup">
                  <li id="liGoogleBtn" class="waves-effect waves-teal btn-flat"><i></i>구글 계정으로 가입 및 로그인</li>
                  <li id="liFacebookBtn" class="waves-effect waves-teal btn-flat"><i></i>페이스북 계정으로 가입 및 로그인</li>
              </ul>
              <em class="or">or</em>
          </div>
          <div id="dvEmail">
              <input type="email" id="userName" name="userName" class="input-text" placeholder="이메일 아이디">
              <input type="password" id="password" name="password" class="input-text" maxlength="17" placeholder="비밀번호">
              <ul class="btnGroup">
                  <li id="liEmailBtn" class="waves-effect waves-teal btn-flat">이메일으로 로그인</li>
              </ul>
              <ul class="btnGroup">
                  <li id="liEmailJoin" class="waves-effect waves-teal btn-flat">이메일으로 가입</li>
              </ul>
          </div>
      </div>
      <div id="dvJoin">
          <h5>이메일 가입</h5>
          <input type="text" id="joinUserName" name="userName" class="input-text" placeholder="이름">
          <input type="email" id="joinUserEmail" name="userName" class="input-text" placeholder="이메일 아이디">
          <input type="password" id="joinPassword" name="password" class="input-text" maxlength="17" placeholder="비밀번호">
          <input type="password" id="joinRePassword" class="input-text" maxlength="17" placeholder="비밀번호 확인">
          <ul class="btnGroup">
              <li id="liEmailJoinSubmit" class="waves-effect waves-teal btn-flat">이메일으로 가입</li>
          </ul>
      </div>
    </div>  -->
    <!-- Modal 영역 -->
    <div id="dnModal" class="modal col s4">
        <div class="modal-content">
            <h5>업로드</h5>
            <div class="progress">
                <div id="dvProgressBar" class="determinate"></div>
                <div id="dvFileName"></div>
            </div>
        </div>
    </div>
    <div id="dvAddUser" class="modal">
        <div class="modal-content">
          <h5>초대</h5>
          <ul id="ulAddUserList" class="collection">
          </ul>
        </div>
        <div class="modal-footer">
            <a id="aConfirmInvite" href="#!" class="modal-action modal-close waves-effect waves-green btn blue white-text">추가</a>
        </div>
    </div>
    
    
   <%--  <!-- template 영역 -->
    <!-- template 유저리스트 영역 -->
    <script type="text/template" id="templateUserList">
            <li id="li<%=targetUserUid %>" data-targetUserUid="<%=targetUserUid %>" data-username="<%=userName %>" class="collection-item avatar list">
                <img src="<%=profileImg ? profileImg : 'img/noprofile.png'  %>" alt="" class="circle">
                <span class="title"><%=userName %></span>
                <span class="small material-icons right hiddendiv done">done</span>
                <span class="small material-icons right hiddendiv mood yellow-text">mood</span>
            </li>
    </script>
    --%>
    
     <!-- template 메세지리스트 영역 -->
    <%-- <script type="text/template" id="templateMessageList">
        <li id="li<%=key%>" class="collection-item avatar" data-key="<%=key%>">
            <img src="<%=profileImg ? profileImg : 'img/noprofile.png'  %>" alt="" class="circle">
            <span class="title"><%=userName %></span><span class="time"><%=time %></span>
            <p><%=message %></p>
        </li>
    </script>
    
    <!-- 
    <!-- template 채팅방리스트 영역 -->
    <script type="text/template" id="templateRoomList">
        <li id="liRoom<%=roomId %>" data-roomId="<%=roomId %>" data-roomTitle='<%=roomTitle%>' data-roomUserName="<%=roomUserName%>"
            data-roomType="<%=roomType%>" data-roomOneVSOneTarget="<%=roomOneVSOneTarget%>" data-roomUserList="<%=roomUserlist %>" class="collection-item avatar" >
            <img src="<%=profileImg ? profileImg : 'img/noprofile.png'  %>" alt="" class="circle">
            <span class="title"><%=roomTitle%></span>
            <p><%=lastMessage %></p>
            <a href="#!" class="secondary-content"> <%=datetime %></a>
        </li>
    </script> 
     --> --%>
    
      <!-- <script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script> -->
<!--       <script type="text/javascript" src="resources/js/materialize.min.js"></script>
      <script type="text/javascript" src="resources/js/underscore-min.js"></script> -->
      
      
	<!-- The core Firebase JS SDK is always required and must be listed first -->
	<script src="https://www.gstatic.com/firebasejs/7.6.2/firebase-app.js"></script>
      
      <!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
	<script
		src="https://www.gstatic.com/firebasejs/7.6.2/firebase-analytics.js"></script>
	<!-- firebase cloud firestore -->
	<script
		src="https://www.gstatic.com/firebasejs/7.6.2/firebase-firestore.js"></script>
	<!-- firebase database -->
	<script src="https://www.gstatic.com/firebasejs/7.6.2/firebase-database.js"></script>
	<!-- firebase cloud store... for uploading and downloading large object -->
	<script src="https://www.gstatic.com/firebasejs/7.6.2/firebase-firestore.js"></script>
	<!-- firebase cloud messaging... for sending notification -->
	<script src="https://www.gstatic.com/firebasejs/7.6.2/firebase-messaging.js"></script>		
	
	<!-- <script src="resources/js/chat.js"></script>
 -->
	
	
     
      
      
      <script>
      console.log("value : " + '${member.name}');
      const curName = "${member.name}";
      const curEmail = "${member.email}"; 
      const curProfilePic = "${member.profilePic}";
     
      const SPLIT_CHAR = '@spl@';
      var roomFlag;
		var roomUserList; // 챗방 유저리스트  			
		var roomUserName; // 챗방 유저 이름 
		var roomId;		
		var roomTitle; 	
    	  
      console.log("현재 접속중인 유저 정보" + curName+"/"+curEmail+"/"+curProfilePic);

      
   
          
        
          // Your web app's Firebase configuration
          var firebaseConfig = {
            apiKey: "AIzaSyCUWhwHawfZnngksqB7RstHZJVC_fQloeg",
            authDomain: "owl-chat-c27f1.firebaseapp.com",
            databaseURL: "https://owl-chat-c27f1.firebaseio.com",
            projectId: "owl-chat-c27f1",
            storageBucket: "owl-chat-c27f1.appspot.com",
            messagingSenderId: "626219367568",
            appId: "1:626219367568:web:84d90164e32b237822ac15",
            measurementId: "G-7FX553N3RH"
          };
          // Initialize Firebase
          firebase.initializeApp(firebaseConfig);
          firebase.analytics();
          
        //Get a reference to the database service
          const database = firebase.database();
             
   


          //firebase.database().ref('emails/').push({email :'sdkjfsdl@naver.com'});
          
          
      

            /* firebase 스냅샵 활용 사례... 아마 나중에 필요 하나????
			var ref = firebase.database().ref("emails/").orderByChild('email');
			console.log("ref value ===" +ref);
			ref.once("value")
			  .then(function(snapshot) {
			    var a = snapshot.exists();  // true
			    var b = snapshot.hasChild("email"); // true
			    var c = snapshot.child("email").val(); // true
			   // var d = snapshot.hasChild("name/middle").exists(); // false
			    console.log("a 의 값은 ?? " +a + "/"+ b + "/"+ c);
			  });
			
			*/

           /* 파이어 베이스 포이치문 예시... 디비에 있는 특정 데이타를 뒤지거나... 포문 돌려서... 특정 데이타 묶음을 뽑고 싶을 때 활용
           function checkUser(email){
		           var myBool = true;
					var userEmails = firebase.database().ref('emails/');	
					userEmails.once("value")
			          .then(function(snapshot) {
			        	  //var myBool = true;
			            		snapshot.forEach(function(childSnapshot) {
			              			console.log(childSnapshot.val());
			             			 var emailData = childSnapshot.val().email;
			              			 console.log(childSnapshot.val().email);
			              	
									if(emailData == email){
										var key = childSnapshot.key;
										myBool = false;
				             			 console.log("key 값 포문 돌림 현재 접속한 유저의 키값은???" + key);
										 
									  return true;
									}				
			         		 });
				         //resolve(myBool);		 
			        });
			        return myBool;
					} 
			*/


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//자바 스크립트 프로트타입 클래스 방식으로  할 까... 하다가.. 기존에 프라미스를 이용해서 계속 진행 하기로.. 나중에... 프로토타입 형식으로 바꾸고 싶으면 활용해 바바바..
			/* function FirebaseChat(){ 
				this.init(); 
				this.initEvent(); 
				}

			FirebaseChat.prototype.init = function() {			
				this.curName = $('#memberName').val();
			      this.curEmail = $('#memberEmail').val(); 
			      this.curProfilePic = $('#memberProfilePic').val();
			      
				}

			FirebaseChat.prototype.initEvent = function() {
				console.log("아잭스 펑션을 타긴 하니??");
				var curUserKey;
	            //writeUserData(curName, curEmail, curProfilePic);
	            writeUserData(curName, curEmail, curProfilePic).then(function(resolvedData){
					console.log("현재 사용자의 챗방 키는용???>>" + resolvedData + "<<<<<");
	                $('#curUserKey').val(resolvedData);
	            }); 
	            
	      		$.ajax({
	      			url: "MyProjectsMates.do",
	      			type: "POST",
	      			dataType: 'json',
	      			data : { email :$('#memberEmail').val(),
	      				     name : $('#memberName').val()}, 
	      			success: function (data) {
	      				console.log("뷰단으로 데이터 들어 오나요?? >" + data);

	      				var userList;
	      				$.each(data, function(index, value) {          				
	      				  console.log(value);
	      				  console.log(value.name + " / " + value.email + " / " + value.profilePic);
	      				  //var myResult = writeUserData(value.name, value.email, value.profilePic);
	      				  //console.log("유저 디비 저장 하는 펑션 실행 한뒤 리턴 값은?? 키여야 하는데>>>>>>>>>" + myResult);

					
	      				writeUserData(value.name, value.email, value.profilePic).then(function(resolvedData){          				
	    					console.log("프라미스 실행뒤 오는 값은>>>>>>>>>>" + resolvedData + "유저리스트 값은??");
	    					//목록을 뿌리기위한 태크 뭉치들이 들어 있는 함수 콜
	    					userListUp(resolvedData, value.name);
							
	      					});

	      				});
	                     console.log("채팅방 유저목록 붙이는 태그들..." +userList);
						//$('#ulUserList').append(userList);

						//firebase database 에 신규 회원일 경우 등록 해야 하는데.. 이미 존재 하는 유전 인지 아닌지 먼저 확인을 학고 등록 해야 겠지??
	      				
	      			},
	      			error: function(xhr, status, error){
	          			console.log("아잭스 에러 터짐 ㅠㅠ");
	      		         var errorMessage = xhr.status + ': ' + xhr.statusText
	      		         alert('Error - ' + errorMessage);
	      		     }
	      		})
				} */
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			

			
	      //유저가 채팅기능 버튼을 눌렀을 때 작동하는 콜백 함수... 목적은.. firebase database 유저 정보저장(메세지 읽기, 쓰기를 위해 특정키 부여 누군인지 구분하기 위해 필요)
		  //그리고 이미 디비에 있으면...키 값을 불러서 해당 유저와 관련된 정보를 보여 주는 데 활용 할 수 있다...    
          function writeUserData(name, email, imageUrl) {
		       return new Promise(function(resolve){

		        	  var myRootRef = database.ref();
		        	  myRootRef.child("emails").orderByChild('email').equalTo(email).once('value', function(data){
		          	    console.log('현재 접속한 유저는 채팅 경험이 있나요??	 :' +email+ " / "+ data.key + " / " + data.val() + " / " +data.numChildren());		          	    
						var myResult = data.val();
						var userKey;
						if(myResult == null){
							console.log("신규회원 이메일 등록을 통한 유아디 생성과.. 유저 데이터 등록 필요");
							
							var newUser = database.ref('emails/').push({email :email});
							 userKey = newUser.key;
							console.log("새로 들어온 유저의 키 값은 ??"  + userKey);
							database.ref('users/' + newUser.key).set({
				        	    username: name,
				        	    email: email,
				        	    profile_picture : imageUrl
				        	  });
				        	 
							}else{
								console.log("이미디비에 있는 회원이므로 키값을 뽑아내서... 채팅에 활용");
								data.forEach(function(childSnapshot) {
									userKey = childSnapshot.key;
		              				console.log("이미 있는 회원의 키 값 뽑아 보자 " + userKey);	              				
		         		 		});
							}
						console.log("라이트유저 데이타 펑션에서 유저 키 함 찍어 볼까??>>>"+userKey);
						resolve(userKey);
		          	});
			          
			     });
        	}
       
				function writeProjectRoomData(name, email, imageUrl) {
					
					var roomListTarget = document.querySelectorAll('[data-roomType="MULTI"][data-roomOneVSOneTarget="'
							+ targetUserUid +'"]')[0]; 
					
					if(roomListTarget){ // null 이 아니면 여기가 핵심이다.  룰리스트 타겟있으면 새로운 방 아이디를 만들지 않는다.
						roomListTarget.click(); 
						}else{ // 메세지 로드 
							roomTitle = targetUserName+'님 과의 대화'; 
							roomUserList = [targetUserUid, curUserKey]; // 챗방 유저리스트  			
							roomUserName = [targetUserName, curName] // 챗방 유저 이름 
							roomId = '@make@' + curUserKey +'@time@' + yyyyMMddHHmmsss(); 
							console.log("새로운 상대와의 채팅이 시작 되면 룸 아이디 생성.. 그 값은요??>>>>>>>>>>>>" +roomId);
							openChatRoom(); // 파라미터 추가
							}



									
					var multiUpdates = {}; 
					var messageRef = database.ref('Messages/'+ roomId);
					var messageRefKey = messageRef.push().key	; // 메세지 키값 구하기 
					//var convertMsg = convertMsg(msg); //메세지 창에 에이치티엠엘 태그 입력 방지 코드.. 태그를 입력하면 대 공황 발생.. 그래서

					//UsersInRoom 데이터 저장
					if(document.getElementById('ulMessageList').getElementsByTagName('li').length === 0){ //메세지 처음 입력 하는 경우 
						var roomUserListLength = roomUserList.length; 
						for(var i=0; i < roomUserListLength; i++){ 
							multiUpdates['UsersInRoom/' +roomId+'/' + roomUserList[i]] = true; 
						} 
						//firebase.database().ref('usersInRoom/' + roomId);
						database.ref().update(multiUpdates); // 권한 때문에 먼저 저장해야함 
						loadMessageList(); //방에 메세지를 처음 입력하는 경우 권한때문에 다시 메세지를 로드 해주어야함 
					} 
					
					multiUpdates ={}; // 변수 초기화 

					//메세지 저장 
					multiUpdates['Messages/' + roomId + '/' + messageRefKey] = { 
							uid: curUserKey, 
							userName: curName, 
							message: convertMsg, // 태그 입력 방지
							profileImg: curProfilePic ? curProfilePic : 'noprofile.png', 
							timestamp: firebase.database.ServerValue.TIMESTAMP //서버시간 등록하기 
					} 

					//유저별 룸리스트 저장 
					var roomUserListLength = roomUserList.length;
					 
					if(roomUserList && roomUserListLength > 0){ 
						for(var i = 0; i < roomUserListLength ; i++){ 
							multiUpdates['RoomsByUser/'+ roomUserList[i] +'/'+ roomId] = { 
								roomId : roomId, 
								roomUserName : roomUserName.join('@spl@'), 
								roomUserList : roomUserList.join('@spl@'), 
								roomType : 'MULTI', 
								roomOneVSOneTarget : roomUserListLength == 2 && i == 0 ? roomUserList[1] : // 1대 1 대화이고 i 값이 0 이면 
									roomUserListLength == 2 && i == 1 ? roomUserList[0] // 1대 1 대화 이고 i값이 1이면 
									: '', // 나머지 
								lastMessage : convertMsg, 
								profileImg : curProfilePic ? curProfilePic : 'noprofile.png', 
								timestamp: firebase.database.ServerValue.TIMESTAMP 

							}; 
						} 
					} 
					database.ref().update(multiUpdates);

					//RoomsByUser 디비 업데이트 후 다시 챗방 리스트 다시 로드
					loadRoomList(curUserKey);


					//프로젝트 룸 리스트 업 하는 것이 이 함수의 목적이고 아래와 같은 파라미터가 필요하다. 룸리스트 업 함수는 태그를 리턴하다.. 그래서 포쿤을 돌려서 붙이던가 해야 함...
					var roomListTag = roomListUp(roomId, roomTitle, roomUserName,roomType, roomOneVSOneTarget, roomUserList, lastMessage, datetime);
					
		        	}	
			



			

			//채팅방 유적 목록 클릭시 실행 되는 펑션
          function onUserListClick(event){
                roomFlag = 'tabUserList';//유저 리스트를 클릭했다는 플래그
				console.log("유저 목폭 클릭 펑션 타나요?? >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				console.log("이함수 에서 현재 접속한 유저의 챗방 키 값 뽑아 보자" + $('#curUserKey').val());
				var curUserKey = $('#curUserKey').val();
				document.getElementById('aBackBtn').classList.remove('hiddendiv'); // 백버튼 노출 
				document.getElementById('aInvite').classList.remove('hiddendiv'); // 초대 버튼 노툴 			

				var targetUserUid = event.getAttribute('data-targetUserUid'); 
				console.log("targetUserUid 는 제대로 찍히나요(온 유저 리스트 클릭시)>>>>>>>>>" + targetUserUid);				
				var targetUserName = event.getAttribute('data-username'); 

				console.log("온 유저 리스 클릭시에.. 타겟 유저 유 아 이 디 가져 오나요???" + targetUserUid);

				
				//바로 위 코드 까지는 워킹~~ 아래 코드는 해당 유저를 클릭시 이미 챗방이 만들어 져 잇으면 데이타를 가져오기 위한 코드
				var roomListTarget = document.querySelectorAll('[data-roomType="ONE_VS_ONE"][data-roomOneVSOneTarget="'
										+ targetUserUid +'"]')[0]; 
				console.log("roomListTarget 이아이는 무슨 값??" + roomListTarget);
				
				
				if(roomListTarget){ // null 이 아니면 여기가 핵심이다.  룰리스트 타겟있으면 새로운 방 아이디를 만들지 않는다.
					roomListTarget.click(); 
					}else{ // 메세지 로드 
						roomTitle = targetUserName+'님 과의 대화'; 
						roomUserList = [targetUserUid, curUserKey]; // 챗방 유저리스트  			
						roomUserName = [targetUserName, curName] // 챗방 유저 이름 
						roomId = '@make@' + curUserKey +'@time@' + yyyyMMddHHmmsss(); 
						console.log("새로운 상대와의 채팅이 시작 되면 룸 아이디 생성.. 그 값은요??>>>>>>>>>>>>" +roomId);
						openChatRoom(); // 파라미터 추가
						}

							
				/* var roomTitle = targetUserName+'님 과의 대화'; 
				var roomUserList = [targetUserUid, curUserKey]; // 챗방 유저리스트  			
				var roomUserName = [targetUserName, curName] // 챗방 유저 이름 
				var roomId = '@make@' + curUserKey +'@time@' + yyyyMMddHHmmsss(); */


				//아래 함수 잠정적.... 중단...유저가....챗팅 유저 리스트 클릭시 전에 대화 한 적이 없으면.. 룸정보를 저장해야 될 것 같아서 만들었는데.... roomListTarget.click(); 요코드를 통해서 해결 되는 것이 아닌가..생각해 본다. 아마도 클릭 이벤트에.. 블라블라
				//storeRoomInfo(roomId, roomUserList);//UsersInRoom 에다가  해당 채팅방이 열릴 때 채팅방에 참여 하고 있는 유저 정보 저장 장소
				//setRoom(roomId);				
				
            }
          

		  function pressEnter(ev) {
			  console.log("챗방 메세지 입력하고 엔터 누르면 타야 되는 함수");
				console.log("openChatRoom function  변수값 받아야 하는데~~~!!!!" + roomId +"/"+roomUserList+"/"+roomUserName);
				if(ev.keyCode === 13){ //엔터키 키코드가 입력이 되면 
					ev.preventDefault();
					console.log("챗방 메세지 입력하고 엔터 누르면 타야 되는 함수 이프문 안인데  여기는 타나요??"); 
					saveMessages(); 

			  }
		  }
		

          function openChatRoom() {
             
        	  //loadRoomList(roomId); 
        	  window.isOpenRoom = true; // 방이 열린 상태인지 확인하는 플래그 값 
        	  if(roomTitle){ //상단 타이틀 변경 
            	  document.getElementById('spTitle').innerHTML = roomTitle; 
            	  } 
        	  loadMessageList(); //메세지 로드 
              $('#tabMessageList').click();
            
			console.log("이즈 오픈 룸의 값은??" + window.isOpenRoom);

			//아래 코드는 온로드 뒤에 실행 되게 위치 이동해야 함... 일단은 다른게 급하니... 남겨두고...
			document.getElementById('iBtnSend').addEventListener('click', function(){
				saveMessages();
				});

			
        	console.log("오픈챗룸 함수 마지막 단 타나요????");


			//오픈 챗방 했을 때 초대 모달 창 세팅을 위한 함수
        	setAddUserList();

        	
              }


			//챗방 초대를 위한 모달 창 세팅을 위한 함수
          function setAddUserList() {
        	  $('#ulAddUserList').html($('#ulUserList').html()); 
        	  var arrAddUserList = Array.prototype.slice.call($('#ulAddUserList li')); 
        	  console.log("setAddUserList 함수에서 arrAddUserList 요기에 담기는 값은?? " + arrAddUserList);
        	  console.log("setAddUserList 함수 탔을 때... 룸 유저 리스트 값은??>>>>" + roomUserList);
        	 
        	  arrAddUserList.forEach(cbArrayForEach);
           }


          var cbArrayForEach = function(item){
              item.removeAttribute('onclick');  
              
        	  var itemUserUid = item.getAttribute('data-targetUserUid'); 
        	 
    	  	  if(roomUserList.indexOf(itemUserUid) === -1){
        	  	  console.log("여기는 타기는 할까???");
        	  	
        	  	
        	  	item.getElementsByClassName('done')[0].classList.remove('hiddendiv'); 
        	  	item.addEventListener('click',function(){
            	  	console.log("클릭 이벤트 리슨너가 왜 안들어가냐???-----------------------------------------------"); 
            	  if(Array.prototype.slice.call(item.classList).indexOf('blue-text') == -1){ 
                	  item.classList.add('blue-text'); 
                	  }else{ 
                    	  item.classList.remove('blue-text'); 
                    	  } 
            	  }); 
        	  }else{ 
            	  item.parentNode.removeChild(item); 
            	  } 
    	  } 		

          /** * 메세지 로드 */ 
          function loadMessageList(){ 
              console.log("메세지 로드 함수 타나요??");
              console.log("아잭스에서 선언된 윈도우.. 글로벌 변수 찍히나 여기서??" + window.myUserKy);             
              var myKey = $('#curUserKey').val();
                           
              var messageRef = database.ref('Messages/'+roomId);

             if(roomId){ 
                 document.getElementById('ulMessageList').innerHTML = ''; //메세지 화면 리셋 
                 console.log("이프 룸아이디 밑에다.. 여기 타나요??");
					//언더스코어 제이에서 어쩌구... 자꾸 에러 나서 .. 그리고 어케 사용하는 지 몰라서 포기........
                 //var messageTemplate = document.getElementById('templateMessageList').innerHTML;

              
                 
                 messageRef.off();
        
             	  //underscore.js 사용 포기..... 두시간이나 해매고....젠...
                 /* var cbDisplayMessages = function(data) { 
                 	var messageHtml = ''; 
                 	var val = data.val(); 
                 	messageHtml = _.template(messageTemplate)( { 
                     	key : data.key , 
                    	profileImg : val.profileImg , 
                     	userName : val.userName , 
                     	time : FirebaseChat.timestampToTime(val.timestamp) , 
                     	message : val.message 
                     	}); 
                  	  	this.ulMessageList.innerHTML = this.ulMessageList.innerHTML + messageHtml; 
                 	  	this.ulMessageList.scrollTop = this.ulMessageList.scrollHeight; 
                 	  	this.roomTitle = val.roomTitle; 
                 }  */
                 messageRef.limitToLast(50).on('child_added', function(data){
                     	console.log("여기까지 오긴 하는 거니??~~~~~~~~~~~~~~~~~~~~~~데이타 값은~~~~~~~~~~~~~~~~~~" + data + " / " + data.val());
                     	var msgKey = data.val();
                     	console.log("데이타 값은~~~~~~~~~~~~~~~~~~" + data + " / " + data.key + "/"+msgKey.userName);
           			 	messageListUp(data.key, msgKey.profileImg, msgKey.timestamp, msgKey.userName, msgKey.message);              				
      		 		
							
                     }); 
             }else{
           	  messageRef.limitToLast(50).on('child_added', function(data){
                   	console.log("여기까지 오긴 하는 거니??~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
             	  data.forEach(function(childSnapshot) {
							var msgKey = childSnapshot.key;
         				console.log("메세지 로드 함수를 타긴 하는거야 머야??? " + msgKey);
                 }); 
           	  });
           } 

         }
			




          /** * 두번째 탭 채팅방 목록리스트 호출 */
  		function loadRoomList(uid) {
  			document.getElementById('ulRoomList').innerHTML='';
			var ulRoomList = document.getElementById('ulRoomList');
			//var curUserKey = $('#curUserKey').val();			
			var roomRef = database.ref('RoomsByUser/'+ uid);
			console.log("현재 유저의 키 찍히나??>>>>>>>>>>>>>>>>>>>>>>" + uid)	;
			console.log("loadRoomList 함수에서 찍히는 현재 유저의 uid >???>>>?????" + uid +"/"+roomRef);					 
			roomRef.off(); 
			roomRef.orderByChild('timestamp').on('value', function(snapshot){
				console.log("loadRoomList 함수 아래다.. 쿼리문 날리고.. 데이타 들어 오나 확인중....." + ">>"+snapshot+"<<" + snapshot.exists());
				console.log(snapshot+"/"+snapshot.numChildren());
	
				var arrRoomListHtml = []; 			
				snapshot.forEach(function(data){
						var val = data.val();				
						console.log(val.roomId);
						console.log(val.roomUserName);
						console.log(val.timestamp);

						
						var arrRoomUserName = val.roomUserName.split('@spl@');
						console.log("어레이 룸 유져 네임 에 찍히는 값은??" + arrRoomUserName); 
						arrRoomUserName.splice(arrRoomUserName.indexOf(curName), 1); // 방 제목 타이틀에서는 자신의 이름을 제외합니다. 
						var eachRoomTitle = arrRoomUserName.length > 1 ? arrRoomUserName[0] + " 외 " + (arrRoomUserName.length - 1) + "명 참여중" : arrRoomUserName[0] +'님과의 대화'; 
						if(data.key === roomId && window.isOpenRoom){ //데이터 키가 현재 방ID와 같고 채팅방이 열려있는 경우에 현재 메세지 상단 제목을 갱신해줍니다. 
							document.getElementById('spTitle').innerHTML = eachRoomTitle; 
						} 
						var roomId = data.key,
						lastMessage = val.lastMessage, 
						profileImg = val.profileImg, 
						roomTitle = eachRoomTitle, 
						roomUserName =val.roomUserName, 
						roomUserList = val.roomUserList, 
						roomType = val.roomType, 
						roomOneVSOneTarget = val.roomOneVSOneTarget, 
						datetime = timestampToTimeForRoomList(val.timestamp); 

						arrRoomListHtml.push(roomListUp(roomId, roomTitle, roomUserName,roomType, roomOneVSOneTarget, roomUserList, lastMessage, datetime));
					}); 

				console.log("너는 어레이 타입이니????" + Array.isArray(arrRoomListHtml));
				console.log(arrRoomListHtml.length);
				console.log("조인 붙이고" +arrRoomListHtml.reverse().join(''));
				console.log("조인 안 아니아ㅣㄴ  붙이고" +arrRoomListHtml.reverse());
				
				//var reversedRoomList = arrRoomListHtml.reverse().join(''); // 역순 정렬, 끝에 싱글 코테이션 조인 해야 되나??? 오류 나올듯 도 한데.... 
				var reversedRoomList = arrRoomListHtml.reverse();
				console.log(typeof reversedRoomList);
				console.log("너는 어레이 타입이니????" + Array.isArray(reversedRoomList));
				console.log(reversedRoomList);

				reversedRoomList.forEach(function(item, index){
					console.log("여기를 타야 그 챗방 리스트를 뿌려 줄수 있다... 과연...." + item);
					$('#ulRoomList').append(item);
					}); 
				
				});
  	  		}

  		function onRoomListClick(event){
  	  		console.log("++++++++++++당신은 채팅방 리스트를 클릭했거나... 유저목록에서.. 이미 채팅한적이 있는 유저를 클릭했습니다.");
  	  		roomFlag = 'tabRoomList'; //채팅방을 클릭했다는 것을 알기 위한 플래그
  	  		document.getElementById('aBackBtn').classList.remove('hiddendiv'); 
  	  		document.getElementById('aInvite').classList.remove('hiddendiv'); 

  			// 메세지 로드 
  			roomId = event.getAttribute('data-roomId'); 
  			roomTitle = event.getAttribute('data-roomTitle'); 
  			roomUserList = event.getAttribute('data-roomUserList').split('@spl@'); // 챗방 유저리스트  			
  			roomUserName = event.getAttribute('data-roomUserName').split('@spl@'); // 챗방 유저 이름 
  			openChatRoom();   

            console.log("온 룸 리스트 클릭 함수 타냐?????");
  			// 메세지 화면 이동 
  			 $('#tabMessageList').click();
  	  		}


  		/** * RoomList 화면 시간변환 */ 
  		var timestampToTimeForRoomList = function(timestamp){ 
  	  		var date = new Date(timestamp), 
  	  			year = date.getFullYear(), 
  	  			month = date.getMonth()+1, 
  	  			day = date.getDate(), 
  	  			hour = date.getHours(), 
  	  			minute = date.getMinutes(); 
  	  		var nowDate = new Date(), 
  	  			nowYear = nowDate.getFullYear(), 
  	  			nowMonth = nowDate.getMonth()+1, 
  	  			nowDay = nowDate.getDate(), 
  	  			nowHour = nowDate.getHours(), 
  	  			nowMinute = nowDate.getMinutes(); 
	  		var result; 
	  		if(year === nowYear && month === nowMonth && day === nowDay){ 
		  		result = pad(hour) +":" + pad(minute); 
		  	}else{ 
			  	result = pad(year) +"-" + pad(month) + "-" + pad(day); 
			  	} 
		  	return result; 

		  	}

	  	function pad(n) {
	  		return n > 9 ? "" + n: "0" + n;  		
		  	}

  		

  			
			/* function onEnterKey(ev, roomId, roomUserList, roomUserName) {
				console.log("챗방 메세지 입력하고 엔터 누르면 타야 되는 함수");
				if(ev.keyCode === 13){ //엔터키 키코드가 입력이 되면 
					ev.preventDefault();
					console.log("챗방 메세지 입력하고 엔터 누르면 타야 되는 함수 이프문 안인데  여기는 타나요??"); 
					saveMessages(roomId, roomUserList,roomUserName); 
					}
				} */


			//자주 쓰는 값은 컨스트로 설정하려 했으나...  유저키는 파베에서 받아 오는 거라... 에러 날 것 같음...
			/* const curUserKey = $('#curUserKey').val();
			const curUserName = $('#memberName').val();
			const curUserEmail = $('#memberEmail').val();
			const curUserProfilePic = $('#memberProfilePic').val();
 */

 
 				/** * 메세지에 태그 입력시 변경하기 */ 
 			function myConvertMsg(html){ 
				console.log("챗 메세지 창 태그 방지 함수 타나요???");
	  			var tmp = document.createElement("DIV"); 
	  			tmp.innerHTML = html; 
	  			return tmp.textContent || tmp.innerText || ""; 
		 	}
			
			function saveMessages(inviteMessage) {
				console.log("세이브 메세지 함수 여기까지 룸 아이디 오나요???" + roomId + " / " + roomUserList + " / " +roomUserName);
				console.log("세이브 메세지 함수 여기까지 룸 아이디 오나요???" + roomUserList);
				var msgDiv = document.getElementById('dvInputChat');
				var msg = inviteMessage ? inviteMessage : msgDiv.innerHTML.trim(); 
				console.log("메세지 왜 못 잡아??" + msg);
				var curUserKey = $('#curUserKey').val();
				var curUserName = $('#memberName').val();	
				console.log("세이브 메세지 함수  현재 사용중인 유저 이름 가져오기  ~~~????>>>>>>" + curUserName);			
				var curUserProfilePic = curProfilePic;
				var convertMsg = myConvertMsg(msg); //메세지 창에 에이치티엠엘 태그 입력 방지 코드.. 태그를 입력하면 대 공황 발생.. 그래서
				if(msg.length > 0){ 
					msgDiv.focus(); 
					msgDiv.innerHTML = ''; 
					var multiUpdates = {}; 
					var messageRef = database.ref('Messages/'+ roomId);
					var messageRefKey = messageRef.push().key	; // 메세지 키값 구하기 
					//var convertMsg = convertMsg(msg); //메세지 창에 에이치티엠엘 태그 입력 방지 코드.. 태그를 입력하면 대 공황 발생.. 그래서

					//UsersInRoom 데이터 저장
					if(document.getElementById('ulMessageList').getElementsByTagName('li').length === 0){ //메세지 처음 입력 하는 경우 
						var roomUserListLength = roomUserList.length; 
						for(var i=0; i < roomUserListLength; i++){ 
							multiUpdates['UsersInRoom/' +roomId+'/' + roomUserList[i]] = true; 
						} 
						//firebase.database().ref('usersInRoom/' + roomId);
						database.ref().update(multiUpdates); // 권한 때문에 먼저 저장해야함 
						loadMessageList(); //방에 메세지를 처음 입력하는 경우 권한때문에 다시 메세지를 로드 해주어야함 
					} 
					
					multiUpdates ={}; // 변수 초기화 

					//메세지 저장 
					multiUpdates['Messages/' + roomId + '/' + messageRefKey] = { 
							uid: curUserKey, 
							userName: curName, 
							message: convertMsg, // 태그 입력 방지
							profileImg: curProfilePic ? curProfilePic : 'noprofile.png', 
							timestamp: firebase.database.ServerValue.TIMESTAMP //서버시간 등록하기 
					} 

					//유저별 룸리스트 저장 
					var roomUserListLength = roomUserList.length;
					 
					if(roomUserList && roomUserListLength > 0){ 
						for(var i = 0; i < roomUserListLength ; i++){ 
							multiUpdates['RoomsByUser/'+ roomUserList[i] +'/'+ roomId] = { 
								roomId : roomId, 
								roomUserName : roomUserName.join('@spl@'), 
								roomUserList : roomUserList.join('@spl@'), 
								roomType : roomUserListLength > 2 ? 'MULTI' : 'ONE_VS_ONE', 
								roomOneVSOneTarget : roomUserListLength == 2 && i == 0 ? roomUserList[1] : // 1대 1 대화이고 i 값이 0 이면 
									roomUserListLength == 2 && i == 1 ? roomUserList[0] // 1대 1 대화 이고 i값이 1이면 
									: '', // 나머지 
								lastMessage : convertMsg, 
								profileImg : curProfilePic ? curProfilePic : 'noprofile.png', 
								timestamp: firebase.database.ServerValue.TIMESTAMP 

							}; 
						} 
					} 
					database.ref().update(multiUpdates);

					//RoomsByUser 디비 업데이트 후 다시 챗방 리스트 다시 로드
					loadRoomList(curUserKey);

					
					
				} 
		   }


			

		

			
          
          //var newChild = messageRef.push('Hi, there!!');
          //console.log("new key :" + newChild.key);
          //messageRef.push('Test push method ^^');
          //console.log("new key :" + messageRef.key);
          
          /* const msgOutRef = database.ref('/messages/myFirstMessage');
          msgOutRef.on('value', (value) => console.log("메세지가 추가 되면 찍히는 콘솔" +value.val())); */
          

         
            

			// example of firebase 'exists'...
          /*   var ref = firebase.database().ref("s/ + roomId");
     	   ref.once("value")
     	     .then(function(snapshot) {
     	       var a = snapshot.exists();  // true
     	       var b = snapshot.child("name").exists(); // true
     	       var c = snapshot.child("name/first").exists(); // true
     	       var d = snapshot.child("name/middle").exists(); // false
     	     }); */

          
          /** * 현재날짜 yyyyMMddHHmmsss형태로 반환 */ 
          var yyyyMMddHHmmsss =function(){ 
              var vDate = new Date(); 
              var yyyy = vDate.getFullYear().toString(); 
              var MM = (vDate.getMonth() + 1).toString(); 
              var dd = vDate.getDate().toString(); 
              var HH = vDate.getHours().toString(); 
              var mm = vDate.getMinutes().toString(); 
              var ss = vDate.getSeconds().toString(); 
              var sss= vDate.getMilliseconds().toString(); 
              return yyyy + (MM[1] ? MM : '0'+MM[0]) + (dd[1] ? dd : '0'+dd[0]) + (HH[1] ? HH : '0'+ HH[0]) + (mm[1] ? mm : '0'+ mm[0]) + (ss[1] ? ss : '0'+ss[0])+ sss; 
              };

          
              /** * timestamp를 날짜 시간 으로 변환 */ 
              var timestampToTime = function(timestamp){ 
                  var date = new Date(timestamp), 
                  	  year = date.getFullYear(), 
                  	  month = date.getMonth()+1, 
                  	  day = date.getDate(), 
                  	  hour = date.getHours(), 
                  	  minute = date.getMinutes(), 
                  	  week = new Array('일', '월', '화', '수', '목', '금', '토'); 
              	  var convertDate = year + "년 "+month+"월 "+ day +"일 ("+ week[date.getDay()] +") "; 
              	  var convertHour=""; 
              	  if(hour < 12){ 
                  	  convertHour = "오전 " + FirebaseChat.pad(hour) +":" + FirebaseChat.pad(minute); 
                  	  }else if(hour === 12){ 
                      	  convertHour = "오후 " + FirebaseChat.pad(hour) +":" + FirebaseChat.pad(minute); 
                      	  }else{ convertHour = "오후 " + FirebaseChat.pad(hour - 12) +":" + FirebaseChat.pad(minute); 
                      	  } 
              	  return convertDate + convertHour; 

              }

              
          
        	
          //writeUserData('js king', 'sdkjfsdl@naver.com', 'view/coolguy.jpg');

          var rootRef = database.ref();

          var userListUp = function(targetuid, name, userpic){
        	  var userProPic = 	(userpic ? 'resources/images/user/'+ userpic : 'resources/images/user/noprofile.png'); 
        	  var userTemplate = '<li id="li' + targetuid +'" data-targetUserUid="' +targetuid + '" data-username="' + 
							  name + '" class="collection-item avatar list" onclick = "onUserListClick(this)">' +
          					 '<img src="' + userProPic + '" alt="" class="circle">' +
         					 '<span class="title">'+ name+ '</span>'+
          					 '<span class="small material-icons right hiddendiv done">done</span>'+
          					 '<span class="small material-icons right hiddendiv mood yellow-text">mood</span>'+
          					 '</li>';
        	  $('#ulUserList').append(userTemplate);
        	
              
              }
          
	
          var messageListUp= function(key, profileImg, time, userName, message){
              console.log("messageListUp 함수..데이타 들어오냐??" + key+"/"+profileImg+"/"+time+"/"+userName+"/"+message);
			  var userProPic = 	(profileImg ? 'resources/images/user/'+ profileImg : 'resources/images/user/noprofile.png');
        	  var messageTemplate = '<li id="li' + key  + '" class="collection-item avatar" data-key="' + key + '">'+
  									'<img src="'+ userProPic +'" alt="" class="circle">'+
  									'<span class="title">'+userName+'</span><span class="time">'+time+'</span>'+
  									'<p>'+message+'</p>'+
  					 				'</li>'; 
          
        	  $('#ulMessageList').append(messageTemplate);
        	  messageTemplate += '먼데 안들어가는 거야??';
        	  console.log("messageListUp 합수 타변 변수에 담기는 값들은??>>>" +messageTemplate);
          } 

          var roomListUp = function(roomId, roomTitle, roomUserName,roomType, roomOneVSOneTarget, roomUserList, lastMessage, datetime){
        	    var userProPic = 	(curProfilePic ? curProfilePic : 'resources/images/user/noprofile.png');
				var roomTemplate = '<li id="liRoom' + roomId + '" data-roomId="' + roomId + '" data-roomTitle="' 
									+ roomTitle+ '" data-roomUserName="'+roomUserName+ '" data-roomType="'+roomType+'" data-roomOneVSOneTarget="'
									+roomOneVSOneTarget+'" data-roomUserList="'+roomUserList +'" class="collection-item avatar" onclick="onRoomListClick(this)">'
	            					+'<img src="' + userProPic + '" alt="" class="circle">'
	            					+'<span class="title">'+roomTitle+'</span>'
	            					+'<p>'+lastMessage +'</p>'
	            					+'<a href="#!" class="secondary-content">' +datetime +'</a>'
	        						+'</li>';	



					return roomTemplate;	
              }
          
          function onBackBtnClick(){ 
              window.isOpenRoom = false; 
              document.getElementById('aBackBtn').classList.add('hiddendiv'); 
              document.getElementById('aInvite').classList.add('hiddendiv'); 
              console.log("백 버튼 누르면 룸 플래그 값은 ??" + roomFlag);
              document.getElementById(roomFlag).click(); 
              document.getElementById('spTitle').innerText = 'OWL Chat Room'; 
              document.getElementById('ulMessageList').innerHTML='';
              
               
              }

          function onConfirmInviteClick(){
              console.log("채팅 추가 버튼 클릭시 타는 함수!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
              console.log("제이쿼리 실험....." + $('.blue-text').eq(0));
        	  //var arrInviteUserList = Array.prototype.slice.call(this.ulAddUserList.getElementsByClassName('blue-text')); 
        	  var arrInviteUserList = Array.prototype.slice.call($('.blue-text'));
        	  console.log("arrInviteUserList 요거 값 들어 오나요???" + arrInviteUserList);
        	  var arrInviteUserListLength = arrInviteUserList.length;
        	  console.log("렝스는~~~~~~~~~~~~~~~~~~~~~~~~~~~" + arrInviteUserListLength); 
        	  var arrInviteUserName = []; 
        	  var updates = {}; 
        	  for(var i=0; i < arrInviteUserListLength; i++){ 
            	  var inviteUserUid = arrInviteUserList[i].getAttribute('data-targetUserUid'); 
            	  var inviteUserName = arrInviteUserList[i].getAttribute('data-username') + '님'; 
            	  updates['UsersInRoom/'+ roomId +'/'+ inviteUserUid] = true; 
            	  arrInviteUserList[i].outerHTML = ''; 
            	  roomUserList.push(inviteUserUid); 
            	  roomUserName.push(inviteUserName); 
            	  arrInviteUserName.push(inviteUserName); 
            	  } 
        	  roomUserList.sort(); 
              database.ref().update(updates); //초대 메세지 
              saveMessages(arrInviteUserName.join() + '이 초대되었습니다.');

           }
			
          
          
          /*
          var db = firebase.firestore();
          db.collection("users").add({
        	    first: "Ada",
        	    last: "Lovelace",
        	    born: 1815
        	})
        	.then(function(docRef) {
        	    console.log("Document written with ID: ", docRef.id);
        	})
        	.catch(function(error) {
        	    console.error("Error adding document: ", error);
        	});
			*/	


	           
          console.log("널인가???" + curName + " / " + curEmail);

			// 초기화 를 위한 온로드 함수... 같은 프로제트에 있는 유저목록과 프로젝트 채팅방을 만들기 위한 정보를 디비에서 뽑아낸다.	
          $(function(){
            console.log("아잭스 펑션을 타긴 하니??");
			var curUserKey;
            //writeUserData(curName, curEmail, curProfilePic);
            writeUserData(curName, curEmail, curProfilePic).then(function(resolvedData){
				console.log("현재 사용자의 챗방 키는용???>>" + resolvedData + "<<<<<");
                $('#curUserKey').val(resolvedData);
                window.myUserKy = resolvedData;
                loadRoomList(resolvedData);
                
                
            }); 

            //같은 프로젝트에 있는 유저 정보를 뽑아오는 아젝스...요걸로 채팅 가능한 유저들 리스트 화면 뿌려 준다.
      		$.ajax({
      			url: "MyProjectsMates.do",
      			type: "POST",
      			dataType: 'json',
      			data : { email : curEmail,
      				     name : curName }, 
      			success: function (data) {
      				console.log("뷰단으로 데이터 들어 오나요?? >" + data);

      				
      				$.each(data, function(index, value) {          				
      				  console.log(value);
      				  console.log(value.name + " / " + value.email + " / " + value.profilePic);
      				  //var myResult = writeUserData(value.name, value.email, value.profilePic);
      				  //console.log("유저 디비 저장 하는 펑션 실행 한뒤 리턴 값은?? 키여야 하는데>>>>>>>>>" + myResult);

				
      				writeUserData(value.name, value.email, value.profilePic).then(function(resolvedData){          				
    					console.log("프라미스 실행뒤 오는 값은>>>>>>>>>>" + resolvedData + "유저리스트 값은??");
    					//목록을 뿌리기위한 태크 뭉치들이 들어 있는 함수 콜
    					userListUp(resolvedData, value.name, value.profilePic );
						
      					});

      				});
                     
      				
      			},
      			error: function(xhr, status, error){
          			console.log("아잭스 에러 터짐 ㅠㅠ");
      		         var errorMessage = xhr.status + ': ' + xhr.statusText
      		         alert('Error - ' + errorMessage);
      		     }
      		});

			//같은 프로젝트에 있는 유저들끼리의 챗방을 만들기 위한 아젝스.... 요게 가능 한가... 아....
      		$.ajax({
      			url: "MyProjectsMatesFull.do",
      			type: "POST",
      			dataType: 'json',
      			data : { email : curEmail,
      				     name : curName }, 
      			success: function (data) {
      				console.log("뷰단으로 데이터 들어 오나요?? >" + data);

      			    var projectIdxGrouped = new Set();
      			    
      				$.each(data, function(index, value) {          				
      				  console.log(value);
      				  console.log("풀리스트" +value.name + " / " + value.email + " / " + value.profilePic + " / " + value.projectIdx);
      				projectIdxGrouped.add(value.projectIdx);
      				  
      				  //var myResult = writeUserData(value.name, value.email, value.profilePic);
      				  //console.log("유저 디비 저장 하는 펑션 실행 한뒤 리턴 값은?? 키여야 하는데>>>>>>>>>" + myResult);

      				  //같은 프로젝트에 속해 있는 유저들간의  챗방을 만들기 위해서 우선 디비에서 같은 프로젝트에 속해 있는 유저 정보 뽑아 오고.. 
      				  // 요 데이타를 그룹핑 하고... 함수에 태워서.... 채팅방을 만든다....
						
      				
      				

      				});
	
      				console.log("너의 프로젝트 아이디엑스는>>>>>>>>>>>>>>>>>>>>>>>" + projectIdxGrouped);
      				
      				var arrIdx = [...projectIdxGrouped];
      				console.log("어레이로 바뀌었을까????????????????????????" + arrIdx);
      				console.log(arrIdx.length);
      				console.log(arrIdx[0]);
                   
      				$.each(data, function(index, value) {          				
        				  
      					for(var i=0; i<arrIdx.length; i++){
                            if(arrIdx[i] == value.projectIdx){
                                

                                }
    						}
		

        				});


      				
      				//바로 아래 함수는 위 아젝스에 받은 데이터..... 콜렉션을.. 그룹핑해서... 그 데이터를 가지고... 파이어 베이스에 데이터 저장을 위한 함수...
      				//writeProjectRoomData(value.name, value.email, value.profilePic); 
      				
      			},
      			error: function(xhr, status, error){
          			console.log("풀리스트 불러오는 아잭스 에러 터짐 ㅠㅠ");
      		         var errorMessage = xhr.status + ': ' + xhr.statusText
      		         alert('Error - ' + errorMessage);
      		     }
      		});

      		
		//온로드 뒤에 백 버튼 리스너 달기
    		$('#aBackBtn').click(onBackBtnClick);

      	//메세지 입력창 키다운 이벤트 달기
			document.getElementById('dvInputChat').addEventListener('keydown', pressEnter);

		//채팅 초대창 모달 띄우기
			 //FirebaseChat 클래스 초기화
				 //다운로드 프로그레스 팝업 modal 설정 
				 $('#dnModal').modal(); 
				 
				 //채팅방 초대 modal 설정 
				 $('#dvAddUser').modal(); 
				 console.log("모달 설정하는 제이쿼리 실행된거야 머야??????>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
				

		//초대 모달창에서 초대 버튼 클릭시  체크된 인원을 현재 챗방에 추가하는 클릭 리스너
			$('#aConfirmInvite').click(onConfirmInviteClick);


      	});	
          
      </script>
  </body>
</html>


