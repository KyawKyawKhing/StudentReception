//
//  FillFormViewController.swift
//  StudentReception
//
//  Created by AcePlus101 on 11/25/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class FillFormViewController: BaseViewController {

    @IBOutlet weak var imgStudentProfile: UIImageView!
    @IBOutlet weak var tfStudentName: UITextField!
    @IBOutlet weak var tfStudentFatherName: UITextField!
    @IBOutlet weak var tfStudentEmail: UITextField!
    @IBOutlet weak var tfStudentAddress: UITextField!
    @IBOutlet weak var tfStudentPhone: UITextField!
    @IBOutlet weak var tfStudentNrc: UITextField!
    @IBOutlet weak var tfStudentGrade: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onClickFillForm(_ sender: UIButton) {
        print("fill form")
    }
    
}
