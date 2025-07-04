//
//  ViewController.swift
//  Swift iOS Demo
//
//  Created by Jitendra on 17/06/25.
//

import UIKit
import Combine

class ViewController: UIViewController {
    var users: User?
    var textLabel: UILabel!
    typealias ComparisonHandler = (Int, Int) -> Bool
    typealias NewHandedler = (Int, Int) -> Int
    
    
    let calucateNumber:(Int, Int) -> Int = {a,b in
            return a+b
    }
    
    
    var aValue = {
        10
    }
    
    
    var vehicle :Vehicle?
    
    
    var emptyArr:[String] = []
    var fruits = ["Apple", "Mango", "Banana"]
    var numbers:[Int] = [1,2,3,4,5]
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.addCheckMark(color: .systemBlue)
        
    }
    
    // Access Control
    func getCompanyDetails(){
        let company:Company = Company(name: "ECI CORPORATION", headquarters: "Indore", department: "iOS", employees: 50)
        print(company.getCompanyInfo())
    }
    
    
    
    func addVehicleDetails(){
        vehicle?.brand = "Toyota"
        vehicle?.model = "Corolla"
        let car = Vehicle(brand: "Tesla", model: "Model S", license: "MH12-XYZ", code: "T123")
        // Encapsulation
        var myAccount:BankAccount?
        myAccount?.deposit(5000)
        
       let myBalance = myAccount?.getBalance()
        print(myBalance as Any)
        
        
        //Abstraction
        let myCar:MyVehicle = MyCar()
        myCar.startEngine()
    }
    
    
    func fetchUserData(){
        var cancellables = Set<AnyCancellable>()
        let url = URL(string: "https://api.example.com/user")!
        URLSession.shared.dataTaskPublisher(for: url).map(\.data).decode(type: Users.self, decoder: JSONDecoder()).sink { completion in
            
        } receiveValue: { user in
            user.name
        }
        .store(in: &cancellables)
    }
    
    
    
    func swapeNumber<T>(_ a: inout T, _ b: inout T){
        let temp = a
        a = b
        b = temp
    }
    
    func callGenericFunction(){
        var intStack = Stack<Int>()
        var stringStack = Stack<String>()
        
        intStack.push(1)
        intStack.push(2)
        intStack.push(3)
                
        stringStack.push("Hello")
        stringStack.push("World")
    }
    
    
    // Closer Example : Closer is a self contain block which can difine as a variable, pass by parameters and return by function
    func performOperation(_ a: Int, _ b: Int, using operation: (Int, Int) -> Int) {
        let result = operation(a, b)
        print("Result: \(result)")
    }
    
    func higherOrderFunctionExample() {
        // 1 - Sort
        var arr = [1, 5, 3, 2, 4]
        let sortedArray = arr.sorted { $0 < $1 } // Always sort assending order
        print(sortedArray)
         let sortedDescendingArray = arr.sorted { $0 > $1 }
        print(sortedDescendingArray)
        
        // 2- map
        let multipliedByTwo = arr.map { $0 * 2 }
        
        // 3 - filter
        let evenNumbers = arr.filter { $0.isMultiple(of: 2) }
        
        // compact map
        let strings: [String?] = ["1", "2", nil, "3", "4"]
        let compactedStrings = strings.compactMap(\.self)
        
        // reduce
        let sum = arr.reduce(0, +) // return 15
        
        // flat map
        let nestedArray: [[Int]] = [[1, 2], [3, 4], [5]]
        let flatArray = nestedArray.flatMap(\.self) // return [1,2,3,4,5]
        
       // for Each
        let names: [String] = ["Jitendra", "Sharma"]
        names.forEach { print($0) }
        
    }
    
    func codableExample() {
        let jsonString = ""
        
        if let data = jsonString.data(using: .utf8) {
            do {
                let users = try JSONDecoder().decode(Users.self, from: data)
                print(users.email)
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        let user = Users(id: 1, name: "Jitendra", email: "jsharma@gmail.com")
        
        if let jsonData = try? JSONEncoder().encode(user) {
            print(String(data: jsonData, encoding: .utf8) ?? "Error converting to JSON string")
        }
        
    }

    func showLoadingSpinning() {
        print("Loading...")
    }
    
    func hideLoadingSpinning() {
        print("hide loading")
    }
    
    // Example Defer
    func getDataFromServer() {
        Logger.shared.log("Getting data...")
        
        showLoadingSpinning() // Start
        
        defer {
            hideLoadingSpinning()
            print("defer called")
        }

        NetworkManager.shared.fetchData { result in
            Logger.shared.log("Fetching data complete")
            switch result {
            case .success(let json):
                print("Parsed JSON: \(json)")
            case .failure(let error):
                print("Error parsing JSON: \(error)")
            }
        }
        
        callNonEscapingCloser {
            print ("Non Escaping Closer")
        }
    }
    
    /*
    // MARK - Closer : closer is a self contain block of code which can be assign as a veriable, paas by parameters and return by function.
    
   // there are two type of closer
    Non Escaping and Escaping
     */
    
    // variable
    let value = {
        print("This is a paramerts")
    }
    
    //Parameters
    let newValue:(Int,Int) -> Int = {a, b in
        return a + b
    }
    
    // Non Escaping closer : a closer executed with in the function called non escaping closer
    
    func callNonEscapingCloser(task:() -> Void){
        //start task
        task()
        //End task
    }
    
    // Escaping Closer
    func callEscapingCloser(task:@escaping () -> Void){
        task()
    }
    
}


