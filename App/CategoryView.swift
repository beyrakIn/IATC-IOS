//
//  CategoryView.swift
//  App
//
//  Created by PC1 on 22.04.22.
//

import UIKit
import SnapKit

class CategoryView: UIView{
    var isActive: Bool = false
    
    lazy var label: UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.textAlignment = .center
        view.clipsToBounds = true
        view.textColor = UIColor(red: 0.1, green: 0.71, blue: 0.36, alpha: 1)
        view.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        let tap = UITapGestureRecognizer(target: self, action: #selector(buttonOnClick(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.layer.borderColor = UIColor(red: 0.1, green: 0.71, blue: 0.36, alpha: 1).cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 18
        
        self.label.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.margins.equalTo(8)
            make.center.equalToSuperview()
        }
        
    }
    
    @objc func buttonOnClick(_ btn: UIButton){
        if self.isActive {
            self.backgroundColor = UIColor(red: 0.1, green: 0.71, blue: 0.36, alpha: 1)
            self.label.textColor = .white
        } else{
            self.backgroundColor = .white
            self.label.textColor = UIColor(red: 0.1, green: 0.71, blue: 0.36, alpha: 1)
        }
        isActive = !isActive
        
    }
    
    
    
}
