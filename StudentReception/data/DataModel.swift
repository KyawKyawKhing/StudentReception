//
//  DataModel.swift
//  StudentReception
//
//  Created by AcePlus101 on 12/1/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataModel {
    
    private init() {}
    
    static var shared : DataModel =  {
        return sharedDataModel
    }()
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    var user : StudentVO? = nil
    
    func getStudents(success : @escaping ([StudentVO]) -> Void, failure : @escaping () -> Void) {
        NetworkManager.shared.loadStudents(success: { (data) in
            success(data)
        }, failure: {
            failure()
        })
    }
    
    func register(student : StudentVO) {
        let ref = Database.database().reference()
        ref.child("users").child(student.id).setValue(StudentVO.parseToDictionary(student: student))
    }
    
    func login(email : String, password : String, success : @escaping () -> Void, failure : @escaping () -> Void) {
        NetworkManager.shared.login(email: email, password: password, success: { (user) in
            self.user = user
            success()
        }) {
            failure()
        }
    }
    
    func addStudent(student : StudentVO, success : @escaping () -> Void, failure : @escaping () -> Void) {
        NetworkManager.shared.addStudent(student: student, success: {
            success()
        }) {
            failure()
        }
    }
    
    func uploadImage(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        NetworkManager.shared.imageUpload(data: data, success: { (url) in
            success(url)
        }) {
            failure()
        }
    }
    
}
