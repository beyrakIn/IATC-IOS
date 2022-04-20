//
//  ViewController.swift
//  Session1
//
//  Created by PC1 on 09.04.22.
//

import UIKit
import Swift

class ViewController: UIViewController {
    private var mutableStringTest = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mutableStringTest = self.process()
        self.mutableStringTest = self.processAdd(self.mutableStringTest)
//
//        // High order functions
//        let list = [1, 2, 3, 4, 5, 6]
//
//        // forEachs
//        list.forEach{ number in
//            print("Number is \(number).")
//        }
//
//        // map
//        let listNumbersStruct =  list.map{ number in
//            return NumberItem(title: "\(number)", value: number)
//        }
//        print(listNumbersStruct)
//
//
//        // filter
//        let listNumberOdds =  list.filter{ number in
//            return number % 2 == 1
//        }
//
//        print(listNumberOdds)
        
        
        /**
         ViewModel
         */
        
        print("Start point...")
	
        let mainViewModel = MainViewModel()
        print("\(mainViewModel.getCount())")
        mainViewModel.increase()
        print("\(mainViewModel.getCount())")
        mainViewModel.add(20)
        print("\(mainViewModel.getCount())")
        
        print("=================================")

        
        
        let person1: Person = Person.Builder()
            .setName("Beyrak")
            .setSurname("Asgarzade")
            .setAge(20)
            .build()
        

        print("Name: \(person1.name)")
        print("Surname: \(person1.surname)")
        print("Age: \(person1.age)")
        
        print("=================================")
        
        let person2: PersonFactory = PersonFactory.build("Beyrak2", "Asgarzade")
        print("Name: \(person2.name)")
        print("Surname: \(person2.surname)")
        print("Age: \(person2.age)")
        
        print("=================================")

        

        
        

                

        
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

    

}
