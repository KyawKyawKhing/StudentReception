//
//  StudentProfileTableViewCell.swift
//  StudentReception
//
//  Created by AcePlus101 on 11/26/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit
import SDWebImage

class StudentProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var studentImage: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentGrade: UILabel!
    @IBOutlet weak var studentEmail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(studentVo:StudentVO){
        self.studentImage.sd_setImage(with: URL(string: studentVo.profileImage ?? ""), placeholderImage: UIImage(named: "student-placeholder"))
        self.studentName.text = studentVo.userName
        self.studentGrade.text = studentVo.grade
        self.studentEmail.text = studentVo.email
    }
    
}
