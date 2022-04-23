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
    lazy var appBar : UIView = {
        let view = AppBar()
        self.view.addSubview(view)
        return view
    }()
    
    lazy var rootScrollView : UIScrollView = {
        let view = UIScrollView()
        self.view.addSubview(view)
        view.addSubview(rootsStackView)
        return view
    }()
    
    
    lazy var rootsStackView : UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 16
        return view
    }()
    
    
    lazy var hello: UILabel = {
        let view = UILabel()
        self.rootsStackView.addArrangedSubview(view)
        view.text = "Hello,  Beyrak👋"
        view.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        return view
    }()
    
    lazy var searchView : UISearchBar = {
        let view = UISearchBar()
        self.rootsStackView.addArrangedSubview(view)
        view.placeholder = "Search"
        view.showsBookmarkButton = true
        return view
    }()
    
    private lazy var categoryScroll: UIScrollView = {
        let view = UIScrollView()
//        self.view.addSubview(view)
        self.rootsStackView.addArrangedSubview(view)
        view.addSubview(categoryStack)
        return view
    }()
    
    private lazy var categoryStack: UIStackView = {
        let view = UIStackView()
//        self.view.addSubview(view)
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 16
        return view
    }()
    
    lazy var horizontalScroll: UIScrollView = {
        let view = UIScrollView()
        view.addSubview(horizontalStack)
//        self.view.addSubview(view)
        self.rootsStackView.addArrangedSubview(view)
        return view
    }()
    
    lazy var horizontalStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 16
        return view
    }()
    
    lazy var toolBar : ToolBar = {
        let view = ToolBar()
//        self.view.addSubview(view)
        self.rootsStackView.addArrangedSubview(view)
        return view
    }()
    
    lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        self.rootsStackView.addArrangedSubview(view)
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
    
    lazy var bottomTabBar : UITabBar = {
       let view = UITabBar()
        
        let tab1 = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: nil)
        let tab2 = UITabBarItem(title: "Search", image: UIImage(named: "search"), selectedImage: nil)
        let tab3 = UITabBarItem(title: "Booking", image: UIImage(named: "document"), selectedImage: nil)
        let tab4 = UITabBarItem(title: "User", image: UIImage(named: "user"), selectedImage: nil)
        var items = [tab1, tab2, tab3, tab4]
        view.items = items
        self.view.addSubview(view)
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
        
        
        // MARK: - VIEWS
        
        let categories = ["Recommended", "Popular", "Trending", "BlaBlaBla"]
        
    
        self.appBar.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
        }
        
        self.rootScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.appBar.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.rootsStackView.snp.makeConstraints { make in
            make.left.equalTo(self.rootScrollView.contentLayoutGuide.snp.left).offset(20)
            make.top.equalTo(self.rootScrollView.contentLayoutGuide.snp.top).offset(20)
            make.bottom.equalTo(self.rootScrollView.contentLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalTo(self.rootScrollView.snp.centerX)
            
        }
        
        self.hello.snp.makeConstraints { make in
            make.left.equalTo(self.rootsStackView.snp.left).offset(16)
            make.top.equalTo(self.rootsStackView.snp.top)
        }
        
        self.searchView.snp.makeConstraints { make in
            make.top.equalTo(self.hello.snp.bottom).offset(16)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            
        }
        
        self.categoryScroll.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.top.equalTo(self.searchView.snp.bottom)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        
        self.categoryStack.snp.makeConstraints { make in
            make.top.equalTo(self.categoryScroll.contentLayoutGuide.snp.top)
            make.left.equalTo(self.categoryScroll.contentLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.categoryScroll.contentLayoutGuide.snp.right)
            make.centerY.equalTo(self.categoryScroll.snp.centerY)
        }
        
        for category in categories {
            let view = CategoryView()
            view.label.text = category
            categoryStack.addArrangedSubview(view)
        }
        
        //MARK: - Horizontal Stack
        
        self.horizontalScroll.snp.makeConstraints { make in
            make.top.equalTo(self.categoryScroll.snp.bottom)
            make.height.equalTo(350)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        
        self.horizontalStack.snp.makeConstraints { make in
            make.top.equalTo(self.horizontalScroll.contentLayoutGuide.snp.top).offset(16)
            make.left.equalTo(self.horizontalScroll.contentLayoutGuide.snp.left).offset(16)
            make.right.equalTo(self.horizontalScroll.contentLayoutGuide.snp.right)
        }
        
   
        
        self.toolBar.snp.makeConstraints { make in
            make.top.equalTo(horizontalScroll.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
        }
        
        scrollView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.top.equalTo(self.toolBar.snp.bottom)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            
        }
        
        self.bottomTabBar.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.height.equalTo(60)
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
        
        
        
        
        let hotels = [ hotel1 , hotel2, hotel3, hotel4, hotel5 ]
        
        for hotel in hotels {
            stackView.addArrangedSubview(hotel)
            let house = HotelCardHorizontal()
            horizontalStack.addArrangedSubview(house)
        }
        
    }
    
    
    
    
}


