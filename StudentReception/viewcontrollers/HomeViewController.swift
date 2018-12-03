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
    
    override func viewWillAppear(_ animated: Bool) {
        loadStudents()
    }
    
    func loadStudents(){
        DataModel.shared.getStudents(success: { (students) in
            self.studentList = students
            self.studentListTableView.reloadData()
        }) {
            print("loading fail")
        }
    }
    
    @IBAction func onClickStudentRegister(_ sender: Any) {
        let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "FillFormViewController") as! UINavigationController
        self.present(navigationVC, animated: true, completion: nil)
    }
    

}
extension HomeViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! UINavigationController
      let vc = navigationVC.children.first as!
        DetailViewController
        vc.data = studentList[indexPath.row]
        self.present(navigationVC, animated: true, completion: nil)
    }
}
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentProfileTableViewCell", for: indexPath) as! StudentProfileTableViewCell
        cell.setData(studentVo: studentList[indexPath.row])
        return cell
    }
    
}
