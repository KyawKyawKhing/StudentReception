//
//  StudentVO.swift
//  StudentReception
//
//  Created by AcePlus101 on 12/1/18.
//  Copyright © 2018 AcePlus. All rights reserved.
//

import Foundation
class StudentVO{
    var id : String = UUID.init().uuidString
    
    var profileImage:String? = nil
    
    var userName: String? = nil
    
    var fatherName:String? = nil
    
    var email: String? = nil
    
    var address:String? = nil
    
    var phone: String? = nil
    
    var nrc:String? = nil
    
    var grade:String? = nil
    
    public static func parseToDictionary(student : StudentVO) -> [String : Any] {
        
        let value = [
            "id" : student.id,
            "profileImage" : student.profileImage ?? "",
            "userName" : student.userName ?? "",
            "fatherName" : student.fatherName ?? "",
            "email" : student.email ?? "",
            "address" : student.address ?? "",
            "phone" : student.phone ?? "",
            "nrc" : student.nrc ?? "",
            "grade" : student.grade ?? ""
        ]
        return value
        
    }
    
    public static func parseToStudentVO(json : [String : Any]) -> StudentVO {
        
        let student = StudentVO()
        student.id = json["id"] as! String
        student.profileImage = json["profileImage"] as? String
        student.userName = json["userName"] as? String
        student.fatherName = json["fatherName"] as? String
        student.email = json["email"] as? String
        student.address = json["address"] as? String
        student.phone = json["phone"] as? String
        student.nrc = json["nrc"] as? String
        student.grade = json["grade"] as? String
        return student
    }
}
