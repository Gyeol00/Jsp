<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="../css/style.css"/>
    <script>
    document.addEventListener('DOMContentLoaded', function(){
		console.log('DOMContentLoaded...');
		
		const commentList = document.getElementsByClassName('commentList')[0];
			
			// 댓글 등록
			// onsubmit 클릭할 때 실행
			formComment.onsubmit = function(e){
    			e.preventDefault();
				
				// 입력한 데이터 가져오기
				const parent = formComment.parent.value;
    			const writer = formComment.writer.value;
    			const content = formComment.content.value;
				console.log('parent : ' + parent, 'writer : ' + writer, 'content : ' + content);
				
				// 폼 데이터 생성
				const formData = new FormData();
    			formData.append('parent', parent);
    			formData.append('writer', writer);
    			formData.append('content', content);
    			console.log(formData);
				
				// 서버 전송
				fetch('/jboard/comment/write.do', {
    				method: 'POST',
    				body: formData
    			})
    			.then(response => response.json())
    			.then(data => {
    				console.log(data);
					
					// 동적 태그 생성
					if(date != null) {
						alert('댓글이 등록 되었습니다.');
						
						// 입력 태그 비우기
						// textarea innertext는 빈문자열
						formComment.content.value = '';
						
						// 댓글 목록의 article 생성해야 함
						// `` 템플릿 문자열
						// 자바스크립트와 JSP와의 표현언어는 충돌이 나므로 \ 해야함
						const article = `<article>
					                        <span class='date'>\${data.wdate}</span>
					                        <span class='nick'>\${data.nick}</span>
					                        <p class='content'>\${data.content}</p>
					                        <div>
					                            <a href='#' class='remove'>삭제</a>
					                            <a href='#' class='modify'>수정</a>
					                        </div>
					                     </article>`;
					                     
						commentList.insertAdjacentHTML('beforeend', article);
					}else {
						alert('댓글 등록 실패 했습니다.');
					}
					
				})
				.catch(err => {
					console.log(err);
				});
				
				// return false;
			}
			
		});
    </script>
    
</head>
<body>
    <div id="wrapper">
        <%@ include file="./_header.jsp" %>
        <main id="article">
            <section class="view">
                <nav>
                    <h1>글보기</h1>
                </nav>
                <table border="0">                    
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" value="${requestScope.articleDTO.title}" readonly/></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><input type="text" name="writer" value="${articleDTO.writer}(${articleDTO.nick})" readonly/></td>
                    </tr>
                    <c:if test="${articleDTO.file > 0}">
	                    <tr>
	                        <th>파일</th>
	                        <td>
	                        	<c:forEach var="file" items="${articleDTO.files}">
	                        		<p style="margin-top:6px;"><a href="/jboard/file/download.do?fno=${file.fno}">${file.oName}</a>&nbsp;<span>${file.download}</span>회 다운로드</p>
	                        	</c:forEach>
	                        </td>
	                    </tr>
                    </c:if>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="content" readonly>${articleDTO.content}</textarea>
                        </td>
                    </tr>
                </table>
                
                <div>
                    <a href="#" class="btn btnRemove">삭제</a>
                    <a href="./modify.html" class="btn btnModify">수정</a>
                    <a href="/jboard/article/list.do" class="btn btnList">목록</a>
                </div>

                <!-- 댓글목록 -->
                <section class="commentList">
                    <h3>댓글목록</h3>                   

					<!-- 반복출력 -->
					<c:forEach var="comment" items="${comments}">
	                    <article>
	                        <span class="date">${comment.wdate}</span>
	                        <span class="nick">${comment.nick}</span>	                        
	                        <p class="content">${comment.content}</p>                        
	                        <div>
	                            <a href="#" class="remove">삭제</a>
	                            <a href="#" class="modify">수정</a>
	                        </div>
	                    </article>
                    </c:forEach>

					<c:if test="${empty comments}">
                    	<p class="empty">등록된 댓글이 없습니다.</p>
					</c:if>
                </section>

                <!-- 댓글쓰기 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form name="formComment" action="#">
                    	<input type="hidden" name="parent" value="${articleDTO.no}">
                    	<input type="hidden" name="writer" value="${sessUser.uid}">
                        <textarea name="content" placeholder="댓글 입력"></textarea>
                        <div>
                            <a href="#" class="btn btnCancel">취소</a>
                            <input type="submit" value="작성완료" class="btn btnComplete"/>
                        </div>
                    </form>
                </section>

            </section>
        </main>
        <%@ include file="./_footer.jsp" %>
    </div>    
</body>
</html>