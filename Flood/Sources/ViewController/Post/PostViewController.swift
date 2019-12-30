//
//  AddArticleViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    // MARK: - UI components
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var PostBtn: UIButton!
    @IBOutlet weak var imagePickerBtn: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var attachViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var postImageCV: UICollectionView!
    
    
    // MARK: - Variables and Properties
    var attachmentViewYPosition:CGFloat = 0
    let picker = UIImagePickerController()
    var pickedIMG : [UIImage] = []
    var tmpImage : UIImage? = nil
    var imageCnt : Int = 0
    
    // 카테고리 리스트
    var categoryList : [String]?
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰 기본 세팅
        initSetting()
        
//        // code for share extension
//        let defaults = UserDefaults(suiteName: "group.com.flood.share")
//        defaults?.set("sss", forKey: "share")
//        defaults?.synchronize()

        
        // button funtion
        backBtn.addTarget(self, action: #selector(cancelPosting), for: .touchUpInside)
        imagePickerBtn.addTarget(self, action: #selector(showImagePickerController), for: .touchUpInside)
        categoryBtn.addTarget(self, action: #selector(category), for: .touchUpInside)
        PostBtn.addTarget(self, action: #selector(posting), for: .touchUpInside)
        
        // delegate 주입
        postTextView.delegate = self
        urlTextField.delegate = self
        postImageCV.delegate = self
        postImageCV.dataSource = self
        picker.delegate = self
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // keyboard show
        addKeyboardNotification()
        self.urlTextField.becomeFirstResponder()
        
        // 탭바 감추기
        self.tabBarController?.tabBar.isHidden = true
        
        // 삭제버튼 감추기
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
    
    // 초기 설정, 더미데이터 넣기
    @objc func initSetting() {
        attachmentView.layer.addBorder([.top, .bottom], color: .veryLightPinkTwo, width: 1)
        categoryBtn.tintColor = .veryLightPink
        categoryList = ["IT","경제","주식","사회","네이버","카카오","NHN","가고싶다"]
    }
    
    // X 버튼 function
    @objc func cancelPosting(){
        
        // 다른화면에서 돌아올때 초기화
        self.urlTextField.text = ""
        self.postTextView.text = ""
        self.categoryBtn.setTitle("", for: .normal)
        self.pickedIMG = []
        self.categoryBtn.setImage(UIImage(named: "icPlusCircle"), for: .normal)
        self.postImageCV.reloadData()

        tabBarController!.selectedIndex = 0
        dismiss(animated: true, completion: nil)
    }
    
    // 게시 버튼 function
    @objc func posting() {
        if canOpenURLHTTP(string: urlTextField.text!){
            print("http")
        } else if canOpenURL(string: urlTextField.text!){
            print("not http")
        } else {
            self.simpleAlert(title: "정확한 URL이 아닙니다", message: "")
        }
        
    }
    
    // 카테고리 버튼 function
    @objc func category() {
        let presentView = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        presentView.categoryList = categoryList
        presentView.delegate = self
        categoryBtn.titleLabel?.font = UIFont(name: "NotoSansCJKkr-Medium", size: 1)

        self.present(presentView, animated: true, completion: nil)
    }

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

// MARK: - UITextViewDelegate

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

// MARK: - UITextFieldDelegate

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

// MARK: -UICollectionViewDelegate

extension PostViewController : UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource

extension PostViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pickedIMG.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCVC", for: indexPath) as! PostImageCVC
        // 셀 확인을 위한 컬러
        cell.postIMG.image = pickedIMG[indexPath.row]
        cell.postIMG.cornerRadius = 10

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCVC", for: indexPath) as! PostImageCVC
        cell.postIMG.image = nil
        pickedIMG.remove(at: indexPath.row)
        
        self.postImageCV.reloadData()
    }
}
    
// MARK: - ImagePickerDelegate
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
            if pickedIMG.count <= 10 {
                self.pickedIMG.append(selectImage)
                self.postImageCV.reloadData()
            } else {
                simpleAlert(title: "이미지 갯수가 제한 갯수인 10개를 넘어갔습니다", message: "")
                dismiss(animated: true, completion: nil)
            }
        }
        
        dismiss(animated: true, completion:  nil)
    }
}

// Category뷰에서 받아오는 delegate
extension PostViewController: CategoryDelegate {
    func didSelectCategory(category: String) {
        categoryBtn.setImage(UIImage(), for: .normal)
        self.categoryBtn.setTitle(category, for: .normal)
    }
}


extension String {
    func isValidUrl() -> Bool {
        let regex : String = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let e = predicate.evaluate(with: self)
        return e
    }
}
