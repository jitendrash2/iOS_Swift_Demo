//
//  ValueType.swift
//  Swift iOS Demo
//
//  Created by Jitendra on 30/06/25.
//


// Value type: this is a type where each instance hold it's unique value which can be assign or pass in any variable, parameters, or pass in any function.
// when value type is used then its created a copy of value type.
// Strcut,Enum, Touple are value type.

// Feature: A new copy created when passed or assigned, ARC not allocated because value type does not hold strong reference.

import Foundation


struct Point{
    var x:Int
    var y:Int
}

class ValueTypeDemo{
    func run(){
        var p1:Point = Point(x:10,y:20)
        var p2:Point = p1
        p2.x = 100
        print("p1: \(p1)")
        print("p2: \(p2)")
    }
}


// Refrence Type: A call or protocol are refrence type, when it's assigned then create a strong refrence. variable or constant share same instace insted create a new copy.
// Class, Function are refrence type.

class Coumpany{
    var name:String
    init(name:String){
        self.name = name
    }
}


class RefrenceTypeDemo{
    func run(){
        var c1:Coumpany = Coumpany(name: "Apple")
        var c2:Coumpany = c1
        c2.name = "Google"
        print("c1: \(c1)")
        print("c2: \(c2)")

        if c1 === c2{
            print("Same Instance")
        }
        
        // Use enum type
        
        print(WeekDay.monday.rawValue)
    }
}

// Enums : in swift enums are fix set of value when we want to use fix operation. comanly use to define date formator.

enum Color{
    case red
    case green
    case blue
}

// Raw value enum

enum WeekDay:String{
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

class EnumDemo{
    func run(){
        var color:Color = .red
        print(color)
        
        switch color{
        case .red:
            print("Color is Red")
        case .green:
            print("Color is Green")
        case .blue:
            print("Color is Blue")
        }
    }
}


// CDG : this is the management task thread system, and execute multiple task in sequence.
// 5 key concept of CGD
// DispetchQueue : represent a there when task are schedule
// Serial Queue : execute a task at a time
// ConcurentQueue : execute multiple task at a time
// mainQueue : seriall queue in all UI update
// GlobleQueue : system concurent queue for all background task.


class DispatchQueueDemo{
    func runc (){
        DispatchQueue.main.async {
            
        }
        
        DispatchQueue.global(qos: .background).async {
            
        }
    
        let serialQueue = DispatchQueue(label: "serialQueue")
        serialQueue.async {
            
        }
        
        DispatchQueue.global().async {
            // Background task to get image data
            let imageData = Data()
            
            // Update UI
            DispatchQueue.main.async {
                // imageVeiw.image = UIImage(data: imageData)
            }
        }
    }
    
    
    func dispechGroup(){
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            print("Task 1 finished")
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                
        }
        
        group.notify(queue: .main) {
            print("All task finished")
        }
    }
}


// Classess

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class FoodOrder {
    var food: Food
    var quantity: Int
    
    init(food: Food, quantity: Int) {
        self.food = food
        self.quantity = quantity
    }
}

class Restaurant {
    var orderName: String = "Clod drink"
    var quantity: Int = 1
    
    init(orderName: String, quantity: Int) {
        self.orderName = orderName
        self.quantity = quantity
    }
    func orderMyFood(name:String, quantity:Int){
        
    }
}

class fooddemo {
    let restrorent:Restaurant! = Restaurant(orderName: "Cold", quantity: 2)
}


//Singleton Class
// ✅ Singleton Pattern (Creational)

/*Why use Singleton?
When you need a shared resource like:

Logging
Network manager
Database connection
App configuration

Prevents multiple instances that might conflict or waste memory
*/

class Logger {
    static let shared = Logger()
    private init() {}
    func log(_ message: String) {
        print("Log: \(message)")
    }
}


// Codable : We use codable to parse json from API,it's encode the data from API and decode the data to post on server using API

struct Employee: Codable {
    let id:Int
    let name: String
    let position: String
}

struct Organization: Codable {
    let name: String
    let employees: [Employee]
    
    enum CodingKeys: String, CodingKey {
        case name
        case employees = "employee"
    }
}

class getOrganizationData {
    func getOrgData(){
        if let url = URL(string: "https://www.hackingwithswift.com/samples/json/employees.json") {
            do {
                let org = try JSONDecoder().decode(Organization.self, from: Data(contentsOf: url))
                
                for orgEmployee in org.employees {
                    let name = orgEmployee.name
                    let position = orgEmployee.position
                    print("\(name) is a \(position)")
                }
            }catch {
                Logger.shared.log("Failed to fetch data: \(error)")
            }
        }
    }
}
