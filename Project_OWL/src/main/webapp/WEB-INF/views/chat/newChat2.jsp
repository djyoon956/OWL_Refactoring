<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OWL Chat</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="resources/css/materialize.min.css"  media="screen,projection"/>
    <link rel="stylesheet" href="resources/css/custom.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
    
  </head>
  <body>
   <c:set var="member" value="${member}" scope="request"/>
   <input type="hidden" id='memberName'value='${member.name}'>
   <input type="hidden" id='memberEmail'value='${member.email}'>
    <input type="hidden" id='memberProfilePic'value='${member.profilePic}'>
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
            data-roomType="<%=roomType%>" data-roomOneVSOneTarget="<%=roomOneVSOneTarget%>" data-roomUserlist="<%=roomUserlist %>" class="collection-item avatar" >
            <img src="<%=profileImg ? profileImg : 'img/noprofile.png'  %>" alt="" class="circle">
            <span class="title"><%=roomTitle%></span>
            <p><%=lastMessage %></p>
            <a href="#!" class="secondary-content"> <%=datetime %></a>
        </li>
    </script> 
     --> --%>
    
      <!-- <script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script> -->
      <script type="text/javascript" src="resources/js/materialize.min.js"></script>
      <script type="text/javascript" src="resources/js/underscore-min.js"></script>
      
      
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
      
          /**
           *  FirebaseChat ES5 클래스
           */
          //function FirebaseChat(){
        	 

        	  

         // }         
          /**
           * Dom 로딩 후 동작
           */
         // document.addEventListener('DOMContentLoaded', function() {
              //FirebaseChat 클래스 초기화
          //    window.fbChat = new FirebaseChat();

              //다운로드 프로그레스 팝업 modal 설정
        //      $('#dnModal').modal();
              //채팅방 초대 modal 설정
          //    $('#dvAddUser').modal();
       //   });
          
          
          
          
          
          
          
          
          console.log('what???????????????');
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
          var database = firebase.database();
             
   


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

		        	  var myEmail = firebase.database().ref();
		        	  myEmail.child("emails").orderByChild('email').equalTo(email).once('value', function(data){
		          	    console.log('현재 접속한 유저는 채팅 경험이 있나요??	 :' +email+ " / "+ data.key + " / " + data.val() + " / " +data.numChildren());		          	    
						var myResult = data.val();
						var userKey;
						if(myResult == null){
							console.log("신규회원 이메일 등록을 통한 유아디 생성과.. 유저 데이터 등록 필요");
							
							var newUser = firebase.database().ref('emails/').push({email :email});
							 userKey = newUser.key;
							console.log("새로 들어온 유저의 키 값은 ??"  + userKey);
							firebase.database().ref('users/' + newUser.key).set({
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
       

			
			
				

			//채팅방 유적 목록 클릭시 실행 되는 펑션
          function onUserListClick(event){
				console.log("유저 목폭 클릭 펑션 타나요?? >>");
				console.log("이함수 에서 현재 접속한 유저의 챗방 키 값 뽑아 보자" + $('#curUserKey').val());
				var curUserKey = $('#curUserKey').val();
				this.aBackBtn.classList.remove('hiddendiv'); // 백버튼 노출 
				this.aInvite.classList.remove('hiddendiv'); // 초대 버튼 노툴 			

				var targetUserUid = event.getAttribute('data-targetUserUid'); 				
				var targetUserName = event.getAttribute('data-username'); 
				var roomTitle = targetUserName+'님 과의 대화'; 
				var roomUserList = {targetUserUid, curUserKey}; // 챗방 유저리스트  			
				var roomUserName = [targetUserName, $('#memberName').val()] // 챗방 유저 이름 
				var roomId = '@make@' + curUserKey +'@time@' + yyyyMMddHHmmsss();
				storeRoomInfo(roomId, roomUserList);
				setMessage(roomId);
				console.log("룸아이뒤 생성되나요??>>>" + roomId);
				openChatRoom(roomId, roomTitle); // 파라미터 추가
            }
          
          //const messageRef = firebase.database().ref('/messages/' + 'roomId');
		function setMessage(roomId){
			
			var messageRef = firebase.database().ref('messages/');
			 
			 messageRef.set(roomId);
			 console.log("메세지 아이디를 얻어 보자 이것은 메세지 폴더에 룸아이디만 있는 거고" );
			 
			}
		function storeRoomInfo(roomId, roomUserList){
			 var roomRef = firebase.database().ref('usersInRoom/' + roomId);
			 roomRef.set(roomUserList);
			}
  		

          function openChatRoom(roomId, roomTitle) { 
        	  var isOpenRoom = true; // 방이 열린 상태인지 확인하는 플래그 값 
        	  if(roomTitle){ //상단 타이틀 변경 
            	  document.getElementById('spTitle').innerHTML = roomTitle; 
            	  } 
        	  loadMessageList(roomId); //메세지 로드 
              tabMessageList.click();
            
			console.log("이즈 오픈 룸의 값은??" + isOpenRoom);


			document.getElementById('dvInputChat').addEventListener('keydown', onEnterKey(this, roomId));

			document.getElementById('iBtnSend').addEventListener('click', saveMessages());

			
        	
              }


			function onEnterKey(ev, roomId) {
				if(ev.keyCode === 13){ //엔터키 키코드가 입력이 되면 
					ev.preventDefault(); 
					saveMessages(roomId); 
					}
				}
			
			function saveMessages(roomId) {

				var user = $('#curUserKey'); 
				var msgDiv = document.getElementById('dvInputChat');
				var msg = msgDiv.innerHTML.trim(); 
				
				if(msg.length > 0){ 
					msgDiv.focus(); 
					msgDiv.innerHTML = ''; 
					var multiUpdates = {}; 
					var messageRef = firebase.database().ref('messages/'+ roomId);
					var messageRefKey = messageRef.push().key	; // 메세지 키값 구하기 
					var convertMsg = FirebaseChat.convertMsg(msg); 

					
					if(this.ulMessageList.getElementsByTagName('li').length === 0){ //메세지 처음 입력 하는 경우 
						var roomUserlistLength =this.roomUserlist.length; 
						for(var i=0; i < roomUserlistLength; i++){ 
							multiUpdates['RoomUsers/' +this.roomId+'/' +this.roomUserlist[i]] = true; 
						} 
						this.database.ref().update(multiUpdates); // 권한 때문에 먼저 저장해야함 
						this.loadMessageList(this.roomId); //방에 메세지를 처음 입력하는 경우 권한때문에 다시 메세지를 로드 해주어야함 
					} 
					
					multiUpdates ={}; // 변수 초기화 

					//메세지 저장 
					multiUpdates['Messages/' +this.roomId + '/' + messageRefKey] = { 
							uid: user.uid, 
							userName: user.displayName, 
							message: convertMsg, // 태그 입력 방지
							profileImg: user.photoURL ? user.photoURL : '', 
							timestamp: firebase.database.ServerValue.TIMESTAMP //서버시간 등록하기 
					} 

					//유저별 룸리스트 저장 
					var roomUserListLength = this.roomUserlist.length; 
					if(this.roomUserlist && roomUserListLength > 0){ 
						for(var i = 0; i < roomUserListLength ; i++){ 
							multiUpdates['UserRooms/'+ this.roomUserlist[i] +'/'+ this.roomId] = { 
								roomId : this.roomId, 
								roomUserName : this.roomUserName.join(this.SPLIT_CHAR), 
								roomUserlist : this.roomUserlist.join(this.SPLIT_CHAR), 
								roomType : roomUserListLength > 2 ? this.MULTI : this.ONE_VS_ONE, 
								roomOneVSOneTarget : roomUserListLength == 2 && i == 0 ? this.roomUserlist[1] : // 1대 1 대화이고 i 값이 0 이면 
									roomUserListLength == 2 && i == 1 ? this.roomUserlist[0] // 1대 1 대화 이고 i값이 1이면 
									: '', // 나머지 
								lastMessage : convertMsg, 
								profileImg : user.photoURL ? user.photoURL : '', 
								timestamp: firebase.database.ServerValue.TIMESTAMP 

							}; 
						} 
					} 
					this.database.ref().update(multiUpdates); 
				} 
		   }

		

			
          
          //var newChild = messageRef.push('Hi, there!!');
          //console.log("new key :" + newChild.key);
          //messageRef.push('Test push method ^^');
          //console.log("new key :" + messageRef.key);
          
          const msgOutRef = firebase.database().ref('/messages/myFirstMessage');
          msgOutRef.on('value', (value) => console.log("메세지가 추가 되면 찍히는 콘솔" +value.val()));
          

          /** * 메세지 로드 */ 
           function loadMessageList(roomId){ 
               console.log("메세지 로드 함수 타나요??");
              if(roomId){ 
                  document.getElementById('ulMessageList').innerHTML = ''; //메세지 화면 리셋 
                  console.log("이프 룸아이디 밑에다.. 여기 타나요??");
					//언더스코어 제이에서 어쩌구... 자꾸 에러 나서 .. 그리고 어케 사용하는 지 몰라서 포기........
                  //var messageTemplate = document.getElementById('templateMessageList').innerHTML;

               
                  var messageRef = firebase.database().ref('Messages/');
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
                  messageRef.child(roomId).limitToLast(50).on('child_added', function(data){
                      	console.log("여기까지 오긴 하는 거니??~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
                	  data.forEach(function(childSnapshot) {
							var msgKey = childSnapshot.key;
            				console.log("메세지 로드 함수를 타긴 하는거야 머야??? " + msgKey);	              				
       		 		});
							
                      }); 
              }else{
            	  messageRef.limitToLast(50).on('child_added', function(data){
                    	console.log("여기까지 오긴 하는 거니??~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
              	  data.forEach(function(childSnapshot) {
							var msgKey = childSnapshot.key;
          				console.log("메세지 로드 함수를 타긴 하는거야 머야??? " + msgKey);
                  } 
            } 

			
            

			// example of firebase 'exists'...
            var ref = firebase.database().ref("s/ + roomId");
     	   ref.once("value")
     	     .then(function(snapshot) {
     	       var a = snapshot.exists();  // true
     	       var b = snapshot.child("name").exists(); // true
     	       var c = snapshot.child("name/first").exists(); // true
     	       var d = snapshot.child("name/middle").exists(); // false
     	     });

          
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

          var rootRef = firebase.database().ref();

          var userListUp = function(uid, name){
               
        	  var userList = '<li id="li' + uid +'" data-targetUserUid="' +uid + '" data-username="' + 
							  name + '" class="collection-item avatar list" onclick = "onUserListClick(this)">' +
          					 '<img src="' + 'value.img' + '" alt="" class="circle">' +
         					 '<span class="title">'+ name+ '</span>'+
          					 '<span class="small material-icons right hiddendiv done">done</span>'+
          					 '<span class="small material-icons right hiddendiv mood yellow-text">mood</span>'+
          					 '</li>';
        	  $('#ulUserList').append(userList);
        	  console.log("undefined... 왜 찍히는 거야??" + userList);
              
              }
          
	
          var messageListUp= function(){

        	  var messageTemplate = '<li id="li' + key  + '" class="collection-item avatar" data-key="' + key + '">'+
  									'<img src="'+ profileImg ? profileImg : + 'img/noprofile.png'+'" alt="" class="circle">'+
  									'<span class="title">'+userName+'</span><span class="time">'+time+'</span>'+
  									'<p>'+message+'</p>'+
  					 				'</li>'; 
          
        	  $('#ulUserList').append(userList);
        	  console.log("undefined... 왜 찍히는 거야??" + userList);
          } 

          
          

          var name = $('#memberName').val();
          console.log("널인가???" + name);
          
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

          var curName = $('#memberName').val();
	      var curEmail = $('#memberEmail').val(); 
	      var curProfilePic = $('#memberProfilePic').val();   
          console.log("널인가???" + curName + " / " + curEmail);


          $(function(){
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

      	})	
          
      </script>
  </body>
</html>


