//
//  NewsSharePostDetailView.swift
//  Flood
//
//  Created by hjyoo on 2019/12/27.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class NewsSharePostDetailView : UIViewController {
    
    // MARK: - UI components

    @IBOutlet weak var newssharepostTV: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Variables and Properties
    let contentType = [0, 1]
    var PostDetaildataset : PostDetail!
    var PostDetailList : [pidArr2] = []
    var comments: [Comment] = []
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSampleData()
        setupGestureRecognizer()
        
        commentBtn.addTarget(self, action: #selector(generateCommenting), for: .touchUpInside)
        
        newssharepostTV.delegate = self
        newssharepostTV.dataSource = self
        
        navigationController?.isNavigationBarHidden = false

        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icLeftArrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icLeftArrow")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        commentTextField.layer.cornerRadius = 19
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.borderColor = UIColor.veryLightPinkTwo.cgColor

    }
    
    // MARK: -Helpers
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      unregisterForKeyboardNotifications()
    }
    
}

// MARK: - UITableViewDelegate
extension NewsSharePostDetailView: UITableViewDelegate {
    //이 부분 대충은 알고는 있을텐데
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      //let postdetail = PostDetailList[indexPath.row]
      let comment = comments[indexPath.row]
      
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                /*
                let approximateWidthOfText = view.frame.width - 33 - 33
                  
                  let size = CGSize(width: approximateWidthOfText, height: 1000)
                  let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
                let estimatedFrame = NSString(string: postdetail.postContent).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
                  
                  // 이제 이건 순수 레이블의 height 값에다가 위아래 마진 값 16을 더했고
                  // 여분으로 4포인트 정도를 더 줘서 텍스트가 레이블안에서 안짤리도록 한 것!
                  // 저 총합의 값들이 한 셀의 높이가 되는겁니당
                  return estimatedFrame.height + 60 + 4
                 */
                return 762
            }
            else {
                  //이 appro어쩌구 값이 label의 width 최대 값이라고 생각하면되는데
                  //왼쪽 오른쪽 마진이 나의 메세지이든 상대방 메세지이든 스토리보드에 보면 16하고 32로 설정되어있어. 그래서 아래 값을 저렇게 해준거임.
                let approximateWidthOfText = view.frame.width - 37 - 69
                  
                  let size = CGSize(width: approximateWidthOfText, height: 1000)
                  let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
                  let estimatedFrame = NSString(string: comment.message).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
                  
                  // 이제 이건 순수 레이블의 height 값에다가 위아래 마진 값 16을 더했고
                  // 여분으로 4포인트 정도를 더 줘서 텍스트가 레이블안에서 안짤리도록 한 것!
                  // 저 총합의 값들이 한 셀의 높이가 되는겁니당
                  return estimatedFrame.height + 108 + 4
                //98
                }
            }
            return 0
        }

}
// MARK: - UITableViewDataSource
extension NewsSharePostDetailView: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return comments.count
    }
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
        if indexPath.row == 0 {
            return 546
        }
        else {
            return 125
        }
        }
        
        return 0
    }
    */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let picturePostCell = newssharepostTV.dequeueReusableCell(withIdentifier: "PicturePostCell", for: indexPath) as! PicturePostCell
                
                /*
                if contentType[indexPath.row] == 0 {
                  NewsSharePostCell.newsshareView.isHidden = false
                  NewsSharePostCell.picturepostView.isHidden = true
                } else {
                  NewsSharePostCell.newsshareView.isHidden = true
                  NewsSharePostCell.picturepostView.isHidden = false
                }
                */
                picturePostCell.picturepostCatagory.text = "카테고리"
                picturePostCell.picturepostCatagory.font = UIFont.systemFont(ofSize: CGFloat(12))
                picturePostCell.picturepostCatagory.textColor = .electricBlue
                picturePostCell.picturepostCatagoryView.layer.borderWidth = 1
                picturePostCell.picturepostCatagoryView.layer.borderColor = UIColor.electricBlue.cgColor
                picturePostCell.picturepostCatagoryView.setRounded(radius: 11)
                picturePostCell.picturepostprofileImg.image = UIImage(named: "14")
                picturePostCell.picturepostprofileImg.layer.cornerRadius = 10
                picturePostCell.picturepostName.text = "이름"
                picturePostCell.picturepostName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                picturePostCell.picturepostTime.text = "시간"
                picturePostCell.picturepostTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                picturePostCell.picturepostTime.textColor = .veryLightPink
                picturePostCell.picturepostPost.text = "게시글"
                picturePostCell.newsPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                //NewsSharePostCell.newsshareMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
                picturePostCell.picture1.image = UIImage(named: "26")
                picturePostCell.picture2.image = UIImage(named: "26")
                picturePostCell.picture3.image = UIImage(named: "26")
                picturePostCell.picture1.layer.cornerRadius = 10
                picturePostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                picturePostCell.picture2.layer.cornerRadius = 10
                picturePostCell.picture2.layer.maskedCorners = [.layerMaxXMinYCorner]
                picturePostCell.picture3.layer.cornerRadius = 10
                picturePostCell.picture3.layer.maskedCorners = [.layerMaxXMaxYCorner]
                picturePostCell.newsTitle.text = "제목"
                picturePostCell.newsPost.text = "뉴스글"
                //picturePostCell.newsImg.image = UIImage(named: "26")
                //picturePostCell.newsImg.layer.cornerRadius = 10
                picturePostCell.picturefilpCount.text = "플립수"
                picturePostCell.picturefilpCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                picturePostCell.picturefilpCount.textColor = .veryLightPink
                //NewsSharePostCell.newsshareBookmark.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
                picturePostCell.newsshareView.setBorder(borderColor: .veryLightPink, borderWidth: 1)
                picturePostCell.newsshareView.setRounded(radius: 10)
                
                /*
                 // 게시글과 게시사진 유무
                     if pidpost.postContent == "" && pidpost.postImages == []    {
                         picturepostCell.postpostView.isHidden = true
                         picturepostCell.picturepostView.isHidden = true
                         //picturepostCell.newsshareView.isHidden = false
                     }
                     else if pidpost.postContent != "" && pidpost.postImages == []   {
                         picturepostCell.postpostView.isHidden = false
                         picturepostCell.picturepostView.isHidden = true
                         //picturepostCell.newsshareView.isHidden = false
                     }
                     else if pidpost.postContent == "" && pidpost.postImages != []  {
                         picturepostCell.postpostView.isHidden = true
                         picturepostCell.picturepostView.isHidden = false
                         //picturepostCell.newsshareView.isHidden = false
                     }
                     else {
                         picturepostCell.postpostView.isHidden = false
                         picturepostCell.picturepostView.isHidden = false
                         //picturepostCell.newsshareView.isHidden = false
                     }
                     
                     // url에 따른 뉴스기사 유무
                     if pidpost.url == "" {
                         if pidpost.postTitle == "" {
                             picturepostCell.newtitleView.isHidden = true
                             if pidpost.description == "" {
                                 picturepostCell.newsshareView.isHidden = true
                                 if pidpost.image == "" {
                                     picturepostCell.newsImg?.isHidden = true
                                 }
                                 else{
                                     picturepostCell.newsImg.isHidden = false
                                 }
                             }
                             else {
                                 picturepostCell.newsshareView.isHidden = false
                                 if pidpost.image == "" {
                                     picturepostCell.newsImg.isHidden = true
                                 }
                                 else{
                                     picturepostCell.newsImg.isHidden = false
                                 }
                             }
                         }
                         else {
                             picturepostCell.newtitleView.isHidden = true
                             if pidpost.description == "" {
                                 picturepostCell.newsshareView.isHidden = true
                                 if pidpost.image == "" {
                                     picturepostCell.newsImg.isHidden = true
                                 }
                                 else{
                                     picturepostCell.newsImg.isHidden = false
                                 }
                             }
                             else {
                                 picturepostCell.newsshareView.isHidden = false
                                 if pidpost.image == "" {
                                     picturepostCell.newsImg.isHidden = true
                                 }
                                 else{
                                     picturepostCell.newsImg.isHidden = false
                                 }
                             }
                         }
                     }
                     else {
                         picturepostCell.newsshareView.isHidden = true
                     }
                     
                     
                     if pidpost.postContent == "" && pidpost.postImages == []    {
                         picturepostCell.postpostView.isHidden = true
                         picturepostCell.picturepostView.isHidden = true
                         //picturepostCell.newsshareView.isHidden = false
                     }
                     else if pidpost.postContent != "" && pidpost.postImages == []   {
                         picturepostCell.postpostView.isHidden = false
                         picturepostCell.picturepostView.isHidden = true
                         //picturepostCell.newsshareView.isHidden = false
                     }
                     else if pidpost.postContent == "" && pidpost.postImages != []  {
                         picturepostCell.postpostView.isHidden = true
                         picturepostCell.picturepostView.isHidden = false
                         //picturepostCell.newsshareView.isHidden = false
                     }
                         // 둘 다 있을 때
                     else {
                         picturepostCell.postpostView.isHidden = false
                         picturepostCell.picturepostView.isHidden = false
                         //picturepostCell.newsshareView.isHidden = false
                     }
                     
                     picturepostCell.picturepostCatagory?.text = pidpost.category
                     picturepostCell.picturepostCatagory?.font = UIFont.systemFont(ofSize: CGFloat(12))
                     picturepostCell.picturepostCatagory?.textColor = .electricBlue
                     picturepostCell.picturepostCatagoryView?.layer.borderWidth = 1
                     picturepostCell.picturepostCatagoryView?.layer.borderColor = UIColor.electricBlue.cgColor
                     picturepostCell.picturepostCatagoryView?.setRounded(radius: 11)
                     picturepostCell.picturepostprofileImg?.imageFromUrl(pidpost.profileImage, defaultImgPath : "http:// ~~ ")
                     picturepostCell.picturepostprofileImg?.layer.cornerRadius = 10
                     picturepostCell.picturepostName?.text = pidpost.writer
                     picturepostCell.picturepostName?.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                     picturepostCell.picturepostTime?.text = pidpost.postDate
                     picturepostCell.picturepostTime?.font = UIFont.systemFont(ofSize: CGFloat(12))
                     picturepostCell.picturepostTime?.textColor = .veryLightPink
                     picturepostCell.picturepostPost?.text = pidpost.postContent
                     picturepostCell.picturepostPost?.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                     picturepostCell.picturepostMore?.setImage(UIImage(named: "icMoreGray"), for: .normal)
                     
                     
                     //사진분기처리?
                     if pidpost.postImages.count == 0 {
                         picturepostCell.picturepostView.isHidden = true
                     } else if pidpost.postImages.count == 1 {
                         picturepostCell.picture1.imageFromUrl(pidpost.postImages[0], defaultImgPath : "http:// ~~ ")
                         picturepostCell.pictureStackview.isHidden = true
                         picturepostCell.picture1.layer.cornerRadius = 10
                         picturepostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                     }
                     else if pidpost.postImages.count == 2 {
                         picturepostCell.picture1.imageFromUrl(pidpost.postImages[0], defaultImgPath : "http:// ~~ ")
                         picturepostCell.picture2.imageFromUrl(pidpost.postImages[1], defaultImgPath : "http:// ~~ ")
                         picturepostCell.pictureStackview.isHidden = false
                         picturepostCell.picture3.isHidden = true
                         picturepostCell.pictureStackviewWidth.constant = 127.5
                         picturepostCell.picture1.layer.cornerRadius = 10
                         picturepostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                         picturepostCell.picture2.layer.cornerRadius = 10
                         picturepostCell.picture2.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
                     }
                     else {
                         picturepostCell.picture1.imageFromUrl(pidpost.postImages[0], defaultImgPath : "http:// ~~ ")
                         picturepostCell.picture2.imageFromUrl(pidpost.postImages[1], defaultImgPath : "http:// ~~ ")
                         picturepostCell.picture3.imageFromUrl(pidpost.postImages[2], defaultImgPath : "http:// ~~ ")
                         picturepostCell.pictureStackview.isHidden  = false
                         picturepostCell.picture3.isHidden = false
                         picturepostCell.pictureStackviewWidth.constant = 107
                         picturepostCell.picture1.layer.cornerRadius = 10
                         picturepostCell.picture1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                         picturepostCell.picture2.layer.cornerRadius = 10
                         picturepostCell.picture2.layer.maskedCorners = [.layerMaxXMinYCorner]
                         picturepostCell.picture3.layer.cornerRadius = 10
                         picturepostCell.picture3.layer.maskedCorners = [.layerMaxXMaxYCorner]
                     }
                     
                     picturepostCell.newsTitle?.text = pidpost.postTitle
                     picturepostCell.newsPost?.text = pidpost.description
                     picturepostCell.newsImg?.imageFromUrl(pidpost.image, defaultImgPath : "http:// ~~ ")
                     picturepostCell.newsImg?.layer.cornerRadius = 10
                     picturepostCell.picturefilpCount?.text = "Flips \((pidpost.bookmark)) Comments \((pidpost.commentsCount))"
                     picturepostCell.picturefilpCount?.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                     picturepostCell.picturefilpCount?.textColor = .veryLightPink
                     picturepostCell.picturepostBookmark?.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
                     picturepostCell.newsshareView?.setBorder(borderColor: .veryLightPink, borderWidth: 1)
                     picturepostCell.newsshareView?.setRounded(radius: 10)
                     
    
                 
                 */
        
                return picturePostCell
            }
            else {
                //let comments = comments[indexPath.row]
                let CommentCell = newssharepostTV.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
                return CommentCell
            }
        }
    
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        func tableView(_ tableView: UITableView, didSelectRowAt
            indexPath: IndexPath) {
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                   print("select cell")
                    if let url = URL(string: "https://www.google.com") {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            }
        }
    }
    

}

// MARK: - NewsSharePostDetailView

extension NewsSharePostDetailView  {
  
  //탭 제스쳐도 알고있을거고...
  private func setupGestureRecognizer() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
    view.addGestureRecognizer(tap)
  }
  
  @objc func handleTap(_ gesture: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  
  // 키보드 등록하고 해지하는거 당연히 알테고...
  private func registerForKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  private func unregisterForKeyboardNotifications() {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShow(_ notificatoin: Notification) {
    let duration = notificatoin.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notificatoin.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    let keyboardSize = (notificatoin.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let height = keyboardSize.height - (self.tabBarController?.tabBar.frame.size.height ?? 0.0)
    
    
    //하단 채팅 보내는 뷰의 bottom Constraint이야!
    //위에서 계산한 높이값만큼 contant값을 넣어 주는 것.. 이건 당연 알겠지
    self.commentViewBottomConstraint.constant = height
    
    //이건 이제 키보드가 올라오면 테이블뷰의 안의 콘텐트 인셋을 위에서 계산된 height값으로 줘버리는거야
    //그럼 키보드가 올라올때 그만큼 인셋이 생겨서 슝하고 올라감
    //물론 scrollToRow로 제일 아래로 테이블뷰 위치 옮기는거 같이 써서ㅋ
    self.newssharepostTV.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
    self.newssharepostTV.scrollToRow(at: IndexPath(item: comments.count - 1, section: 0), at: .bottom, animated: false)
    
    // animate되는 값이 아닌데 animate하려면 위에서 값 세팅하고 아래처럼 하라고 하더라고zz (feat. stackoverflow)
    self.view.setNeedsLayout()
    UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
      self.view.layoutIfNeeded()
    })
  }
  
  @objc func keyboardWillHide(_ notificatoin: Notification) {
    
    let duration = notificatoin.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
    let curve = notificatoin.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
    
    //내려갈땐 원래 값으로 다시ㅋ
    self.commentViewBottomConstraint.constant = 0
    self.newssharepostTV.contentInset = .zero
    self.view.setNeedsLayout()
    UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
      self.view.layoutIfNeeded()
    })
  }
}

extension NewsSharePostDetailView {
  
  //전송 버튼 누르면 실행됨
  @objc func generateCommenting() {
    
    //텍스트 필드 비었으면 리턴
    guard commentTextField.text != "" else { return }
    
    //메세지 전송
    let message = commentTextField.text ?? "메세지없당"
    let additionalComments = [Comment(type: .myChat, message: message), Comment(type: .otherChat, message: message)]
    self.comments.append(contentsOf: additionalComments)
    commentTextField.text = ""
    
    //테이블에 메세지 추가
    let indexPaths = (comments.count - additionalComments.count ..< comments.count).map { IndexPath(row: $0, section: 0) }
    self.newssharepostTV.beginUpdates()
    self.newssharepostTV.insertRows(at: indexPaths, with: .none)
    self.newssharepostTV.endUpdates()
    self.newssharepostTV.scrollToRow(at: IndexPath(item: comments.count - 1, section: 0), at: .bottom, animated: false)
  }
  
  // 더미 데이터들
  func setupSampleData() {
    let chat1 = Comment(type: .myChat, message: "안녕 남수야")
    let chat2 = Comment(type: .myChat, message: "잘지내니?")
    let chat3 = Comment(type: .otherChat, message: "그럼 잘지내지ㅎㅎ")
    let chat4 = Comment(type: .otherChat, message: "iOS파트장도 하고싶어")
    let chat5 = Comment(type: .myChat, message: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.이렇게 긴 메세지도 가능~")
    comments = [chat1, chat2, chat3, chat4, chat5]
  }

}

extension NewsSharePostDetailView {
    
    
}
