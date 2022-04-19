//
//  HotelCard.swift
//  App
//
//  Created by PC1 on 18.04.22.
//

import Foundation
import UIKit
import SnapKit

class HotelCard  {
    let hotel : Hotel

    init(_ hotel: Hotel) {
        self.hotel = hotel
    }


    func build() -> UIView{
        let view = UIView()
        
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        
        let name = UILabel()
        name.text = hotel.name
        name.textColor = .black
        name.numberOfLines = 1
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        let location = UILabel()
        location.text = hotel.location
        location.textColor = .gray
        location.numberOfLines = 1
        location.font = UIFont.systemFont(ofSize: 13, weight: .regular)

        let rate = UILabel()
        rate.text = String(hotel.rate)
        rate.textColor = .green
        rate.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        let price = UILabel()
        price.text = "$" + String(hotel.price)
        price.textColor = .green
        price.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let period = UILabel()
        period.text = "/night"
        period.textColor = .gray
        period.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        let reviews = UILabel()
        reviews.text = "(" + String(hotel.reviews) + " reviews)"
        reviews.textColor = .gray
        reviews.font = UIFont.systemFont(ofSize: 11, weight: .medium)

        let image = UIImageView(image: UIImage(named: "room"))
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        
        var savedIcon : UIImage = UIImage(named: "saved")!
        if hotel.isSaved{
            savedIcon = UIImage(named: "savedfill")!
        }
        
        let saved = UIImageView(image: savedIcon)
        
        let star = UIImageView(image: UIImage(named: "star"))
        

        view.addSubview(name)
        view.addSubview(location)
        view.addSubview(rate)
        view.addSubview(reviews)
        view.addSubview(image)
        view.addSubview(price)
        view.addSubview(period)
        view.addSubview(star)
        view.addSubview(saved)
        
               
        view.snp.makeConstraints { make in
            make.width.equalTo(500)
            make.height.equalTo(140)
        }
        
        image.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.left.equalTo(view.snp.left).offset(16)
            make.centerY.equalTo(view.snp.centerY)
            
        }
        
        name.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(16)
            make.top.equalTo(view.snp.top).offset(24)
        }
        
        location.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(16)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        rate.snp.makeConstraints { make in
            make.left.equalTo(star.snp.right).offset(4)
            make.bottom.equalTo(view.snp.bottom).offset(-24)
        }
        
        reviews.snp.makeConstraints { make in
            make.left.equalTo(rate.snp.right).offset(16)
            make.centerY.equalTo(rate.snp.centerY)
        }
        
        price.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-16)
            make.top.equalTo(view.snp.top).offset(24)
        }

        period.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).offset(-16)
            make.top.equalTo(price.snp.bottom).offset(4)
        }

               
        reviews.snp.makeConstraints { make in
            make.left.equalTo(rate.snp.right).offset(8)
            make.bottom.equalTo(rate.snp.bottom)
        }

        
        star.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(16)
            make.bottom.equalTo(view.snp.bottom).offset(-24)
            make.centerY.equalTo(rate.snp.centerY)
        }
        
        saved.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.right.equalTo(view.snp.right).offset(-16)
            make.bottom.equalTo(view.snp.bottom).offset(-24)
        }
        
        
        return view
    }


}
