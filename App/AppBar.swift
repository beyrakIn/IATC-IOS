//
//  AppBar.swift
//  App
//
//  Created by PC1 on 22.04.22.
//

import UIKit
import SnapKit

class AppBar : UIView{
    private lazy var logo : UIImageView = {
        let view = UIImageView()
        self.addSubview(view)
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 13
        view.clipsToBounds = true
        return view
    }()
    
    
    private lazy var appName : UILabel = {
       let view = UILabel()
        self.addSubview(view)
        view.text = "Helia"
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    
    private lazy var notf :UIImageView = {
        var view = UIImageView()
        self.addSubview(view)
        view.image = UIImage(named: "bell")
        
        return view
    }()
    
    private lazy var save :UIImageView = {
        var view = UIImageView()
        self.addSubview(view)
        view.image = UIImage(named: "saved")
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //common func to init our view
    private func setupView() {
        
        self.logo.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(16)
            make.centerY.equalToSuperview()
        }
        
        self.appName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.logo.snp.right).offset(16)
        }
        
        self.save.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.right.equalTo(self.snp.right).offset(-16)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        
        self.notf.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.right.equalTo(save.snp.left).offset(-16)
            make.centerY.equalTo(self.logo.snp.centerY)

        }
        
    }
    
}
