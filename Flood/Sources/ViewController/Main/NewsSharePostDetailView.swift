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
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "icLeftArrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "icLeftArrow")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        setupSampleData()
        setupGestureRecognizer()
        
        commentBtn.addTarget(self, action: #selector(generateCommenting), for: .touchUpInside)
        
        newssharepostTV.delegate = self
        newssharepostTV.dataSource = self
        
        navigationController?.isNavigationBarHidden = false
        //self.navigationController?.navigationBar.topItem?.title = ""

        //self.navigationController?.navigationBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0)
        
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
                return 546
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
                let NewsSharePostCell = newssharepostTV.dequeueReusableCell(withIdentifier: "NewsSharePostCell", for: indexPath) as! NewsSharePostCell
                
                /*
                if contentType[indexPath.row] == 0 {
                  NewsSharePostCell.newsshareView.isHidden = false
                  NewsSharePostCell.picturepostView.isHidden = true
                } else {
                  NewsSharePostCell.newsshareView.isHidden = true
                  NewsSharePostCell.picturepostView.isHidden = false
                }
                */
                NewsSharePostCell.newsshareCatarogy.text = "카테고리"
                NewsSharePostCell.newsshareCatarogy.font = UIFont(name: "NotoSansCJKkr-Regular", size:12)
                NewsSharePostCell.newsshareCatarogy.textColor = .electricBlue
                NewsSharePostCell.newsshareCatagoryView.layer.borderWidth = 1
                NewsSharePostCell.newsshareCatagoryView.layer.borderColor = UIColor.electricBlue.cgColor
                NewsSharePostCell.newsshareCatagoryView.setRounded(radius: 11)
                NewsSharePostCell.newsshareprofileImg.image = UIImage(named: "14")
                NewsSharePostCell.newsshareprofileImg.setRounded(radius: 10)
                NewsSharePostCell.newsshareName.text = "이름"
                NewsSharePostCell.newsshareName.font = UIFont(name: "NotoSansCJKkr-Bold", size: 16)
                NewsSharePostCell.newsshareTime.text = "시간"
                NewsSharePostCell.newsshareTime.font = UIFont.systemFont(ofSize: CGFloat(12))
                NewsSharePostCell.newsshareTime.textColor = .veryLightPink
                NewsSharePostCell.newssharePost.text = "게시글"
                NewsSharePostCell.newsPost.font = UIFont(name: "NotoSansCJKkr-Regular", size: 14)
                //NewsSharePostCell.newsshareMore.setImage(UIImage(named: "icMoreGray"), for: .normal)
                NewsSharePostCell.newsTitle.text = "제목"
                NewsSharePostCell.newsPost.text = "뉴스글"
                NewsSharePostCell.newsImg.image = UIImage(named: "26")
                NewsSharePostCell.newsImg.layer.cornerRadius = 10
                NewsSharePostCell.newsflipCount.text = "플립수"
                NewsSharePostCell.newsflipCount.font = UIFont(name: "Gilroy-ExtraBold", size: 12)
                NewsSharePostCell.newsflipCount.textColor = .veryLightPink
                //NewsSharePostCell.newsshareBookmark.setImage(UIImage(named: "icBookmarkBlack"), for: .normal)
                NewsSharePostCell.newsshareView.setBorder(borderColor: .veryLightPink, borderWidth: 1)
                NewsSharePostCell.newsshareView.setRounded(radius: 10)
                 
                return NewsSharePostCell
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
