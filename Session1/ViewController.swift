//
//  ViewController.swift
//  Session1
//
//  Created by PC1 on 09.04.22.
//

import UIKit
import Swift

class ViewController: UIViewController {
    
    // MARK:  UI Components
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Helllo world!"
        label.textColor = .orange
//        label.frame = CGRect.init(x: 40, y: 50, width: 100, height: 20)
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Random.", for: .normal)
        button.backgroundColor = .orange
        button.frame = CGRect.init(x: 40, y: 80, width: 100, height: 35)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(buttonOnClick), for: .allEvents)
        return button
    }()
    
    private var slider: UISlider = {
        let slider = UISlider()
        slider.frame = CGRect.init(x: 40, y: 130, width: 100, height: 35)
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for:  .valueChanged )

        return slider
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        
        stackView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        stackView.backgroundColor = .lightGray
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.frame = CGRect.init(x: 0, y: 40, width: self.view.frame.width, height: self.view.frame.height)

        
        return view
    }()
    
    
    // MARK: Parent Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.view.addSubview(label)
//        self.view.addSubview(button)
//        self.view.addSubview(slider)
        self.view.addSubview(scrollView)
        
        self.scrollView.addSubview(stackView)
        
        self.stackView.addArrangedSubview(self.label)
        self.stackView.addArrangedSubview(self.button)
        self.stackView.addArrangedSubview(self.slider)
//        self.stackView.addArrangedSubview(self.label)
//        self.stackView.addArrangedSubview(self.label)
        
        
    }
    
    // MARK: Click Handlers
    
    @objc func buttonOnClick(){
        let randNum = Int.random(in: 0...100)
        let val: Float = Float(randNum / 100)
        slider.value = val
        label.text = String(randNum)
    }
    
    @objc func sliderChanged(_ slider: UISlider){
        let value: Int = Int(100 * slider.value)
        label.text = String(value)
    }
    
    /*
     UIView
     UIButton
     UILabel
     UIImageView
     UISlider
     UIStackView
     UIScrollView
     
     
     */
    

    

}
