//
//  ViewController.swift
//  App
//
//  Created by PC1 on 29.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    let segments = ["Report", "Appointments", "Schedule"]
    
    
    // MARK: - UI Components
    private lazy var containerView : UIView = {
        let view = UIView()
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var report : ReportScreen = {
        let view = ReportScreen()
        self.containerView.addSubview(view)
        return view
    }()
    
    
    private lazy var appointments : AppointmentScreen = {
        let view = AppointmentScreen()
        self.containerView.addSubview(view)
        return view
    }()
    
    
    private lazy var schedule : ScheduleScreen = {
        let view = ScheduleScreen()
        self.containerView.addSubview(view)
        return view
    }()
    
    private lazy var segmented : UISegmentedControl = {
        let view = UISegmentedControl.init(items: segments)
        self.view.addSubview(view)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(onSegmentChanged(_:)), for: .valueChanged )
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.segmented.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-16)
        }
        
        self.containerView.snp.makeConstraints { make in
            make.top.equalTo(self.segmented.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        fillContainer(with: report)
        
    }
    
    
    // MARK: - Functions
    
    @objc func onSegmentChanged(_ sender: UISegmentedControl ){
        let index = sender.selectedSegmentIndex
        switch index{
        case 0:
            self.fillContainer(with: self.report)
            break
        case 1:
            self.fillContainer(with: self.appointments)
            break
        case 2:
            self.fillContainer(with: self.schedule)
            break
        default:
            break
        }
    }
    
    
    
    private func fillContainer(with view: UIView){
        self.containerView.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
        
        self.containerView.addSubview(view)
        view.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
    }
    
    
    
    
}

