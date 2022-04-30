//
//  ReportCardOne.swift
//  App
//
//  Created by PC1 on 29.04.22.
//

import UIKit
import SnapKit

class ReportCardOne : UIView {
    private var bgcolor: CGColor?
    
    
    private lazy var card: UIView = {
        let view = UIView()
        self.addSubview(view)
        view.layer.backgroundColor = self.bgcolor
        view.layer.cornerRadius = 24
        return view
    }()
    
    private lazy var icon : UIImageView = {
       let view = UIImageView()
        self.addSubview(view)
        view.image = UIImage.init(named: "Vector")
        
        return view
    }()
    
    private lazy var label : UILabel = {
       let view = UILabel()
        self.addSubview(view)
        view.text = "Blood Group"
        view.font = .systemFont(ofSize: 14, weight: .medium)
        return view
    }()
    
    
    private lazy var dot : UILabel = {
        var view = UILabel()
        self.addSubview(view)
        view.textColor = .gray
        view.font = .systemFont(ofSize: 15, weight: .bold) //UIFont(name: "NunitoSans-Regular", size: 15)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        view.attributedText = NSMutableAttributedString(string: "...", attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        return view
    }()
    
    private lazy var symbol : UILabel = {
       let view = UILabel()
        self.addSubview(view)
        view.textColor = UIColor(red: 0.047, green: 0.067, blue: 0.082, alpha: 1)
        view.font = .systemFont(ofSize: 24, weight: .semibold)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.97

        view.attributedText = NSMutableAttributedString(string: "A+", attributes: [NSAttributedString.Key.kern: 0.28, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
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
        
        self.card.snp.makeConstraints { make in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        self.icon.snp.makeConstraints { make in
            make.width.equalTo(13)
            make.height.equalTo(20)
            make.top.equalTo(self.snp.top).offset(24)
            make.left.equalTo(self.snp.left).offset(24)
        }
        
        self.label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        
        self.dot.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(8)
            make.right.equalTo(self.snp.right).offset(-20)
        }
        
        self.symbol.snp.makeConstraints { make in
            make.left.equalTo(self.label.snp.left)
            make.top.equalTo(self.label.snp.bottom).offset(4)
        }
        
        
        
    }
    
    public func setBg(_ color : UIColor){
        self.card.backgroundColor = color
    }
    
    public func setLabel(_ label : String){
        self.label.text = label
    }
    
    public func setSymbol(_ symbol : String){
        self.symbol.text = symbol
    }
    
    public func setIcon(_ icon: UIImage?){
        self.icon.image = icon
    }
}
