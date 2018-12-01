//
//  NetworkManager.swift
//  StudentReception
//
//  Created by AcePlus101 on 12/1/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//


import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

class NetworkManager {
    
    let rootRef : DatabaseReference!
    
    let storageRef = Storage.storage().reference().child("images")
    
    private init() {
        rootRef = Database.database().reference()
    }
    
    static var shared : NetworkManager =  {
        return sharedNetworkManager
    }()
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    
    func loadStudents(success : @escaping ([StudentVO]) -> Void, failure : @escaping () -> Void) {
        rootRef.child("kabyar").observe(.value) { (dataSnapshot) in
            if let posts = dataSnapshot.children.allObjects as? [DataSnapshot] {
                var studentList : [StudentVO] = []
                for post in posts {
                    if let value = post.value as? [String : AnyObject] {
                        studentList.append(StudentVO.parseToStudentVO(json: value))
                    }
                }
                success(studentList)
            }
        }
        
    }
    
    func login(email : String, password : String, success : @escaping (StudentVO) -> Void, failure : @escaping () -> Void) {
        
        rootRef.child("users").observe(.value) { (dataSnapshot) in
            
            if let students = dataSnapshot.children.allObjects as? [DataSnapshot] {
                
                for student in students {
                    
                    if let value = student.value as? [String : AnyObject] {
                        
                        let studentVO = StudentVO.parseToStudentVO(json: value)
                        
                        print("\(studentVO.email ?? "") and \(studentVO.phone ?? "Default")")
                        print("\(email) and \(password)")
                        
                        if email == studentVO.email ?? "" && password == studentVO.phone ?? "" {
                            success(studentVO)
                            return
                        }
                    }
                }
            }
        }
    }
    
    func addStudent(student : StudentVO, success : @escaping () -> Void, failure : @escaping () -> Void) {
        rootRef.child("kabyar").child(student.id).setValue(StudentVO.parseToDictionary(student: student))
        success()
    }
    
    func imageUpload(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        
        if let imageData = data {
            let uploadImageRef = storageRef.child("\(Date().millisecondsSince1970).png")
            
            let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
                
                print(metadata ?? "NO METADATA")
                print(error ?? "NO ERROR")
                
                uploadImageRef.downloadURL(completion: { (url, error) in
                    if let error = error {
                        print(error)
                    }
                    if let url = url {
                        print(url.absoluteString)
                        success(url.absoluteString)
                    } else {
                        failure()
                    }
                })
            }
            uploadTask.observe(.progress) { (snapshot) in
                print(snapshot.progress ?? "NO MORE PROGRESS")
            }
            uploadTask.resume()
        }
    }
}
