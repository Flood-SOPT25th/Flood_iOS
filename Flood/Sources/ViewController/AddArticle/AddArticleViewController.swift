//
//  AddArticleViewController.swift
//  Flood
//
//  Created by Junhyeon on 2019/12/23.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit
import FMPhotoPicker
//import Tagging

class PostViewController: UIViewController {
    
    // MARK: - UI components
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var PostBtn: UIButton!
    @IBOutlet weak var attachmentView: UIView!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var imagePickerBtn: UIButton!
    
    // MARK: - Variables and Properties
    var keycnt:Bool = false
    var attachmentViewYPosition:CGFloat = 0
    
    // MARK: - Dummy Data
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.addTarget(self, action: #selector(cancelPosting), for: .touchUpInside)
        
        postSetting()
        
        postTextView.delegate = self
        urlTextField.delegate = self
        
        //        picker.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // keyboard show
        self.urlTextField.becomeFirstResponder()
        
        // 탭바 감추기
        self.tabBarController?.tabBar.isHidden = true
        self.urlTextField.text = ""
        self.postTextView.text = ""
        self.postTextView.placeholder = "내용을 입력해주세요"
        attachmentViewYPosition = self.attachmentView.frame.origin.y
        
        addKeyboardNotification()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endTextFieldEditing)))
        
        //        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endTextViewEditing)))
        
        
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
    
    //    @objc func endTextViewEditing(){
    //    }
    
    
    
}

extension PostViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @objc func endTextFieldEditing(){
        urlTextField.resignFirstResponder()
        postTextView.resignFirstResponder()
    }
}

extension PostViewController : FMPhotoPickerViewControllerDelegate {
    
    func fmPhotoPickerController(_ picker: FMPhotoPickerViewController, didFinishPickingPhotoWith photos: [UIImage]) {
        self.dismiss(animated: true, completion: nil)
        //        previewImageView.image = photo
        
    }
    
    
}

extension PostViewController : FMImageEditorViewControllerDelegate {
    
    func fmImageEditorViewController(_ editor: FMImageEditorViewController, didFinishEdittingPhotoWith photo: UIImage) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}



