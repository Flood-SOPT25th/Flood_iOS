# :ocean: Flood

기능설명
---------------
<h3>정보를 공유하는 가장 쉬운 방법

기업에서 어떤 정보들을 공유하는지 알고 싶지 않나요?
플러드는 기업에서 어떤 정보들을 공유하는지 시각화된 자료로 여러분께 보여드립니다.


서비스 work flow
---------------
<img src="/IMG/workflow.png" width= "800">

앱 아이콘
------------
![Floodicon](/IMG/Flood.png)

스크린 샷
------------
<img src="/IMG/splash.png" width="300">
<img src="/IMG/splash2.png" width="300">
 <img src="/IMG/feed.png" width="300">
 <img src="/IMG/feed2.png" width="300"> 
 <img src="/IMG/feed3.png" width="300"> 
 <img src="/IMG/mypage.png" width="300"> 
 <img src="/IMG/mypage2.png" width="300"> 
 <img src="/IMG/postView.png" width="300">
 <img src="/IMG/postSetting.png" width="300">
 <img src="/IMG/postCategory.png" width="300">

개발 환경
------------
1. Swift 버전
> * 5.1.3
2. Xcode 버전
> * 11.3
3. 사용한 라이브러리
> * Alamofire 4.8.2
> * Kingfisher 4.10.1
> * SwiftyGif

> * ~~Tagging~~ 
> * ~~FMPhotoPicker 0.8~~

기능 소개
------------
|  <center>기능</center> |  <center>개발 여부</center> |  <center> 기타 사항 </center> | <center> 담당 </center> |
|:--------:|:--------:|:--------:|:--------:|
|<center> 로그인/회원가입 </center> | <center> x </center> |<center> 2순위 </center>|<center> - </center>|
|<center> 뉴스피드 </center> | <center> ○ </center> |<center> 1순위 </center> |<center> 현지 </center>|
|<center> 뉴스피드 세부 뷰 </center> | <center> △ </center> |<center> 1순위 </center> |<center> 현지 </center>|
|<center> 뉴스피드 카테고리 분류 </center> | <center> △ </center> |<center> 1순위 </center> |<center> 현지 </center>|
|<center> 기업정보 </center> | <center> x </center> |<center> 2순위 </center> |<center> - </center>|
|<center> 게시글 작성 </center> | <center> ○ </center> |<center> 1순위 </center> |<center> 준현 </center>|
|<center> 알림 </center> | <center> x </center> |<center> 3순위 </center> |<center> - </center>|
|<center> 마이페이지 </center> | <center> △ </center> |<center> 2순위 </center> |<center> 준현 </center>|


사용한 Extension
------------
> * CALayer : 각종 view의 세부적인 border 설정
> * CGFloat :
> * UIButton : button border, shadow
> * UIColor : 각종 색 주입, hex로 조절
> * UIImage : image 투명도 조절
> * UIImageView : Kingfisher 사용
> * UITextView : textview의 placeholder추가, textview의 동적인 움직임 
> * UIView : superview에 맞는 autolayout , rounding, border
> * UIViewcontroller : alertcontroller 


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

* **문제2**
 키보드동작 시킬 때 탭바뷰컨트롤러가 함께 있는 경우, 탭바의 높이 만큼 키보드와 텍스트필드 사이에 간격이 생김

```swift
  @objc func keyboardWillShow(_ notificatoin: Notification) {
    let duration = notificatoin.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notificatoin.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    let keyboardSize = (notificatoin.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let height = keyboardSize.height - (self.tabBarController?.tabBar.frame.size.height ?? 0.0)
```

height를 정할때 키보드의 높이에서 탭바의 높이만큼 뺀 후 넘겨주어 해결
 

팀원 소개
------------

* 유현지
> SOPT 25기 iOS 파트원으로  ‘Flood’라는 서비스에 참여하게 되었습니다. 
> 저는 메인파트인 뉴스피드를 맡아 개발하고있으며 일주일 정도 남은 기간동안 더 발전할 수 있도록 열심히 하겠습니다!

* 오준현
> SOPT 25기 iOS YB 이번 앱잼에서 리드 개발자로 참여하고 있습니다!! 
> 이번 앱잼 즐기면서 최대한의 성과를 내기위해서 노력하고 있습니다!!
> 앱잼이후에도 플러드 다같이 오래오래 갔으면 좋겠어요!!!
