//
//  ViewController.swift
//  RealmBenchmark
//
//  Created by Toshihiro Morimoto on 12/18/15.
//  Copyright © 2015 Toshihiro Morimoto. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let count = 0...15_000
        
        // MARK: insert
        
        deleteDB()
        performTest("insert - Int(連番)") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let employee = Employee()
                    employee.setupValue(row)
                    realm.add(employee)
                }
            }
        }
        
        deleteDB()
        performTest("insert - Int     ") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let director = Director()
                    director.setupValue(row)
                    realm.add(director)
                }
            }
        }
        
        deleteDB()
        performTest("insert - String  ") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let employer = Employer()
                    employer.setupValue(row)
                    realm.add(employer)
                }
            }
        }
        
        deleteDB()
        performTest("update - Int(連番)") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let employee = Employee()
                    realm.add(employee, update: true)
                }
            }
        }
        
        deleteDB()
        performTest("update - Int     ") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let director = Director()
                    realm.add(director, update: true)
                }
            }
        }
        
        deleteDB()
        performTest("update - String  ") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let employer = Employer()
                    realm.add(employer, update: true)
                }
            }
        }
        
        performTest("insert update - Int(連番)") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let employee = Employee()
                    employee.setupValue(row)
                    realm.add(employee, update: true)
                }
            }
        }
        
        performTest("insert update - Int     ") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let director = Director()
                    director.setupValue(row)
                    realm.add(director, update: true)
                }
            }
        }
        
        performTest("insert update - String  ") { _ in
            let realm = try! Realm()
            try! realm.write {
                count.forEach { row in
                    let employer = Employer()
                    employer.setupValue(row)
                    realm.add(employer, update: true)
                }
            }
        }
        
        // MARK: filter
        
        performTest("filter primary key - Int(連番)") { _ in
            let realm = try! Realm()
            count.forEach { row in
                realm.objects(Employee).filter("id = 100")
            }
        }
        
        performTest("filter primary key - Int     ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                realm.objects(Director).filter("id = 100")
            }
        }
        
        performTest("filter primary key - String  ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                realm.objects(Employer).filter("id contains '100'")
            }
        }
        
        performTest("filter - Int(連番)") { _ in
            let realm = try! Realm()
            count.forEach { row in
                realm.objects(Employee).filter("name contains 'Foo0' And hired == NO And age BETWEEN { 20 , 50 }")
            }
        }
        
        performTest("filter - Int     ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                realm.objects(Director).filter("name contains 'Foo0' And hired == NO And age BETWEEN { 20 , 50 }")
            }
        }
        
        performTest("filter - String  ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                realm.objects(Employer).filter("name contains 'Foo0' And hired == NO And age BETWEEN { 20 , 50 }")
            }
        }
        
        // MARK: enumerate
        
        performTest("enumerate primary - Int(連番)") { _ in
            let realm = try! Realm()
            count.forEach { row in
                let objects = realm.objects(Employee).filter("id = 100")
                objects.forEach { object in
                    let id = object.valueForKey("id")?.intValue
                    let age = object.valueForKey("age")?.intValue
                    let hired = object.valueForKey("hired")
                    let name = object.valueForKey("name")
                }
            }
        }
        
        performTest("enumerate primary - Int     ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                let objects = realm.objects(Director).filter("id = 100")
                objects.forEach { object in
                    let id = object.valueForKey("id")?.intValue
                    let age = object.valueForKey("age")?.intValue
                    let hired = object.valueForKey("hired")
                    let name = object.valueForKey("name")
                }
            }
        }
        
        performTest("enumerate primary - String  ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                let objects = realm.objects(Employer).filter("id contains '100'")
                objects.forEach { object in
//                    let id = object.valueForKey("id")
//                    let age = object.valueForKey("age")?.intValue
//                    let hired = object.valueForKey("hired")
//                    let name = object.valueForKey("name")
                }
            }
        }
        
        performTest("enumerate - Int(連番)") { _ in
            let realm = try! Realm()
            count.forEach { row in
                let objects = realm.objects(Employee).filter("name contains 'Foo0' And hired == NO And age BETWEEN { 20 , 50 }")
                objects.forEach { object in
                    let id = object.valueForKey("id")?.intValue
                    let age = object.valueForKey("age")?.intValue
                    let hired = object.valueForKey("hired")
                    let name = object.valueForKey("name")
                }
            }
        }
        
        performTest("enumerate - Int     ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                let objects = realm.objects(Director).filter("name contains 'Foo0' And hired == NO And age BETWEEN { 20 , 50 }")
                objects.forEach { object in
                    let id = object.valueForKey("id")?.intValue
                    let age = object.valueForKey("age")?.intValue
                    let hired = object.valueForKey("hired")
                    let name = object.valueForKey("name")
                }
            }
        }
        
        performTest("enumerate - String  ") { _ in
            let realm = try! Realm()
            count.forEach { row in
                let objects = realm.objects(Employer).filter("name contains 'Foo0' And hired == NO And age BETWEEN { 20 , 50 }")
                objects.forEach { object in
                    let id = object.valueForKey("id")
                    let age = object.valueForKey("age")?.intValue
                    let hired = object.valueForKey("hired")
                    let name = object.valueForKey("name")
                }
            }
        }
        
    }
    
    private func performTest(label: String, block: (() -> Void)) {
        let start = NSDate.timeIntervalSinceReferenceDate()
        autoreleasepool {
            block()
        }
        let duration = NSDate.timeIntervalSinceReferenceDate() - start
        print("[\(label)]\t\(NSString(format: "%.4f", duration)) sec")
    }
    
    private func deleteDB() {
        let path = try! Realm().path
        if NSFileManager().fileExistsAtPath(path) {
            try! NSFileManager().removeItemAtPath(path)
        }
    }
    

}

// MARK: - Realm Object

class Employee: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var age = 0
    dynamic var hired = false
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    func setupValue(row: Int) {
        id = row
        name = "Foo\(row)"
        age = row % 50 + 10
        hired = row % 2 == 0
    }
    
}

class Employer: Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var age = 0
    dynamic var hired = false
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    func setupValue(row: Int) {
        id = String(row)
        name = "Foo\(row)"
        age = row % 50 + 10
        hired = row % 2 == 0
    }
    
}

class Director: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var age = 0
    dynamic var hired = false
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    func setupValue(row: Int) {
        id = row * 20
        name = "Foo\(row)"
        age = row % 50 + 10
        hired = row % 2 == 0
    }
    
}