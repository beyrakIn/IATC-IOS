//
//  HotelCardHorizontal.swift
//  App
//
//  Created by PC1 on 22.04.22.
//

import UIKit
import SnapKit

class HotelCardHorizontal : UIView{
//    var hotel : Hotel
    
    private lazy var image : UIImageView = {
        let view = UIImageView()
        self.addSubview(view)
        view.image = UIImage.init(named: "room")
        view.backgroundColor = .brown
        view.clipsToBounds = true
        view.layer.cornerRadius = 32
        return view
    }()
    
    private lazy var name: UILabel = {
        var view = UILabel()
        self.addSubview(view)
        view.text = "Emeralda Da Hotel"
        view.textColor = .white
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return view
    }()

    
    private lazy var location: UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "Paris, Franch"
        view.textColor = .white
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return view

    }()
    

    
    private lazy var rating: UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "⭐" + "4.9"
        view.textColor = .white
        view.numberOfLines = 1
        view.layer.cornerRadius = 16
        view.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return view

    }()
    
    
    private lazy var price: UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "$" + String(29)
        view.textColor = .white
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view

    }()
    
    private lazy var period: UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "/ night"
        view.textColor = .white
        view.numberOfLines = 1
        view.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return view

    }()
    
    private lazy var bookmark : UIImageView = {
        let view = UIImageView()
        self.addSubview(view)
        view.image = UIImage.init(named: "bmark")
        view.tintColor = .white
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
        
        self.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(318)
        }
        
        self.image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.rating.snp.makeConstraints { make in
            make.top.equalTo(self.image.snp.top).offset(24)
            make.right.equalTo(self.image.snp.right).offset(-24)
        }

        
        self.price.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-24)
            make.left.equalTo(self.snp.left).offset(24)
        }
        
        self.period.snp.makeConstraints { make in
            make.left.equalTo(self.price.snp.right).offset(4)
            make.bottom.equalTo(self.price.snp.bottom)
        }
        
        self.bookmark.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.bottom.equalTo(self.price.snp.bottom)
            make.right.equalTo(self.rating.snp.right)
        }
        
        self.location.snp.makeConstraints { make in
            make.bottom.equalTo(self.price.snp.top).offset(-8)
            make.left.equalTo(self.price.snp.left)
        }
        
        self.name.snp.makeConstraints { make in
            make.bottom.equalTo(self.location.snp.top).offset(-12)
            make.left.equalTo(self.price.snp.left)
        }
    }
    
}
