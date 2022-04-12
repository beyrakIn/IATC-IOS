//
//  ViewController.swift
//  Session1
//
//  Created by PC1 on 09.04.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        printFriendName("Beyrak")
        printNameAndAddress("Beyrak", "Baku")
        
        let randNumber = getRandomNumber(10, 20)
        if randNumber % 4 == 0{
          print(randNumber)
        }

        let randNumber2 = getRandomNumber(0, 100)
        
        if randNumber2 < 22 {
            print("\(randNumber2) smaller than 22.")
        }else{
            print("\(randNumber2) bigger than 22.")
        }
        
        print("Reminder is \(randNumber2 % 2)")
        let x = getRandomNumber(0, 100)
        let y = getRandomNumber(0, 100)
        let z = getRandomNumber(0, 100)
        print("Sum of three random number is \(sum(x, y, z))")
        

    }

    func printFriendName(_ name: String) {
        print("My friend's name is \(name)")
    }
    
    func printNameAndAddress(_ name: String,_ address: String) {
        print("Name is \(name)")
        print("Address is \(address)")
    }

    func getRandomNumber(_ min: Int, _ max: Int) -> Int {
        return Int.random(in: min..<max)
    }
    
    func sum(_ x:Int, _ y:Int,_ z:Int) -> Int{
        x + y + z
    }

}

