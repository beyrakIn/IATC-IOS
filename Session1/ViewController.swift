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
        
    }

    // Pure functions
    func process() -> String{
        "Hello"
    }

    func processAdd(_ name: String) -> String {
        return "Hello " + name        
    }


}

