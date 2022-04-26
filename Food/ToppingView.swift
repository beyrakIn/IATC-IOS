//
//  ToppingView.swift
//  Food
//
//  Created by PC1 on 25.04.22.
//

import UIKit
import SnapKit

class ToppingView : UITableViewCell {
    
    private lazy var checkBox : UIView = {
        var view = UILabel()
        self.contentView.addSubview(view)
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.753, green: 0.753, blue: 0.812, alpha: 1).cgColor
        return view
    }()
    
    private lazy var name : UILabel = {
       let view = UILabel()
        self.contentView.addSubview(view)
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        return view
    }()
   
    private lazy var price: UILabel = {
        let view = UILabel()
        self.contentView.addSubview(view)
        view.text = "$10.00"
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        view.textColor = UIColor(red: 1.00, green: 0.48, blue: 0.17, alpha: 1.00)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
 

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 16
        self.contentView.clipsToBounds = true

        self.contentView.snp.makeConstraints { make in
            make.width.equalTo(self.contentView.frame.width + 24)
            make.height.equalTo(48)
        }
        
        self.checkBox.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.left.equalTo(self.snp.left).offset(16)
            make.centerY.equalToSuperview()
            
        }
        
        self.name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalTo(self.checkBox.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
        
        self.price.snp.makeConstraints { make in
            make.centerY.equalTo(self.name.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-16)
        }
        
    }
    
    func setTopping(_ topping: Topping){
        self.name.text = topping.name
        self.price.text = topping.price
    }
    

}
