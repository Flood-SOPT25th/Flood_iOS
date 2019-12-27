//
//  AddArticleViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit
//import FMPhotoPicker
//import Tagging

class PostViewController: UIViewController {
    
    // MARK: - UI components
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var PostBtn: UIButton!
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var imagePickerBtn: UIButton!
    @IBOutlet weak var postImageCV: UICollectionView!
    
    // MARK: - Variables and Properties
    var keycnt:Bool = false
    var attachmentViewYPosition:CGFloat = 0
    let picker = UIImagePickerController()
    var pickedIMG : UIImage?
    
    // MARK: - Dummy Data
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.addTarget(self, action: #selector(cancelPosting), for: .touchUpInside)
        
        postSetting()
        
        postTextView.delegate = self
        urlTextField.delegate = self
        postImageCV.delegate = self
        postImageCV.dataSource = self
        picker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addKeyboardNotification()
        
        // keyboard show
        self.urlTextField.becomeFirstResponder()
        
        // 탭바 감추기
        self.tabBarController?.tabBar.isHidden = true
        
        self.urlTextField.text = ""
        self.postTextView.text = ""
        self.postTextView.placeholder = "내용을 입력해주세요"
        attachmentViewYPosition = self.attachmentView.frame.origin.y
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endTextFieldEditing)))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 화면 나갈때 탭바 감추기 해제
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    // MARK: -Helpers
    
    // X 버튼 function
    @objc func cancelPosting(){
        tabBarController!.selectedIndex = 0
    }
    
    // 게시 버튼 function
    @objc func posting() {
        
    }
    
    // 초기 설정
    @objc func postSetting() {
        attachmentView.layer.addBorder([.top, .bottom], color: .veryLightPinkTwo, width: 1)
    }
    
    @objc func pickImage() {
        self.present(self.picker, animated: true) // Controller이기 때문에 present 메서드를 이용해서 컨트롤러 뷰를 띄워준다!
    }
    
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification)  {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keybaordRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keybaordRectangle.height
            let tabbarHeight = self.tabBarController?.tabBar.frame.size.height
            if keycnt == false {
                attachmentView.frame.origin.y -= keyboardHeight - tabbarHeight!
                keycnt = true
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if keycnt == true {
            attachmentView.frame.origin.y = attachmentViewYPosition
            keycnt = false
        }
    }
}

extension PostViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
    
}

extension PostViewController: UITextFieldDelegate {
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
//        textField.resignFirstResponder()
//        return true
//    }
    
//    @objc func endTextFieldEditing(){
//        urlTextField.resignFirstResponder()
//        postTextView.resignFirstResponder()
//    }
}

extension PostViewController : UICollectionViewDelegate {
    
}

extension PostViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCVC", for: indexPath) as! PostImageCVC
//        cell.postIMG.image = postIMG[indexPath.row]
        cell.postIMG.backgroundColor = .black
        
        return cell
    }
    
}
    
    
extension PostViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage? = nil
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage { // 수정된 이미지가 있을 경우
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage { // 오리지널 이미지가 있을 경우
            newImage = possibleImage
        }
        
//        = newImage // 받아온 이미지를 이미지 뷰에 넣어준다.
        
        picker.dismiss(animated: true) // 그리고 picker를 닫아준다.
    }


}



