//
//  Cell.swift
//  Food
//
//  Created by PC1 on 25.04.22.
//

import UIKit
import SnapKit

class Cell : UIView {
    
    public lazy var name : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.textColor = UIColor(red: 0.23, green: 0.18, blue: 0.47, alpha: 1.00)
        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    public lazy var value : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        view.textColor = UIColor(red: 0.56, green: 0.56, blue: 0.66, alpha: 1.00)
        view.textAlignment = .center
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
        self.name.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        self.value.snp.makeConstraints { make in
            make.top.equalTo(self.name.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }
    }
}
