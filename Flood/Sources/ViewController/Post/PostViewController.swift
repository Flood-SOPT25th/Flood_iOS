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
    @IBOutlet weak var imagePickerBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    
    
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var postImageCV: UICollectionView!
    @IBOutlet weak var attachViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var testIMG: UIImageView!
    @IBOutlet weak var testBtn: UIButton!
    
    // MARK: - Variables and Properties
    var attachmentViewYPosition:CGFloat = 0
    let picker = UIImagePickerController()
    var pickedIMG : [UIImage] = []
    var tmpImage : UIImage? = nil
    var imageCnt : Int = 0
    
    // 카테고리 리스트
    var categoryList : [String]?
        
    // MARK: - Dummy Data
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults(suiteName: "group.com.flood.share")
        defaults?.set("sss", forKey: "share")
        defaults?.synchronize()

        backBtn.addTarget(self, action: #selector(cancelPosting), for: .touchUpInside)
        imagePickerBtn.addTarget(self, action: #selector(showImagePickerController), for: .touchUpInside)
        testBtn.addTarget(self, action: #selector(deleteImg), for: .touchUpInside)
        categoryBtn.addTarget(self, action: #selector(category), for: .touchUpInside)
        
        initSetting()
        
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
        
        self.testBtn.isHidden = true
        
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
    
    // 초기 설정
    @objc func initSetting() {
        attachmentView.layer.addBorder([.top, .bottom], color: .veryLightPinkTwo, width: 1)
        categoryBtn.tintColor = .veryLightPink
        let tabbarHeight = self.tabBarController?.tabBar.frame.size.height ?? 0
        categoryList = ["123","456","234","345"]
    }
    
    // X 버튼 function
    @objc func cancelPosting(){
        tabBarController!.selectedIndex = 0
    }
    
    // 게시 버튼 function
    @objc func posting() {
        
    }
    
    @objc func category() {
        let presentView = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        
        presentView.categoryList = categoryList

        self.present(presentView, animated: true, completion: nil)

//        self.navigationController?.pushViewController(view, animated: true)

    }
    
    @objc func deleteImg() {
        testIMG.image = nil
        testBtn.isHidden = true
    }
    
//    @objc func pickImage() {
//        self.present(self.picker, animated: true) // Controller이기 때문에 present 메서드를 이용해서 컨트롤러 뷰를 띄워준다!
//
    
    
    // MARK: - 키보드 설정
    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification)  {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            let keyboardFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let keyboardHeight = keyboardFrame.height
            let tabbarHeight = self.tabBarController?.tabBar.frame.size.height ?? 0
            
            attachViewBottomConstraint.constant = keyboardHeight - tabbarHeight
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight - tabbarHeight, right: 0)
            
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let info = notification.userInfo {
            let duration = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let curve = info[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
            
            attachViewBottomConstraint.constant = 0
            scrollView.contentInset = .zero
            self.view.setNeedsLayout()
            UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}

extension PostViewController: UITextViewDelegate {
    
    // TextView의 동적인 크기 변화를 위한 function
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

    //    return 버튼을 눌렀을때 키보드가 내려가는 function
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
//        textField.resignFirstResponder()
//        return true
//    }
 
    //    텍스트 편집을 마무리 했을때 키보드가 내려가는 function
//    @objc func endTextFieldEditing(){
//        urlTextField.resignFirstResponder()
//        postTextView.resignFirstResponder()
//    }
}

extension PostViewController : UICollectionViewDelegate {
    
}

extension PostViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pickedIMG.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCVC", for: indexPath) as! PostImageCVC
        // 셀 확인을 위한 컬러
        cell.backgroundColor = .black
        cell.postIMG.image = pickedIMG[indexPath.row]
        cell.postIMG.backgroundColor = .black
        
        return cell
    }
    
}
    
    
extension PostViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
    @objc func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            tmpImage = selectImage
        }
//        self.pickedIMG.insert(tmpImage!, at: 0)
        
        testIMG.image = tmpImage!
        if testIMG.image != nil {
            testBtn.isHidden = false
        }
        
        dismiss(animated: true, completion:  nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        var newImage: UIImage? = nil
//
//        if let selectImage = info["UIImagePickerControllerEditedImage"] as? UIImage { // 수정된 이미지가 있을 경우
//            newImage = selectImage
//        } else if let selectImage = info["UIImagePickerControllerOriginalImage"] as? UIImage { // 오리지널 이미지가 있을 경우
//            newImage = selectImage
//        }
//
//        pickedIMG[imageCnt] = newImage!
//        testIMG.image = newImage!
//        // 받아온 이미지를 이미지 뷰에 넣어준다.
//        imageCnt += 1
//        picker.dismiss(animated: true) // 그리고 picker를 닫아준다.
//    }
}



