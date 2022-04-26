//
//  RatingView.swift
//  Food
//
//  Created by PC1 on 26.04.22.
//

import UIKit
import SnapKit

class RatingView : UIView {
    
    
    private lazy var rating: UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "⭐ 5.0"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
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
        
        self.backgroundColor = .white
        self.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.937, alpha: 1).cgColor
        self.clipsToBounds = true
        
        self.rating.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.center.equalToSuperview()
        }
        
    }
    
}
