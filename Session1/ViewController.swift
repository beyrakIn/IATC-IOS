//
//  ViewController.swift
//  Session1
//
//  Created by PC1 on 09.04.22.
//

import UIKit
import Swift

class ViewController: UIViewController {
    
    private lazy var label: UILabel = {
        var label = UILabel()
        label.text = "Helllo world!"
        label.textColor = .orange
        label.frame = CGRect.init(x: 40, y: 50, width: 100, height: 20)
        return label
    }()
    
    private lazy var button: UIButton = {
        var button = UIButton()
        button.setTitle("Random.", for: .normal)
        button.backgroundColor = .orange
        button.frame = CGRect.init(x: 40, y: 80, width: 100, height: 35)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(buttonOnClick), for: .allEvents)
        return button
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.addSubview(label)
        self.view.addSubview(button)
        
        
    }
    
    @objc func buttonOnClick(){
        let randNum = Int.random(in: 0...100)
        label.text = String(randNum)
    }
    

    

}
