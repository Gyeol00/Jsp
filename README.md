# Jsp

### ⚙ 개발 환경
(★ 표시는 코드에 직접 import 되거나 build-path에 올려두고 쓴 것들)

| 구분            | 세부 항목                                          | 비고                                          |
| ------------- | ---------------------------------------------- | ------------------------------------------- |
| **JDK**       | OpenJDK 17 / Oracle JDK 17                     | -source 17, -target 17                      |
| **서버**        | Apache Tomcat 10.1.x                           | Servlet 6.0 / JSP 3.1 구현체                   |
| **IDE**       | Eclipse IDE for Enterprise Java Developers     | 2023-xx 버전                                  |
| **DBMS**      | MySQL 8.x ★                                    | `studydb`, `shop` 스키마 실습                    |
| **JDBC 드라이버** | MySQL Connector/J 8.x ★                        | `/WEB-INF/lib` 또는 Tomcat `lib` 폴더           |
| **커넥션풀**      | DBCP (톰캣 기본 ★)                                 | `java:comp/env/jdbc/studydb`, `jdbc/shop`   |
| **뷰 템플릿**     | JSP 3.1 + EL + JSTL 3.0 ★                      | `jakarta.servlet.jsp.jstl-api`, `jstl-impl` |
| **프런트엔드**     | HTML5, CSS3, JS (ES6), Fetch API               | 정적 리소스 및 AJAX                               |
| **로그**        | SLF4J 2.x + Logback 1.4.x ★                    | `logback.xml`로 레벨·패턴 지정                     |
| **파일 업로드**    | Jakarta Servlet multipart API (Servlet 6.0 내장) | 이전 commons-fileupload 없이 구현                 |
| **이메일 발송**    | Jakarta Mail ★ (javax.mail → jakarta.mail)     | SMTP 실습                                     |
| **JSON 처리**   | org.json / 기본 `javax.json` 대신 수동 문자열           | 작은 실습이라 외부 파서 최소화                           |
| **빌드/의존성**    | Eclipse Classpath 수동 추가 (Maven / Gradle X)     | 학습 목적이므로 pom 미사용                            |
| **테스트 클라이언트** | 브라우저(Chrome), REST Client 플러그인                 | 쿠키·세션/JSON 확인                               |
| **버전 관리**     | Git / GitHub                                   | 실습 코드 push·commit                           |

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

---
  
## ch07 - JSP 파일 업로드 · 다운로드 · 이메일 전송 실습

JSP(Java Server Pages)를 이용하여 웹 애플리케이션에서 **파일 업로드**, **파일 다운로드**, **이메일 전송** 기능을 구현해보는 실습입니다.

### 파일 업로드
사용자가 업로드한 파일을 서버에 저장하고, 제목·작성자 정보와 함께 데이터베이스에 기록하는 기능

### 파일 다운로드
업로드된 파일 목록을 웹 페이지에 출력하고, 각 파일에 대해 다운로드 및 삭제 기능 제공

### 이메일 전송 
입력한 송신자, 수신자, 제목, 내용을 바탕으로 SMTP를 이용해 이메일을 전송하는 기능

---

## ch08 - JSP 표현언어(EL) & JSTL 실습

JSP(Expression Language)와 JSTL(Java Standard Tag Library)을 활용한 **웹 표현 기술 학습**을 목적으로 구성된 실습입니다.

### 표현언어 (EL: Expression Language)

📌 주요 개념
* JSP에서 자바 코드를 최소화하고 표현을 단순화하기 위한 문법
* ${} 구문을 사용하여 객체의 값을 출력함
* 스코프 객체(page, request, session, application)에 저장된 데이터를 접근 가능

📌 실습 내용 요약
* pageContext, request, session, application에 데이터를 저장 후 EL로 출력
* 표현식(<%= %>)과 EL의 차이점 비교
* EL 연산자 실습 (+, ==, !=, eq, lt, empty 등)

### JSTL (Java Standard Tag Library)

📌 주요 태그
* <c:set> : 변수 선언
* <c:if> : 조건문
* <c:choose>, <c:when>, <c:otherwise> : 다중 조건문
* <c:forEach> : 반복문
* f:length, f:substring, f:replace : 문자열 함수

📌 실습 내용 요약
* 자바 스크립트릿(Scriptlet)과 JSTL의 비교
* 조건문/반복문/문자열 함수 등 JSTL 문법 학습
* JSTL을 활용한 깔끔한 JSP 구현

## ch09 - Java Web - Servlet, Filter, Listener 실습

Java Servlet 기반의 웹 어플리케이션 실습 예제로, Servlet, Filter, Listener의 개념과 활용법을 학습하기 위한 실습입니다.

### 📌 주요 기능 요약
#### Servlet
/hello.do, /welcome.do, /greeting.do 서블릿 구현

각각 HTML 응답을 반환하며 로그 출력 포함

HelloServlet은 init()과 destroy()를 통해 서블릿 생명주기 학습

#### Filter
FilterA: 단순 로그 출력

FilterB: 요청 인코딩 처리 (UTF-8)

FilterC: 특정 URL(/welcome.do, /greeting.do)에만 필터링 적용

필터 체인(FilterChain)을 이용한 연속 처리 확인 가능

#### Listener
MyContextListener: 웹 어플리케이션 시작/종료 감지

SessionListener: 로그인 세션 수 증가/감소 감지

세션 속성 추가/제거를 통한 사용자 수 추적

#### JSP (View)
1.Servlet.jsp: 서블릿 기본 테스트

2.Filter.jsp: 필터 작동 확인용 링크 제공

3.Listener.jsp: 로그인/로그아웃 기능을 통해 세션 리스너 작동 확인

## ch10 - Java MVC 아키텍처 실습

Java Servlet 기반의 MVC 아키텍처를 실습하기 위한 간단한 웹 애플리케이션입니다.
사용자 CRUD 기능을 구현하여, MVC 패턴이 어떻게 동작하는지 이해하고 실습했습니다.

### 📌 주요 기능
* 사용자(User1) 목록 조회
* 사용자 등록
* 사용자 수정
* 사용자 삭제

### 📌 실습 내용 요약
* 컨트롤러는 사용자 요청을 받아 알맞은 서비스 메서드를 호출하고, 데이터를 JSP 뷰에 전달합니다.
* 서비스는 DAO를 호출하여 비즈니스 로직을 처리합니다.
* DAO는 SQL 쿼리를 사용하여 DB와 직접 통신합니다.
* DTO는 데이터 전달 객체로, 데이터베이스에서 가져온 데이터를 자바 객체 형태로 캡슐화합니다.
* DBHelper 클래스는 JNDI를 통해 커넥션 풀에서 DB 연결을 관리하며, 자원 해제를 지원합니다.

### 📌 주요 SQL 쿼리
* 사용자 등록: INSERT INTO user1 VALUES (?, ?, ?, ?)
* 사용자 조회: SELECT * FROM user1 WHERE uid = ?
* 사용자 목록 조회: SELECT * FROM user1
* 사용자 수정: UPDATE user1 SET name=?, hp=?, age=? WHERE uid=?
* 사용자 삭제: DELETE FROM user1 WHERE uid=?

## ch11 - JSP/Servlet 기반의 웹 애플리케이션

JSP/Servlet 기반의 웹 애플리케이션에서 "고객 등록 및 목록 조회 기능"을 구현한 실습 예제입니다.
