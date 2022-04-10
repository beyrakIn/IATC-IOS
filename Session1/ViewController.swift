//
//  ViewController.swift
//  Session1
//
//  Created by PC1 on 09.04.22.
//

import UIKit

class ViewController: UIViewController {
    private mutableStringTest = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mutableStringTest = self.process()
        self.mutableStringTest = self.processAdd(self.mutableStringTest)

        // High order functions
        var list = [1, 2, 3, 4, 5, 6]

        // forEach
        list.forEach{ number in
            print("Number is \(number).")
        }

        // map
        var listNumbersStruct =  list.map{ number in 
            return NumberItem(title: "\(number)", value: number)
        }
        print(listNumbersStruct)
        

        // filter
        var listNumberOdds =  list.filter{ number in 
            return number % 2 == 1
        }

        print(listNumberOdds)

        

        let instance = SingleStruct.shared
        
    }

    // Pure functions
    func process() -> String{
        "Hello"
    }

    func processAdd(_ name: String) -> String {
        return "Hello " + name        
    }

    struct NumberItem {
        var title: String
        var value: Int
    }


    // Singleton pattern
    let instance = SingleStruct.shared
    let instance2 = SingleStruct.shared
    print(instance.returnCount())
    instance2.inc()
    print(instance.returnCount())

    let controller = SingleStructController()
    print(controller.getCount())


    // Builder pattern

    let person1 = Person.Builder()
        .setName("Beyrak")
        .setSurname("Asgarzade")
        .setAge(20)
        .setGender(.male)
        .build()

    print(person1.name)
    print(person1.surname)
    print(person1.age)
    print(person1.gender)
    

}


// Singleton pattern
class SingleStructController{
  func getCount() -> Int{
    SingleStruct.shared.returnCount()
  }  
}


class SingleStruct{
  static let shared: SingleStruct = SingleStruct()
  private var count = 0
  
  private init(){
  } 

  func inc(){
    count += 1
  }

  func dec(){
    count -= 1
  }

  func returnCount() -> Int{
    self.count
  }
  
  func sum(_ par1: Int, _ par2: Int )-> Int{
    par1 + par2
  }

  
}


// Builder pattern


class Person{
  var name: String
  var surname: String
  var age: Int
  var gender: Gender

  init(
    name: String,
    surname: String,
    age: Int,
    gender: Gender
  ){
    self.name = name
    self.surname = surname
    self.age = age
    self.gender = gender
  }

  init(){
    name = ""
    surname = ""
    age = 0
    gender = .male
  }

  class Builder{
    private let person: Person = Person()
    func build() -> Person{
      self.person
    }

    func setName(_ name: String) -> Builder{
      self.person.name = name
      return self
    }
    
    func setSurname(_ surname: String) -> Builder{
      self.person.surname = surname
      return self
    }
    
    func setAge(_ age: Int) -> Builder{
      self.person.age = age
      return self
    }

    func setGender(_ gender: Gender) -> Builder{
      self.person.gender = gender
      return self
    }
    
  }
}

enum Gender{
  case male, female
}