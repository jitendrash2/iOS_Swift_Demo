//
//  StructClasses.swift
//  Swift iOS Demo
//
//  Created by Jitendra on 18/06/25.
//

import Foundation

struct Users:Codable {
    var id:Int
    var name:String
    var email:String
    
    enum codingKeys:String,CodingKey {
        case id = "user_id"
        case name = "user_name"
        case email = "user_email"
    }
}
    

// Generic
struct Stack<T> {
    var itesm: [T] = []
    
    mutating func push(_ element: T) {
        itesm.append(element)
    }
    
    mutating func pop() -> T? {
        return itesm.popLast()
    }
}
