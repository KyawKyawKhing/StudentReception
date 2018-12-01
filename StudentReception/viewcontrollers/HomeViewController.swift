//
//  HomeViewController.swift
//  StudentReception
//
//  Created by AcePlus101 on 11/25/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var studentList:[StudentVO] = []
    @IBOutlet weak var studentListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils.cellRegister(nibName: "StudentProfileTableViewCell", tableView: studentListTableView)
        studentListTableView.dataSource = self
        studentListTableView.delegate = self
    }
    
    func loadStudents(){
        DataModel.shared.getStudents(success: { (students) in
            self.studentList = students
            self.studentListTableView.reloadData()
        }) {
            print("loading fail")
        }
    }

}
extension HomeViewController:UITableViewDelegate{
    
}
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentProfileTableViewCell", for: indexPath)
        return cell
    }
    
}
