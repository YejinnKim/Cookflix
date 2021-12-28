## 요리레시피 공유 웹 Cookflix

### 1. 개요
#### 1-1. 기획 의도
    한가지 요리의 레시피를 검색할 때, 다양한 조리 방법이 나와 혼란스러웠던 경험이 있다.
    가장 보편적인 1가지 레시피를 제공하고, 회원들이 추가로 나만의 레시피를 공유할 수 있는 웹을 개발하고자 한다.
    
#### 1-2. 벤치 마킹
    메뉴판 닷컴 - 키친 (http://www.menupan.com/cook) : 요리 레시피
    Netfilx (https://www.netflix.com/) : 화면 구성

#### 1-3. 제작 기술
    JSP, Servlet, HTML5, CSS, JavaScript, MySQL
    
### 2. 프로젝트 구현
### 2-1. 기능 구조
#### 2-1-1. 사용자 권한
<table>
  <tr>
    <td>메뉴</td>
    <td>내용</td>
    <td>접근권한</td>
  </tr>
  <tr>
    <td>메인 화면</td>
    <td>회원가입 및 로그인</td>
    <td>비회원, 회원, 관리자</td>
  </tr>
  <tr>
    <td rowspan="2">요리 레시피</td>
    <td>Read</td>
    <td>비회원, 회원, 관리자</td>
  </tr>
  <tr>
    <td>Create, Read, Update, Delete</td>
    <td>관리자</td>
  </tr>
  <tr>
    <td rowspan="2">나만의 레시피, 요리 토크</td>
    <td>Read</td>
    <td>비회원, 회원, 관리자</td>
  </tr>
  <tr>
    <td>Create, Read, Update, Delete</td>
    <td>회원, 관리자</td>
  </tr>
  <tr>
    <td>내가 찜한 레시피</td>
    <td>Create, Read, Delete</td>
    <td>회원, 관리자</td>
  </tr>
  <tr>
    <td>관리자 페이지(회원 관리)</td>
    <td>Read, Update, Delete</td>
    <td>관리자</td>
  </tr>
</table>

#### 2-1-1. 데이터베이스
    User(id, pw, name, email)
    Recipe(no, category, title, content, image, view)
    Myrecipe(no, uname, title, content, image, date, view)
    Talk(no, uname, title, content, image, date, view)
    Cart(no, uid, rid, rtitle, image)  
    

### 2-2. 주요 기능 및 실행 화면
#### 2-2-1. 메인
<img width="42%" src="https://user-images.githubusercontent.com/50562634/147575962-ecaa94ed-7042-400a-87f1-2810a1191c98.jpg"/>  
<img width="40%" src="https://user-images.githubusercontent.com/50562634/147575625-0a2758b1-52c4-4cec-8b6e-7dd2a7c5cf4e.jpg"/>

    - 메인 화면 이미지 슬라이더 효과 추가
    - 레시피 조회수를 기반으로 지금 뜨는 레시피 추천, 클릭 시 해당 레시피로 이동
    
#### 2-2-2. 요리 레시피
<img width="40%" src="https://user-images.githubusercontent.com/50562634/147578234-664d2bc1-fbd5-41f5-88d8-23ea28d83e27.jpg"/> <img width="40%" src="https://user-images.githubusercontent.com/50562634/147578470-479c7292-a254-4e0b-ba72-03fc2cd6ccf1.jpg"/>
    
    - 카테고리 별 레시피 조회 가능, 클릭 시 상세 레시피 조회
    - 검색 가능
    
#### 2-2-3. 내가 찜한 레시피
<img width="40%" src="https://user-images.githubusercontent.com/50562634/147580215-9ebecdb5-26a0-4705-9cbe-e5982922d2db.png"/>

    - 레시피 상세 조회에서 찜 클릭 시 내가 찜한 레시피 목록에서 조회 가능
    
### 3. 발전 방안
    댓글, 리뷰 페이지 등 다양한 기능을 추가한다면 더욱 좋을 것 같다.
    또한 UI/UX 조금 더 깔끔하고 가독성 있게 보완할 필요가 있다. 
   
