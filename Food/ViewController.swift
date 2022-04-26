//
//  ViewController.swift
//  Food
//
//  Created by PC1 on 25.04.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // MARK: - Variables
    let ingredientsCell = "ingredients_cell"
    let tableViewCell = "table_view_cell"
    let desc: String = "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast.You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast."
    
    let cells = [
        CellItem(name: "400", value: "kcal"),
        CellItem(name: "510", value: "grams"),
        CellItem(name: "30", value: "proteins"),
        CellItem(name: "56", value: "carbs"),
        CellItem(name: "24", value: "fats")
    ]
    
    
    let ingredients = [
        ingredient(name: "Egg", image: UIImage(named: "egg")!),
        ingredient(name: "Avocado", image: UIImage(named: "avocado")!),
        ingredient(name: "Spinach", image: UIImage(named: "salad")!),
        ingredient(name: "Egg", image: UIImage(named: "egg")!),
        ingredient(name: "Egg", image: UIImage(named: "egg")!),
        ingredient(name: "Avocado", image: UIImage(named: "avocado")!),
        ingredient(name: "Spinach", image: UIImage(named: "salad")!),
        ingredient(name: "Egg", image: UIImage(named: "egg")!),
        ingredient(name: "Egg", image: UIImage(named: "egg")!),
        ingredient(name: "Avocado", image: UIImage(named: "avocado")!),
        ingredient(name: "Spinach", image: UIImage(named: "salad")!),
        ingredient(name: "Egg", image: UIImage(named: "egg")!),
        ingredient(name: "Egg", image: UIImage(named: "egg")!),
        ingredient(name: "Avocado", image: UIImage(named: "avocado")!),
        ingredient(name: "Spinach", image: UIImage(named: "salad")!),
        ingredient(name: "Egg", image: UIImage(named: "egg")!),

    ]
    
    let toppings = [
        Topping(name: "Extra Eggs", price: "$1.00"),
        Topping(name: "Extra Spinach", price: "$3.25"),
        Topping(name: "Extra Avocado", price: "$1.63"),
        Topping(name: "Extra Apple", price: "$0.89"),
        Topping(name: "Extra Pepper", price: "$9.01"),
        Topping(name: "Extra Pepper", price: "$9.01"),
        Topping(name: "Extra Olives", price: "$1.03"),
        Topping(name: "Extra Cucumber", price: "$4.02"),
    ]
    
    
    // MARK: - UI Components
    
    private lazy var rootScrollView: UIScrollView = {
        let view = UIScrollView()
        self.view.addSubview(view)
        view.backgroundColor = .systemGray6
        return view
    }()
    

    
    private lazy var sandwich : UIImageView = {
        let view = UIImageView()
        self.rootScrollView.addSubview(view)
        view.image = UIImage(named: "sandwich")
        return view
    }()
    
    
    private lazy var rating: RatingView = {
        let view = RatingView()
        self.rootScrollView.addSubview(view)
  
        return view
    }()
    
    
    private lazy var foodName: UILabel = {
        let view = UILabel()
        self.rootScrollView.addSubview(view)
        view.text = "Avocado and\nEgg Toast"
        view.numberOfLines = 2
        view.font = UIFont(name: "Mulish-ExtraBold", size: 14)
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.textColor = UIColor(red: 0.20, green: 0.20, blue: 0.30, alpha: 1.00)
        return view
    }()
    
    private lazy var foodPrice: UILabel = {
        let view = UILabel()
        self.rootScrollView.addSubview(view)
        view.text = "$10.00"
        view.numberOfLines = 1
        view.font = UIFont(name: "Mulish-Bold", size: 14)
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.textColor = UIColor(red: 1.00, green: 0.48, blue: 0.17, alpha: 1.00)
        return view
    }()
    
    private lazy var foodDesc: UILabel = {
        let view = UILabel()
        self.rootScrollView.addSubview(view)
        view.text = self.desc
        view.numberOfLines = 1
        view.font = UIFont(name: "Mulish-Regular", size: 14)
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.56, green: 0.56, blue: 0.66, alpha: 1.00)
        return view
    }()
    
    private lazy var horizontalStack : UIStackView = {
        let view = UIStackView()
        self.rootScrollView.addSubview(view)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 16
        view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.00)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var ingredientsLabel : UILabel = {
       let view = UILabel()
        self.rootScrollView.addSubview(view)
        view.text = "Ingredients"
        view.font = UIFont(name: "Mulish-SemiBold", size: 14)

        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor(red: 0.40, green: 0.40, blue: 0.53, alpha: 1.00)
        return view
    }()
    
    private lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        self.rootScrollView.addSubview(view)
        
        view.register(IngredientView.self, forCellWithReuseIdentifier: ingredientsCell)
        view.delegate = self
        view.dataSource = self
        view.contentInset.right = 24
        view.backgroundColor = .systemGray6
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    
    private lazy var addToppings : UILabel = {
       let view = UILabel()
        self.rootScrollView.addSubview(view)
        view.text = "Add toppings"
        view.font = UIFont(name: "Mulish-SemiBold", size: 14)

        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor(red: 0.40, green: 0.40, blue: 0.53, alpha: 1.00)
        return view
    }()
    
    private lazy var tableView: UITableView = {
       let view = UITableView()
        self.rootScrollView.addSubview(view)
        view.dataSource = self
        view.delegate = self
        view.register(ToppingView.self, forCellReuseIdentifier: tableViewCell)
        view.separatorStyle = .none
        view.backgroundColor = .systemGray6
        return view
    }()
    
    
    private lazy var bottomView: BottomSheet = {
       let view = BottomSheet()
        self.rootScrollView.addSubview(view)
        
        
        return view
    }()
    
    
    
    // MARK: - Parent Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray6
        
        self.rootScrollView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
        self.sandwich.snp.makeConstraints { make in
            make.width.height.equalTo(170)
            make.top.equalTo(self.rootScrollView.snp.top).offset(42)
            make.centerX.equalToSuperview()
        }
        
        self.rating.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.top.equalTo(self.rootScrollView.snp.top).offset(50)
            make.left.equalTo(self.sandwich.snp.right).offset(19)
        }
        
        self.foodName.snp.makeConstraints { make in
            make.top.equalTo(self.sandwich.snp.bottom).offset(73)
            make.left.equalTo(self.rootScrollView.snp.left).offset(24)
        }
        
        self.foodPrice.snp.makeConstraints { make in
            make.centerY.equalTo(self.foodName.snp.centerY)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
        }
        
        self.foodDesc.snp.makeConstraints { make in
            make.top.equalTo(self.foodName.snp.bottom).offset(12)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
        }
        
        self.horizontalStack.snp.makeConstraints { make in
            make.top.equalTo(self.foodDesc.snp.bottom).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
            make.height.equalTo(58)
        }
        

        
        self.cells.forEach { CellItem in
            let cell = Cell()
            cell.name.text = CellItem.name
            cell.value.text = CellItem.value
            
            self.horizontalStack.addArrangedSubview(cell)
        }
        
        self.ingredientsLabel.snp.makeConstraints { make in
            make.top.equalTo(self.horizontalStack.snp.bottom).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.height.equalTo(74)
            make.top.equalTo(self.ingredientsLabel.snp.bottom).offset(12)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
        }
        
        self.addToppings.snp.makeConstraints { make in
            make.top.equalTo(self.collectionView.snp.bottom).offset(30)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
        }
        
        self.tableView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 48)
            make.height.equalTo(480)
            make.top.equalTo(self.addToppings.snp.bottom).offset(12)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)

        }


        self.bottomView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left).offset(24)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right).offset(-24)
            make.top.equalTo(self.tableView.snp.bottom).offset(8)
            make.bottom.equalTo(self.rootScrollView.contentLayoutGuide.snp.bottom).offset(-64)

        }
        
        
    }
    

    
 
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.ingredients.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.ingredientsCell, for:  indexPath) as! IngredientView
        
        let ingredient = self.ingredients[indexPath.row]
        cell.setName(ingredient.name)
        print(ingredient.image)
        cell.setImage(ingredient.image)

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 92, height: 74)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        self.toppings.count
    }

    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: self.tableViewCell, for: indexPath) as! ToppingView
        
        let item = self.toppings[indexPath.row]
        cell.setTopping(item)
        cell.layer.cornerRadius = 16
        cell.clipsToBounds = true
        cell.backgroundColor = .systemGray6
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
        
}



// MARK: - Structs

struct CellItem {
    var name : String
    var value : String
}

struct ingredient {
    var name : String
    var image : UIImage
}

struct Topping {
    var name : String
    var price : String
}
