# :ocean: Flood
* 기능 설명
> 
<br />

서비스 work flow
---------------

앱 아이콘
------------

스크린 샷
------------

개발 환경
------------
1. Swift 버전
> * 5.1.3
2. Xcode 버전
> * 11.3
3. 사용한 라이브러리
> * Alamofire 4.8.2
> * Kingfisher 4.10.1
> * ~~Tagging~~ 
> * ~~FMPhotoPicker 0.8~~

기능 소개
------------
|  <center>기능</center> |  <center>개발 여부</center> |  <center> 기타 사항 </center> | <center> 담당 </center> |
|:--------:|:--------:|:--------:|:--------:|
|<center> 로그인/회원가입 </center> | <center> - </center> |<center> 2순위 </center>|<center> - </center>|
|<center> 뉴스피드 </center> | <center> 뷰 구현 중 </center> |<center> 1순위 </center> |<center> 현지 </center>|
|<center> 북마크 </center> | <center> - </center> |<center> 2순위 </center> |<center> - </center>|
|<center> 게시글 작성 </center> | <center> 뷰 구현 중 </center> |<center> 1순위 </center> |<center> 준현 </center>|
|<center> 알림 </center> | <center> - </center> |<center> 3순위 </center> |<center> - </center>|
|<center> 마이페이지 </center> | <center> 뷰 구현 중 </center> |<center> 2순위 </center> |<center> 준현 </center>|

문제점과 해결 방법 report
------------
* **문제1**
 url을 서버로 넘겨줄때 http://~~ 로 확인을 해주고 넘겨줘야 한다는 문제가 발생함
 위와 같은 문제로 인해 
 1. share extension을 사용해 바로 url을 넘겨주는 방법
 
 2. 클라이언트 부분에서 url을 체크한 후에 넘겨주는 방법
 
 두가지가 있었다
 1번 해결 방법의 경우에는 따로 target을 만들어주고 2주라는 앱잼 기간 안에 새로운 기능을 습득한 이후 적용을 하기에 부담을 느끼게 되어
 2번 해결 방법으로 넘어가 아래와 같은 정규표현식 코드로 http://~~ 와 https://~~ 인경우 http, https가 없는 경우, url이 아닌경우 3가지로 나누어 분기처리를 해 넘겨주는 방식을 채택 하였다.
 ```swift
    // URL 확인 정규표현식
    func canOpenURLHTTP(string: String?) -> Bool {
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: self.urlTextField.text!)
    }

    func canOpenURL(string: String?) -> Bool {
        let regEx = "((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with: self.urlTextField.text!)
    }
```
 

팀원 소개
------------
* 팀원1 : 오준현<br>
> SOPT 25기 
> TO DO : 소개글 작성

* 팀원2 : 유현지<br>
> SOPT 25기 
> TO DO : 소개글 작성
