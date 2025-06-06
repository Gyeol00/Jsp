# Jsp

### ⚙ 개발 환경

JDK: Java Development Kit 17

서버: Apache Tomcat 10.1.x

IDE: Eclipse IDE for Enterprise Java Developers

JSP/Servlet 버전: JSP 3.1 / Servlet 6.0

DBMS: MySQL (또는 실습에 따라 다른 RDBMS)

JDBC 드라이버: MySQL Connector/J

웹 기술: HTML, CSS, JavaScript, AJAX(fetch API)

기타: DBCP(DataBase Connection Pool), JavaBeans, JSON

---

## ch01 – JSP 개발 환경 구축 및 간단한 페이지 연결 실습

  * `hello.jsp`, `welcome.jsp`, `greeting.jsp`
  * HTML 기본 구조 및 링크 연결 테스트

---

## ch02 – JSP 기본 문법 실습

  * **스크립트 요소**: Scriptlet, Expression 사용
  * **조건문**: if, if-else, else-if 문법 활용
  * **반복문**: for, while문 및 구구단 출력
  * **지시자(directive)**

    * page 지시자
    * include 지시자 (`_header.jsp`, `_footer.jsp` 활용)
    * 사용자 정의 클래스(`Account.java`) 사용

---

## ch03 – JSP 내장 객체 실습

JSP에서 제공하는 내장 객체(Implicit Objects)를 중심으로 실습한 예제들을 포함하고 있습니다. 각 내장 객체의 역할과 사용 방법을 실제 HTML 폼, 요청 처리, 페이지 이동 등 다양한 방식으로 실습했습니다.

### 1. request 객체

* `GET`과 `POST` 방식의 데이터 전송 방식 비교 실습
* `getParameter()` 메서드를 활용해 사용자 입력값 수신
* 다양한 입력 필드(텍스트, 라디오, 체크박스, 셀렉트 박스 등)를 통해 클라이언트 데이터 수신
* `request.getHeader()`를 이용한 클라이언트 요청 정보 확인 (User-Agent, referer, cookie 등)

### 2. response 객체

* `response.sendRedirect()`를 이용한 페이지 리다이렉션 실습
* 리소스 요청 및 파일 응답 처리 방식 확인

### 3. pageContext 객체

* `forward()`를 이용한 요청 흐름 제어
* `include()` 메서드와 지시자를 통한 JSP 파일 포함 방식 비교
* 레이아웃 재사용을 위한 header/footer 분리 구성

### 4. application 객체

* 서버 정보 및 환경 설정 값 출력 (`getServerInfo()`, `getInitParameter()`)
* 애플리케이션 컨텍스트 경로 확인 (`getRealPath()`)

### 5. exception 객체

* 예외 발생 상황에 대한 처리 실습
* 404 및 500 오류 페이지 연동 및 테스트

---

## ch04 - JSP 액션 태그 실습

JSP의 주요 액션 태그(`forward`, `include`, `useBean`)를 활용하여 동적인 웹 페이지 구성 방식과 JavaBeans 연동을 실습했습니다. 이를 통해 JSP에서 자바 객체를 제어하고 요청 흐름을 제어하는 방법을 학습했습니다.

### 1. forward 액션태그

* `1.forwardTag.jsp`
* `proc/forward1.jsp`, `proc/forward2.jsp`, `proc/target.jsp`
* `pageContext.forward()` 메서드와 `<jsp:forward>` 액션태그를 이용하여 **요청 흐름을 다른 JSP로 전달하는 방식**을 비교 실습

### 2. include 액션태그

* `2.includeTag.jsp`
* `inc/_header.jsp`, `inc/_footer.jsp` 포함
* `@include` 지시자, `pageContext.include()` 메서드, `<jsp:include>` 태그를 활용하여 **정적 vs 동적 포함 방식**을 실습

### 3. useBean 액션태그

* `3.useBeanTag.jsp`, `proc/userProc.jsp`
* `sub1.User` JavaBean 클래스 사용
* `jsp:useBean`, `jsp:setProperty`를 활용하여 **사용자 입력값을 Java 객체로 자동 매핑**하고, 이를 출력하는 방식 실습

---

## ch05 - JSP 쿠키 & 세션 로그인 실습

JSP(Java Server Pages)를 이용해 쿠키와 세션을 기반으로 한 로그인 기능을 실습했습니다. 웹에서 사용자 인증 상태를 어떻게 관리하는지를 실습하며, 클라이언트와 서버 간의 상태 유지 방식에 대한 개념을 익혔습니다.

### 쿠키 기반 로그인

* 사용자가 로그인 정보를 입력하면, 아이디를 쿠키에 저장해서 **브라우저에 남깁니다**.
* 쿠키는 일정 시간(3분) 동안 유효하며, 유효시간 내에 다시 접속하면 자동으로 로그인 상태를 유지합니다.
* 로그인 성공/실패 여부에 따라 다른 결과 페이지로 이동합니다.
* 로그아웃 시에는 쿠키를 즉시 삭제해 로그인 상태를 해제합니다.

### 세션 기반 로그인

* 사용자가 로그인하면, 사용자 정보를 담은 객체를 **서버의 세션에 저장**합니다.
* 이후 다른 페이지에서 로그인 상태를 확인할 때는, 세션에 저장된 사용자 정보의 존재 여부로 판단합니다.
* 로그아웃 시 세션을 초기화하여 서버 측 로그인 정보를 완전히 제거합니다.

### 주요 구성 요소

* **사용자 정보 객체(User)**: 아이디, 비밀번호, 이름, 나이 등의 필드를 갖는 간단한 Java 클래스
* **로그인 폼 페이지**: 쿠키용, 세션용 각각의 로그인 입력 폼이 존재
* **처리 로직 JSP**: 쿠키/세션 방식에 따라 로그인 인증, 상태 저장 및 페이지 이동을 처리
* **결과 페이지**: 로그인 성공/실패에 따른 결과를 보여주며, 로그아웃 기능도 포함

---

## ch06 - JSP & JDBC 웹 애플리케이션 실습

JSP(JavaServer Pages) 기반으로 데이터베이스와 연동되는 웹 애플리케이션 개발을 실습하였습니다.
기본적인 JDBC 사용법부터 커넥션 풀(DBCP), JSON과 AJAX를 활용한 비동기 통신까지 단계별로 학습하며, 웹과 데이터베이스 간의 데이터 흐름과 연동 방식을 이해합니다.

### 데이터베이스 연동 및 자바빈즈(Entity) 설계
* Customer, Order, Product 같은 실제 비즈니스 도메인을 반영한 Entity 클래스들을 설계
* 각 클래스는 데이터베이스 테이블의 컬럼과 1:1 매핑되는 필드로 구성되어 있으며, getter와 setter 메서드를 통해 캡슐화를 구현
* 주문(Order) 클래스에서는 고객(Customer)과 상품(Product) 정보를 객체 형태로 포함하여 객체 지향적인 연관 관계 표현
* toString() 메서드를 오버라이드해 객체 내용을 쉽게 출력할 수 있도록 구현함으로써 디버깅과 로그 기록에 유용함

### JSP 기반 CRUD(등록, 조회, 수정, 삭제) 기능 구현
* user1, user2 등의 디렉터리 내 JSP 페이지에서 각각 사용자 등록과 목록 조회 기능을 구현
* JSP에서 JDBC API를 직접 사용해 데이터베이스 연결, 쿼리 실행, 결과 처리 과정을 경험
* 데이터 입력 폼과 결과 화면을 구현해 사용자와 서버 간 상호작용의 기본 구조 이해
* 직접 작성한 SQL 문을 JSP 코드에 삽입해 동작 원리 체험 (단, 유지보수 측면에서 코드 분리 필요성 인지)

### 데이터베이스 커넥션 풀 (DBCP) 적용
* 다수의 사용자 요청이 동시에 발생할 때 효율적으로 데이터베이스 커넥션을 재활용하기 위해 DBCP 기술 도입
* JSP에서 커넥션 풀을 설정하고, 기존의 직접 연결 방식과 비교해 성능과 안정성이 어떻게 개선되는지 체험
* DBCP 설정 방법과 활용법 이해, 실제 프로젝트 적용 시 필수적인 기술 습득

### JSON 데이터 생성 및 AJAX 비동기 통신
* JSP를 통해 JSON 형식으로 사용자 데이터(user1.jsp 등)를 반환하는 페이지 제작
* 웹 브라우저의 자바스크립트에서 fetch API를 이용해 JSON 데이터를 비동기적으로 요청하고 화면에 동적으로 출력
* 페이지를 새로 고침하지 않고도 서버와 데이터를 주고받을 수 있는 AJAX 개념 및 활용법 실습
* JSON과 XML의 데이터 포맷 차이점 및 각각의 활용 사례 체험
