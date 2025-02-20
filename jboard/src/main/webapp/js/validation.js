//유효성 검사에 사용할 정규표현식
	const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
	const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	const reName  = /^[가-힣]{2,10}$/ 
	const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
	const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

	document.addEventListener('DOMContentLoaded', function() {
		
		// 유효성 검사에 사용할 상태 변수
		let isUidOk = false;
		let isPassOk = false;
		let isNameOk = false;
		let isNickOk = false;
		let isEmailOk = false;
		let isHpOk = false;
		
		// 1. 아이디 유효성 검사 (중복 체크 포함)
		const btnCheckUid = document.getElementById('btnCheckUid');
		const uidResult = document.getElementsByClassName('uidResult')[0];
		
		btnCheckUid.onclick = function() {

			const value = formRegister.uid.value;
			
			// 아이디 유효성 검사
			// value 값이 아이디 형식에 맞지 않으면
			// 정규표현식 사용
			if(!value.match(reUid)) {
				uidResult.innerText = '아이디 형식에 맞지 않습니다';
				uidResult.style.color = 'red';
				isUidOk = false;
				
				// 처리 종료
				return;
			}
			
			// 아이디 중복 체크
			fetch('/jboard/user/check.do?type=uid&value='+value)
			.then(response => response.json())
			.then(data => {
				console.log(data);
				
				if(data.count > 0) {
					// 이미 사용중인 아이디
					uidResult.innerText = '이미 사용중인 아이디 입니다.';
					uidResult.style.color = 'red';
					isUidOk = false;
				}else {
					// 사용 가능한 아이디
					uidResult.innerText = '사용 가능한 아이디 입니다.';
					uidResult.style.color = 'green';
					isUidOk = true;
				}
				
				
			})
			.catch((err) => {
				console.log(err);
			});
		}
		// 아이디 중복 체크 끝
		
		// 2. 비밀번호 유효성 검사
		const passResult = document.getElementsByClassName('passResult')[0];
		
		// focusout이 실행될 때
		formRegister.pass2.addEventListener('focusout', function() {

			const value1 = formRegister.pass1.value;
			const value2 = formRegister.pass2.value;
			
			// 비밀번호 형식에 맞지 않으면
			if(!value1.match(rePass)) {
				passResult.innerText = '비밀번호는 숫자, 소문자, 대문자, 특수문자 조합 8자리';
				passResult.style.color = 'red';
				isPassOk = false;
				
				// 처리가 다음으로 넘어갈 필요가 없기 때문에 return 한다
				return;
			}
			
			if(value1 === value2) {
				passResult.innerText = '사용 가능한 비밀번호 입니다.';
				passResult.style.color = 'green';
				isPassOk = true;
			}else {
				passResult.innerText = '비밀번호가 일치하지 않습니다.';
				passResult.style.color = 'red';
				isPassOk = false;
			}
		
		});
		
		// 2. 비밀번호 유효성 검사 끝
		
		// 3. 이름 유효성 검사
		const nameResult = document.getElementsByClassName('nameResult')[0];
		
		formRegister.name.addEventListener('focusout', function() {
			
			const value = this.value;
			
			if(!value.match(reName)) {
				nameResult.innerText = '이름이 유효하지 않습니다';
				nameResult.style.color = 'red';
				isNameOk = false;
			}else {
				nameResult.innerText = '';
				isNameOk = true;
			}
			
			
		});
		// 3. 이름 유효성 검사 끝
		
		// 4. 별명 유효성 검사 (중복체크 포함)
		const btnCheckNick = document.getElementById('btnCheckNick');
			const nickResult = document.getElementsByClassName('nickResult')[0];
			
			btnCheckNick.onclick = async function(){
				
				const value = formRegister.nick.value;
				
				if(!value.match(reNick)){
					nickResult.innerText = '유효하지 않은 별명 입니다.';
					nickResult.style.color = 'red';
					isNickOk = false;
					return;
				}
				
				try {
					const response = await fetch('/jboard/user/check.do?type=nick&value='+value);
					const data = await response.json();
					console.log(data);
					
					if(data.count > 0){
						nickResult.innerText = '이미 사용중인 별명 입니다.';
						nickResult.style.color = 'red';
						isNickOk = false;
					}else{
						nickResult.innerText = '사용 가능한 별명 입니다.';
						nickResult.style.color = 'green';
						isNickOk = true;
					}
				}catch(err){
					console.log(err);
				}
			};
		// 4. 별명 유효성 검사 끝
		
		// 5. 이메일 유효성 검사 (중복/인증처리 포함)
		const btnSendEmail = document.getElementById('btnSendEmail');
		const emailResult = document.querySelector('.emailResult');
		const auth = document.querySelector('.auth');
		let preventDoubleClick = false;
		
		btnSendEmail.onclick = async function(){
			
			const value = formRegister.email.value;
			
			// 이중 클릭 방지
			if(preventDoubleClick) {
				// 처음 한번만 ok 다음으로 진행되지 않음
				return;
			}
			
			// 이메일은 입력 타입이 email로 지정되어 있기 때문에 정규표현식 굳이 사용하지 않아도 됨
			if(!value.match(reEmail)) {
				emailResult.innerText = '이메일이 유효하지 않습니다.';
				emailResult.style.color = 'red';
				isEmailOk = false;
				return;
			}
			
			preventDoubleClick = true;
			const response = await fetch('/jboard/user/check.do?type=email&value='+value);
			const data = await response.json();
			
			if(data.count > 0){
				emailResult.innerText = '이미 사용중인 이메일 입니다.';
				emailResult.style.color = 'red';
				isEmailOk = false;
			}else {
				// 인증번호 입력 필드 출력 (auth 클래스)
				// div 기본 형식은 블럭이라 block
				auth.style.display = 'block';
			}
		}
		
			const btnAuthEmail = document.getElementById('btnAuthEmail');
		
			btnAuthEmail.onclick = async function(){
			
			const value = formRegister.auth.value;
			// const jsonData = {"authCode":value};
			
			// 폼 데이터 생성
			const formData = new URLSearchParams();
			formData.append("authCode", value);
			
			// 서버 전송
				// 인증번호는 기밀성이 필요함 파라미터로 보내기 X
				// 아래 코드는 fetch 함수에서 post로 보내기
				// 클라이언트에서 서버로 JSON 데이터 보내줌
				// 체크컨트롤러 dopost 로 수신 처리
			const response = await fetch('/jboard/user/check.do', {
				method: 'POST',
				headers: {'Content-Type': 'application/x-www-form-urlencoded'},
				body: formData
			});

			const data = await response.json();
			console.log(data);
			
			if(data.result > 0){
			emailResult.innerText = '이메일이 인증 되었습니다.';
			emailResult.style.color = 'green';
			isEmailOk = true;
			}else{
			emailResult.innerText = '유효한 인증코드가 아닙니다.';
			emailResult.style.color = 'red';
			isEmailOk = false;
			}
		}
		// 이메일 인증 처리 끝
		// 5. 이메일 유효성 검사 (중복/인증처리 포함) 끝
		
		// 6. 휴대폰 유효성 검사 (중복체크 포함)
		// 펑션 문구 안에 있는 것과 밖에 있는 것은 생성 시기가 좀 다르다
		// 포커스 아웃이 실행되고 실행되는 것보다 그 전에 실행되는 것이 낫다
		const hpResult = document.getElementsByClassName('hpResult')[0];
		
		formRegister.hp.addEventListener('focusout', async function() {
			
			// 현재 핸들러 안의 this는 hp
			const value = this.value;
			
			if(!value.match(reHp)) {
				hpResult.innerText = '휴대폰번호가 유효하지 않습니다.(-포함)';
				hpResult.style.color = 'red';
				isHpOk = false;
				return;
			}
			
			// 휴대폰 중복 체크 (0 또는 1로 중복체크를 설정해둠)
			// 이유? unique값이기 때문에 중복값이 들어가면 에러가 나기때문
			const response = await fetch('/jboard/user/check.do?type=hp&value='+value);
			const data = response.json();
			
			// tada는 json 객체 {"count : 1"}
			if(data.count > 0) {
				hpResult.innerText = '이미 사용중인 휴대폰 번호입니다.';
				hpResult.style.color = 'red';
				isHpOk = false;
			}else {
				hpResult.innerText = '사용 가능한 휴대폰 번호입니다.';
				hpResult.style.color = 'green';
				isHpOk = true;
			}
			
			
		});
		// 6. 휴대폰 유효성 검사 끝
		
		// 최종 폼 전송 이벤트
		// 최종 유효성 검사
		// 회원가입 버튼을 누르면 전송이 됨
		formRegister.onsubmit = function(e) {
			// 아래 코드는 폼 전송이 취소됨 즉, 회원가입 화면 이후로 넘어가지 않음
			// e.preventDefault();

			// 1. 아이디 유효성 검사	
			// 아이디 유효성 검사가 실패했을 때
			if(!isUidOk) {
				// 폼 전송 취소
				return false;
			}

			
			// 2. 비밀번호 유효성 검사 결과	
			// 비밀번호 유효성 검사가 실패했을 때
			if(!isPassOk) {
				return false;
			}
			
			
			// 3. 이름 유효성 검사 결과
			// 이름 유효성 검사가 실패했을 때
			if(!isNameOk) {
				return false;
			}
			
			
			// 4. 별명 유효성 검사 결과	
			// 별명 유효성 검사가 실패했을 때
			if(!isNickOk) {
				return false;
			}
			
			
			// 5. 이메일 유효성 검사 결과
			// 이메일 유효성 검사가 실패했을 때
			if(!isEmailOk) {
				return false;
			}
			
			
			// 6. 휴대폰 유효성 검사 결과
			// 휴대폰 유효성 검사가 실패했을 때
			if(!isHpOk) {
				return false;
			}
			
			
			// 폼 전송 시작, false로 설정 시 폼 전송 안됨
			return true;
			
		}
		// 최종 폼 전송 이벤트 끝
		
		
		
	});