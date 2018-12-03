//
//  FillFormViewController.swift
//  StudentReception
//
//  Created by AcePlus101 on 11/25/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit
import SDWebImage

class FillFormViewController: BaseViewController {

    @IBOutlet weak var imgStudentProfile: UIImageView!
    @IBOutlet weak var tfStudentName: UITextField!
    @IBOutlet weak var tfStudentFatherName: UITextField!
    @IBOutlet weak var tfStudentEmail: UITextField!
    @IBOutlet weak var tfStudentAddress: UITextField!
    @IBOutlet weak var tfStudentPhone: UITextField!
    @IBOutlet weak var tfStudentNrc: UITextField!
    @IBOutlet weak var tfStudentGrade: UITextField!
    
    var profileImageUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgStudentProfile.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickProfileImage(_ :))))
    }
    
    @objc func onClickProfileImage(_ sender: UITapGestureRecognizer){
       print("click profile upload")
    self.chooseUpload(imagePickerControllerDelegate: self)
    }
    
    @IBAction func onClickFillForm(_ sender: UIButton) {
        print("fill form")
        let studentVO = StudentVO()
        studentVO.profileImage = profileImageUrl
        studentVO.userName = tfStudentName.text ?? ""
        studentVO.fatherName = tfStudentFatherName.text ?? ""
        studentVO.email = tfStudentEmail.text ?? ""
        studentVO.address = tfStudentAddress.text ?? ""
        studentVO.phone = tfStudentPhone.text ?? ""
        studentVO.nrc = tfStudentNrc.text ?? ""
        studentVO.grade = tfStudentGrade.text ?? ""
        
        DataModel.shared.addStudent(student: studentVO, success: {
            self.dismiss(animated: true, completion: nil)
        }) {
            
        }
    }
    
    @IBAction func onClickBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
extension FillFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true, completion: nil)
        
        if let pickedImage = info[.editedImage] as? UIImage {
            
            DataModel.shared.uploadImage(data: pickedImage.pngData(), success: { (url) in
                
                self.profileImageUrl = url
                
                self.imgStudentProfile.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "student-placeholder"))
                
            }) {
                self.showAlertDialog(inputMessage: "Error.")
            }
            
        }
        
    }
    
}

