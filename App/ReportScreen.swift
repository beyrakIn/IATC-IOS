//
//  ReportScreen.swift
//  App
//
//  Created by PC1 on 29.04.22.
//

import UIKit
import SnapKit

class ReportScreen : UIView{
    
    private lazy var label : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "Reports"
        view.backgroundColor = .white
        
        view.textColor = UIColor(red: 0.055, green: 0.063, blue: 0.071, alpha: 1)
        view.font = .systemFont(ofSize: 27, weight: .semibold)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.97
        return view
    }()
    
    
    private lazy var heartView: UIView = {
        let view = UIView()
        self.addSubview(view)
        view.layer.backgroundColor = UIColor(red: 0.863, green: 0.929, blue: 0.976, alpha: 1).cgColor
        view.layer.cornerRadius = 24
        return view
    }()
    
    private lazy var bloodView: ReportCardOne = {
        let view = ReportCardOne()
        self.addSubview(view)
        view.setBg(UIColor(red: 0.961, green: 0.882, blue: 0.914, alpha: 1))
        view.setLabel("Blood Group")
        view.setSymbol("A+")
        return view
    }()
    
    private lazy var weightView:  ReportCardOne = {
        let view = ReportCardOne()
        self.addSubview(view)
        view.setBg(UIColor(red: 0.98, green: 0.941, blue: 0.859, alpha: 1))
        view.setLabel("Weight")
        view.setSymbol("80kg")
        view.setIcon(UIImage.init(named: "Group"))
        return view
    }()
    
    
    private lazy var heartLabel : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "Heart Rate"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        
        return view
    }()
    
    private lazy var chart : UIImageView = {
        let view = UIImageView()
        self.addSubview(view)
        view.image = UIImage.init(named: "chart")
        
        return view
    }()
    
    private lazy var bpm : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "96"
        view.font = .systemFont(ofSize: 48, weight: .regular)
        view.textColor = .darkText
        
        return view
    }()
    
    private lazy var bpm_2 : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "bpm"
        view.font = .systemFont(ofSize: 18, weight: .regular)
        view.textColor = .darkText
        
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView(){
        
        self.label.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(24)
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.right).offset(-24)
        }
        
        self.heartView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(24)
            make.top.equalTo(self.label.snp.bottom).offset(16)
            make.right.equalTo(self.snp.right).offset(-24)
            make.height.equalTo(175)
        }
        
        self.heartLabel.snp.makeConstraints { make in
            make.top.equalTo(self.heartView.snp.top).offset(33)
            make.left.equalTo(self.heartView.snp.left).offset(22)
        }
        
        self.chart.snp.makeConstraints { make in
            make.top.equalTo(self.heartView.snp.top).offset(29)
            make.right.equalTo(self.heartView.snp.right).offset(-20)
            make.width.equalTo(130)
            make.height.equalTo(100)
        }
        
        self.bloodView.snp.makeConstraints { make in
            make.top.equalTo(self.heartView.snp.bottom).offset(16)
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.centerX).offset(-6)
            make.height.equalTo(135)
        }
        
        self.weightView.snp.makeConstraints { make in
            make.top.equalTo(self.bloodView.snp.top)
            make.left.equalTo(self.snp.centerX).offset(6)
            make.right.equalTo(self.snp.right).offset(-24)
            make.height.equalTo(135)
        }
        
        self.bpm.snp.makeConstraints { make in
            make.left.equalTo(self.heartView.snp.left).offset(22)
            make.bottom.equalTo(self.heartView.snp.bottom).offset(-34)
        }
        
        self.bpm_2.snp.makeConstraints { make in
            make.left.equalTo(self.bpm.snp.right)
            make.bottom.equalTo(self.bpm.snp.bottom).offset(-4)
        }
        
    }
    
}
