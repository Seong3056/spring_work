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

>23-05-15
>>MyBatis를 이용하여 필요한 SQL문을 따로 모아 관리할수 있다.
>>이는 기존 jdbc보다 훨씬 가독성이 좋아지기에 실무에서도 많이 사용되는 툴이기도 하다.
>>>sql문을 모아둔 *mapper.xml을 작성하고 (Interface Mapper.xml은 spring에서 권장하는 선언방식)
>>>servlet-config(MyWeb의 해당파일은 db-config)에 xml의 경로를 지정한다
```
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
	<property name="dataSource" ref="ds" />
	<property name="mapperLocations" value="classpath:/mappers/*Mapper.xml" />			
</bean>
```
>>spring-test를 이용하면 별도의 서버없이도 컴파일 가능 여부를 간단하게 진단이 가능하다
