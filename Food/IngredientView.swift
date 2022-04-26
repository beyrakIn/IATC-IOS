//
//  IngredientView.swift
//  Food
//
//  Created by PC1 on 25.04.22.
//

import UIKit
import SnapKit

class IngredientView : UICollectionViewCell {
    
    private lazy var image : UIImageView = {
       let view = UIImageView()
        self.contentView.addSubview(view)
        
        return view
    }()
    
    private lazy var name : UILabel = {
       let view = UILabel()
        self.contentView.addSubview(view)
        view.numberOfLines = 1
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        view.textColor = UIColor(red: 0.56, green: 0.56, blue: 0.66, alpha: 1.00)
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

    
    private func setupView(){
        self.contentView.layer.cornerRadius = 16
        self.contentView.clipsToBounds = true
        self.contentView.backgroundColor = .white
        
        self.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(74)
        }
        
        
        self.image.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(12)
        }
        
        self.name.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.image.snp.bottom).offset(10)
        }
    }
    
    func setName(_ name: String){
        self.name.text = name
    }
    
    func setImage(_ image: UIImage){
        self.image.image = image
    }
}
