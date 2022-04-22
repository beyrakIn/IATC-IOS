//
//  ToolBar.swift
//  App
//
//  Created by PC1 on 22.04.22.
//

import UIKit
import SnapKit


class ToolBar : UIView{
    
    
    private lazy var seeAll : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "See All"
        view.textColor = UIColor(red: 0.1, green: 0.71, blue: 0.36, alpha: 1)
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        
        return view
    }()
    
    private lazy var title : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "Recently Booked"
        view.textColor = .black
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        
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
        
        self.backgroundColor = .white

        
        self.snp.makeConstraints { make in
            make.width.equalTo(500)
            make.height.equalTo(60)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(24)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left)

        }
        
        
        title.snp.makeConstraints { make in
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(18)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        seeAll.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).offset(-16)
            make.centerY.equalTo(self.snp.centerY)
        }
        

    }
    
}
