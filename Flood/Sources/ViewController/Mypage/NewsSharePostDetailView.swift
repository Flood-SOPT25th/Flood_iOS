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
    var comments: [Comment] = []
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //commentBtn.addTarget(self, action: #selector(generateCommenting), for: .touchUpInside)
        
        newssharepostTV.delegate = self
        newssharepostTV.dataSource = self
        
        navigationController?.isNavigationBarHidden = false
        //self.navigationController?.navigationBar.topItem?.title = ""
        //self.navigationController?.navigationBar.tintColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0)

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
    
}
// MARK: - UITableViewDataSource
extension NewsSharePostDetailView: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let NewsSharePostCell = newssharepostTV.dequeueReusableCell(withIdentifier: "NewsSharePostCell", for: indexPath) as! NewsSharePostCell
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
}

// MARK: - NewsSharePostDetailView
/*
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
    let height = keyboardSize.height - view.safeAreaInsets.bottom
    
    
    //하단 채팅 보내는 뷰의 bottom Constraint이야!
    //위에서 계산한 높이값만큼 contant값을 넣어 주는 것.. 이건 당연 알겠지
    self.commentViewBottomConstraint.constant = height
    
    //이건 이제 키보드가 올라오면 테이블뷰의 안의 콘텐트 인셋을 위에서 계산된 height값으로 줘버리는거야
    //그럼 키보드가 올라올때 그만큼 인셋이 생겨서 슝하고 올라감
    //물론 scrollToRow로 제일 아래로 테이블뷰 위치 옮기는거 같이 써서ㅋ
    //self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
    //self.tableView.scrollToRow(at: IndexPath(item: comments.count - 1, section: 0), at: .bottom, animated: false)
    
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
    //self.tableView.contentInset = .zero
    self.view.setNeedsLayout()
    UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
      self.view.layoutIfNeeded()
    })
  }
}
*/
// 키보드 때문에 가려지지 않게 조정하는 extension
extension NewsSharePostDetailView: UIGestureRecognizerDelegate {
    
    func initGestureRecognizer() {
        let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
        textFieldTap.delegate = self
        view.addGestureRecognizer(textFieldTap)
    }
    
    // 다른 위치 탭했을 때 키보드 없어지는 코드
    @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
        self.commentTextField.resignFirstResponder()
       
    }
    
    
    func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //if (touch.view?.isDescendant(of: commentTextField))! || (touch.view?.isDescendant(of: pwTextField))! {
            
        //    return false
        //}
        return true
    }
    
    // keyboard가 보여질 때 어떤 동작을 수행
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        // animation 함수
        // 최종 결과물로 보여줄 상태만 선언해주면 애니메이션은 알아서 동작
        // duration은 간격
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            //self.logoImgView.alpha = 0
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.commentViewBottomConstraint.constant = -keyboardHeight/2 + 125
        })
        //스택뷰 CenterY 잡아와서 constant 계산
        
        self.view.layoutIfNeeded()
    }
    
    // keyboard가 사라질 때 어떤 동작을 수행
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            //self.logoImgView.alpha = 1.0
            self.commentViewBottomConstraint.constant = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
    
    // observer
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

}

