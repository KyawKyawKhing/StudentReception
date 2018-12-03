//
//  DetailViewController.swift
//  StudentReception
//
//  Created by AcePlus101 on 11/25/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: BaseViewController {
    @IBOutlet weak var imgStudentProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFatherName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblNrc: UILabel!
    @IBOutlet weak var lblGrade: UILabel!
    
    var data:StudentVO = StudentVO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgStudentProfile.sd_setImage(with: URL(string: data.profileImage ?? ""), placeholderImage: UIImage(named: "student"))
        self.lblName.text = data.userName
        self.lblFatherName.text = data.fatherName
        self.lblEmail.text = data.email
        self.lblAddress.text = data.address
        self.lblPhone.text = data.phone
        self.lblNrc.text = data.nrc
        self.lblGrade.text = data.grade
    }
    
    @IBAction func onClickBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
