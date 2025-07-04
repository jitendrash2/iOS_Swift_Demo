//
//  AccessControlClass.swift
//  Swift iOS Demo
//
//  Created by Jitendra on 23/06/25.
//


// Access contorl help us to resrict or allow access part of code in other module. it just like a security. there are 5 type of access control
// open - it can be access in any module and can be override
// public - it can be access in any module but can not be override.
// internal - it can be access in same module (default)
// filePrivate - it can be access in same source file
// private - it can be access in same source file or same scope.

import Foundation

open class Vehicle {
        
    var model : String

    public var brand: String

    private var engineCode: String

    fileprivate var licensePlate: String

    public init(brand:String, model:String, license:String, code:String){
        self.brand = brand
        self.model = model
        self.licensePlate = license
        self.engineCode = code
    }
    
    public func vehhileDetails() -> String{
        return "Brand: \(brand)\nModel: \(model)\nLicense Plate: \(licensePlate)\nEngine Code: \(engineCode)"
    }
    
    func internalVehicleDetails() -> String{
        return "Brand: \(brand)\nModel: \(model)"
    }
    
    fileprivate func privateVehicleDetails() -> String{
        return "License Plate: \(licensePlate)"
    }
    
    private func engineDetails() -> String{
        return "Engine Code: \(engineCode)"
    }
}

// Encapsulation
class BankAccount {
    fileprivate var balance: Double = 0
    
    func deposit(_ amount: Double) {
        balance += amount
    }
    
    func getBalance() -> Double {
        return balance
    }
}


//Abstraction

protocol MyVehicle {
    func startEngine()
    func stopEngine()
}

class MyCar: MyVehicle {
    func startEngine() {
        print("Car engine started")
    }
    
    func stopEngine() {
        print("Car engine stopped")
    }
    
    private func checkCarMentinance(){
        
    }
}

//Inheritance
class Bike {
    func run() {
        print("Bike is running")
    }
}

class MountainBike: Bike {
    override func run() {
        print("Mountain bike is running")
    }
}

// Method Overloading : this is a concept where a class has many function with same name but function parameters are diffrent

class MathOperation {
    func calculate(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func calculate(a: Double, b: Double) -> Double {
        return a + b
    }
}

//Method overriding : this is a concept where subclass provide a new implimantation to its super class
class MusicPlayer {
    func play() {
        print("Playing music")
    }
}

class KaraokePlayer: MusicPlayer {
    override func play() {
        print("Karaoke music is playing")
    }
}



// Delegate
protocol MyDelegate {
    func didReceiveMessage(_ message: String)
}

class TaskHandler {
    var delegate: MyDelegate?
    
    func sendMessage(_ message:String) {
        delegate?.didReceiveMessage(message)
    }
}


class UserInterface: MyDelegate {
    func didReceiveMessage(_ message: String) {
        print("Received message: \(message)")
    }
}


class DefineArray {
    var emptyArr:[String] = []
    var fruits = ["Apple", "Mango", "Banana"]
    var numbers:[Int] = [1,2,3,4,5]
}



open class Company {
    
    var name: String
    
    public var headquarters: String
    
    private var department:String
    
    fileprivate var employees: Int
    
    init(name: String, headquarters: String, department: String, employees: Int) {
        self.name           = name
        self.headquarters   = headquarters
        self.department     = department
        self.employees      = employees
    }
    
    public func getCompanyInfo(){
        print("Get company details")
    }
    
    internal func getCompanyArea(){
        print("Get company area of work")
    }
    
    private func getCompanyDepartment(){
        print("Get company department")
    }
    
    fileprivate func getEmployeeDetails(){
        print("Get employee details")
    }
}
