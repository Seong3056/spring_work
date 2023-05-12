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