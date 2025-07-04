//
//  Protocols.swift
//  Swift iOS Demo
//
//  Created by Jitendra on 17/06/25.
//

import Foundation
import UIKit

protocol Container {
    associatedtype Item
    mutating func add(item: Item)
    func getAllItems() -> [Item]
}

struct IntContainer: Container {
    var items = [Int]()
     
    mutating func add(item: Int) {
         self.items.append(item)
    }
    
    func getAllItems() -> [Int] {
        return items
    }
}

class Car {
    var brand: String
    
    init(brand: String) {
        self.brand = brand
    }
}

class Person {
    var myCar: Car? // This is a strong ref by default.
    
    init(myCar: Car?) {
        self.myCar = myCar
    }
}

// myCar has a strong refrence.

// ✅ Singleton Pattern (Creational)

/*Why use Singleton?
When you need a shared resource like:

Logging
Network manager
Database connection
App configuration

Prevents multiple instances that might conflict or waste memory
*/


/*
 🔒 What are Singleton Classes?
 A Singleton class is a design pattern that ensures a class has only one instance in the entire application and provides a global point of access to that instance.
 */
class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    init() {}
    func fetchData(completion: @escaping (Result<Any, Error>) -> Void) {
        // Networking logic here...
        // Sample URL
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
                completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                return
            }

            // Create data task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                    return
                }

                do {
                    // Try to parse JSON
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(.success(json))
                } catch {
                    completion(.failure(error))
                }
            }

            // Start the task
            task.resume()
    }
}


// Prototype Pattern

protocol Clonable {
    func clone() -> Self
}

class Document: Clonable {
    var title: String
    var content: String

    required init(title: String, content: String) {
        self.title = title
        self.content = content
    }

    func clone() -> Self {
        return type(of: self).init(title: self.title, content: self.content)
    }
}



class SpecialDocument: Document {
    var watermark: String = "Confidential"
    
    required init(title: String, content: String) {
        super.init(title: title, content: content)
    }
    
    open override func clone() -> Self {
        let clone = super.clone() as? SpecialDocument
        clone!.watermark = self.watermark
        return clone as! Self
    }
}



// MVC architecture Model-View-Controller
// Model manage data operation
// View manage all UI operation
// Controller cordinate between model and view

struct User {
    var name: String
    var email: String
}




// SOLID Principles : This is 5 key prinicple in OPPS programing which will help the code is more scalable, reusable, and maintainable.

// 1. S -> Single Responsibility Princile (SRP) : This means a class can only one resone to change, means do not mix diffrent logic in a single class

class reportPrinter {
    
    func printReport(){
        print("Print the reports")
    }
}

class reportSaver {
    func saveReport(){
        print("Save the report")
    }
}

// 2. O -> Open and Close Principle : Software entities like Class, Models, and function can open for extension but close for modification

protocol Shape {
    func area() -> Double
}

class Square: Shape {
    var radius:Double
    init(radius: Double) {
        self.radius = radius
    }
    func area() -> Double {
        return 3.14 * radius * radius
    }
}

// 3. Liskov Substitution Principle : Sub class is replaceable to it's super class.

class Bird {
    func fly(){
    }
}

class Sparrow : Bird {
    
}


// 4. I -> Interface Segregation Principle (ISP) : A client should not be force to impliment unused code, in this case divide big potocal into multiple small protocals.

protocol Printable {
    func printTheFile()
}

protocol Scanable {
    func scanTheFile()
}

class Printer : Printable{
    func printTheFile() {
        // file is printing.
    }
}

// 5. D -> Dependency Invension Principle : High level module should not be depends on low level module, both shoule be depends on abstraction
protocol Database {
    func saveFile()
}

class SQLDatabase : Database{
    func saveFile() {
        
    }
}

class FileManager {
    var database:Database
    init(database: Database) {
        self.database = database
    }
}

// REST API :- Representational state transfer also call RESTful API which use HTTP method to perform curd operation between client and server
// CURD operation line GET, POST, PUT, Delete, Patch
// Associate Type: Associate type is a placeholder which is used in protocol to make it more faxible or reusable, in class

protocol Brands {
    associatedtype Products
    func getProducts() -> [Products]
    func addProduct(_ product: Products)
}

class Apple : Brands {
    typealias Products = String
    
    var products:[String] = []
    
    func getProducts() -> [String] {
        return products
    }
    
    func addProduct(_ product: String) {
        products.append(product)
    }
}

// Mutating and Immutable: - Swift occaor error when Struct, enum and touple are define as let constatnt and want to change the property in class.

struct Counter {
    var count:Int = 0
    
    mutating func increment() {
        count += 1
    }
}

class CounterClass {
    var myCounter = Counter()
    func getMyCounter(){
        myCounter.increment()
    }
}

struct Persons {
    var name:String
    
    mutating func printName(to newName:String){
        name = newName
    }
}


// Strong : When we declear a class instance object then it's by default hold the strong and can not be deallocated

class Phone {
    var brand :String
    init(brand: String) {
        self.brand = brand
    }
}

class UserPhone {
    var myBrand:Phone //Strong refrence.
    
    init(myBrand: Phone) {
        self.myBrand = myBrand
    }
}

// if two object hpld the refrence to each other in this case retain cycle can cause and can not be deallocated which lead the memory leak.

// What is defer keyword : We use defer ketwork to postpone the execution of block of code untill its completed with susscess or failer, defer key word mostly use in Newtork API call, closinf files

class FileHandler {
    func openFile(){
        print("Call the API")
        defer {
            //Stop the loader
        }
        print("finish the API call with success or failer")
    }
}

// Design Pattern: this is a soloution that can make our code is more scalable, resuable. to make code
// CSB :
// Creational : To define the object
// Structural : add object and class
// Behavioral : Cummunication between class and objects

//1. Singleton Class : When we create a class with single instace and can use in entire project.

class LoggerClass {
    static let shared = LoggerClass()
    
    private init() {}
    
    func printYourLog(_ message:String){
        print("Print your message")
    }
}

// Prototype pattern: this is creational design pattern when we create a object by coping another existing object.
protocol ClonableObject {
    func clone() -> Self
}

class MyDocument:ClonableObject{
    var title:String
    var message:String
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    func clone() -> Self {
        return MyDocument(title: title, message: message) as! Self
    }
    
    // Required convenience init for cloning
        required convenience init(title: String, content: String) {
            self.init(title: title, message: content)
        }
}

// Codable : this is a protocol to allow encode and decode the data from JSON and plist

struct NewPerson: Codable {
    var name: String
    var age: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case age = "my_age"
    }
}


