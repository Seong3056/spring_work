# spring_work
spring 3.0 수업내용입니다.

<hr>
초기세팅 lombok파일은 sts-bundle\sts-3.9.18.RELEASE 경로에 넣으면 된다.
MySQL버전은 8.0.33
<hr>

>23-05-11
>>RequestMapping, GetMapping, PostMapping
>>ResponseMapping, Model, ModelAttribute, ModelAndView, Redirect

>23-05-12
>>ScoreVO를 통하여 학생의 학번, 이름, 과목점수, 총 점수, 평균점수를 DB에 입력하고
>>html에서 테이블조회, 특정학번의 정보조회, 삭제 등을 구현하였다.
>>>
>>>Interface를 통한 class 객체생성은 spring에서 권장하는 사항이다.
>>>@(Annotation)을 통해 각각 역할을 바로 부여할수 있다.
>>>@Controller, @Service, @Repository ...
***
>23-05-15
>>MyBatis를 이용하여 필요한 SQL문을 따로 모아 관리할수 있다.
>>이는 기존 jdbc보다 훨씬 가독성이 좋아지기에 실무에서도 많이 사용되는 툴이기도 하다.
>>>sql문을 모아둔 *mapper.xml을 작성하고 (Interface Mapper.xml은 spring에서 권장하는 선언방식)
>>>servlet-context(MyWeb의 해당파일은 db-config)에 xml의 경로를 지정한다
```
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
	<property name="dataSource" ref="ds" />
	<property name="mapperLocations" value="classpath:/mappers/*Mapper.xml" />			
</bean>
<!-- src/main/resources의 지정 경로는 classpath 약어로 사용이 된다. -->
```

>>spring-test를 이용하면 별도의 서버없이도 컴파일 가능 여부를 간단하게 진단이 가능하다.
++	404에러의 원인은 대부분(현재까진) 
	root-context, servlet-context에서 경로지정의 오타인 경우, 생성되지않은 데이터베이스를 지정한 경우
	404에러는 페이지를 로딩할 수 없을때, 탐색이 안될 때 뜨는 에러다.
***
>23-05-16
>>05-15에 이은 css,js를 이용하여 홈페이지 구현까지 하였다.
>>게시글 등록, 수정, 삭제등 사용자 -> 서버 접근하는 방식 => POST
>>게시글 등록페이지, 수정페이지, 게시글 목록 등 페이지 즉 서버 -> 사용자 접근하는 방식 => GET
>>>게시글 삭제의 경우 delete 할때 get 방식을 이용할 경우 경로창에서 직접 입력하여 삭제 접근이 가능하다
>>>그런 경우에 대비하여 post 방식 요청을 권장한다.
```
@GetMapping("/content/{bno}")
	public String getContent(@PathVariable("bno") int bno, Model model) {
		model.addAttribute("article", service.getContent(bno));
		return "freeboard/freeDetail";
	}
	<!-- GetMapping에서 파라미터값을 { ... }안에 넣고 객체의 매개변수에서 《 @PathVariable("...") int ... 》
		 같은 방식으로 uri에서 넘어온 정보를 받을수 있다. -->
```
>>글 수정페이지 내 글 수정 및 삭제와 같이 form 내 submit을 수행할 버튼이 2개이상이라면
>>js를 이용하여 버튼에 맞는 속성을 form 속성에 변경하여 submit을 수행할 수 있다.
***
>>23-05-17
>>페이지 알고리즘 구현
>>해당 페이지에 정보를 넘길때 파라미터값을 이용하여 여러 정보를 넘길수 있다.
>>반대로 다시 돌아올때 html문에서 value 값을 파라미터값으로 설정하여 동적 웹페이지로 구현이 가능하다.
>>특정 페이지안에서 submit이 2번이상 진행해야하는 경우 <br> js를 활용하여 action의 속성값을 변경한 뒤 submit을 진행하면 원하는 submit을 수행하게 할 수 있다.
***
>>23-05-18
>>MyBatis로 DB연동을 진행할 때 파라미터 값이 2개이상일 때 그냥 보내면 지목에러가 발생한다
	 
	 **해결방안**
	 1. @Param을 이용하여 이름을 붙여주는 방법 (xml 파일에서 해당 값을 지목할 수 있게 이름붙이기)
	 2. Map으로 포장해서 보내는 방법
	 3. 클래스를 디자인해서 객체 하나만으로 매개값으로 보내는 방법 (VO)
	 
		중 하나를 상황에 맞게 적절히 선택하면 된다. ||1||
>>> Controller <-> Service <-> Mapper
>>다른 경로(페이지)로 넘어가는 것을 동기식 요청이라하며
>>현재 경로에 머무르면서 요청을 보내는것을 비동기식 요청이라 한다.
>>XMLHttpRequest, fetch API를 통해 비동기식 요청을 보낼 수 있다.
>>Controller에서 @Responsebody를 통하여 사용자의 요청에 대한 응답을 현재 페이지에서 다시 받을 수 있게 된다. <br><br>
>>자바에서 smtp를 이용한 이메일 전송을 자동으로 보낼 수 있게 할수 있도록 세팅을 했으며
>>web.xml <-> *-config.xml <-> *.properties 위와 같은 경로로 지정하게 된다.

***
>>23-05-19
>>회원가입페이지 로직 생성
>>>1. 아이디 정규표현식 검증로직, 중복체크
>>>2. 비밀번호 확인 검사
>>>3. 이메일로 통한 인증코드 전송
>>>4. 카카오 맵 api를 이용한 주소찾기
>>>5. 아이디 및 비밀번호 공란 체크 
>>>6. 사용자 아이디 암호화 및 로그인시 암호화된 비밀번호와 대조
>>>7. 로그인되지 않은 상태에서 게시글 접속 및 글쓰기 클릭시 로그인페이지로 이동