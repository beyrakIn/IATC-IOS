//
//  ViewController.swift
//  App
//
//  Created by PC1 on 18.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
    
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 16
        
        return view
    }()
    
    // MARK: - Parent Delegates

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presidentHotel : Hotel = Hotel.Builder()
            .setName("President hotel")
            .setLocation("Paris, France")
            .setRate(4.8)
            .setReviews(4378)
            .setImage("")
            .setPrice(35)
            .setIsSaved(false)
            .build()
        
        let palmsCasino : Hotel = Hotel.Builder()
            .setName("Palms Casino")
            .setLocation("Paris, France")
            .setRate(4.8)
            .setReviews(4378)
            .setImage("")
            .setPrice(35)
            .setIsSaved(true)
            .build()
        
        let palazzoVersace : Hotel = Hotel.Builder()
            .setName("Palazzo Versace")
            .setLocation("Paris, France")
            .setRate(4.8)
            .setReviews(4378)
            .setImage("")
            .setPrice(35)
            .setIsSaved(true)
            .build()
        
        let bulgariResort : Hotel = Hotel.Builder()
            .setName("Bulgari Resort")
            .setLocation("Paris, France")
            .setRate(4.8)
            .setReviews(4378)
            .setImage("")
            .setPrice(35)
            .setIsSaved(false)
            .build()
        
        let martinezCannes : Hotel = Hotel.Builder()
            .setName("Martinez Cannes")
            .setLocation("Paris, France")
            .setRate(4.8)
            .setReviews(4378)
            .setImage("")
            .setPrice(35)
            .setIsSaved(true)
            .build()
        
        
        self.view.addSubview(self.scrollView)

        scrollView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        
        }
        
        self.scrollView.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.left.equalTo(self.scrollView.contentLayoutGuide.snp.left).offset(20)
            make.top.equalTo(self.scrollView.contentLayoutGuide.snp.top).offset(20)
            make.bottom.equalTo(self.scrollView.contentLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalTo(self.scrollView.snp.centerX)
        
        }
        
        
        let hotel1 = HotelCard(presidentHotel).build()
        let hotel2 = HotelCard(palmsCasino).build()
        let hotel3 = HotelCard(palazzoVersace).build()
        let hotel4 = HotelCard(bulgariResort).build()
        let hotel5 = HotelCard(martinezCannes).build()
        
        stackView.addArrangedSubview(appBar())

        
        let hotels = [ hotel1 , hotel2, hotel3, hotel4, hotel5 ]
        
        for hotel in hotels {
            stackView.addArrangedSubview(hotel)
        }

    }
    
    func appBar() -> UIView{
        let view = UIView()
        
        let back = UIImageView(image: UIImage(named: "arrow-left"))
        let apps = UIImageView(image: UIImage(named: "apps"))
        let menu = UIImageView(image: UIImage(named: "doc"))
        
        let title = UILabel()
        title.text = "Recently Booked"
        title.textColor = .black
        title.numberOfLines = 1
        title.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        view.addSubview(back)
        view.addSubview(title)
        view.addSubview(apps)
        view.addSubview(menu)
        
        view.snp.makeConstraints { make in
            make.width.equalTo(500)
            make.height.equalTo(40)
        }

        back.snp.makeConstraints { make in
            make.width.height.equalTo(18)
            make.left.equalTo(view.snp.left).offset(16)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalTo(back.snp.right).offset(18)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        apps.snp.makeConstraints { make in
            make.width.height.equalTo(18)
            make.right.equalTo(view.snp.right).offset(-16)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        menu.snp.makeConstraints { make in
            make.width.height.equalTo(18)
            make.right.equalTo(apps.snp.left).offset(-16)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        
        
        return view
    }
    



}


