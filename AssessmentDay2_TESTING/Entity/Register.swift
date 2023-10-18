//
//  Register.swift
//  AssessmentDay2
//
//  Created by P090MMCTSE008 on 18/10/23.
//

import Foundation

struct Register {
    let name : String
    let age : Int
    let salary : String
    
}

enum RegisterType: String {
    case name = "Nama"
    case age = "Umur"
    case salary = "Gaji"
    
}
