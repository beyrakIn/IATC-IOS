//
//  BottomSheet.swift
//  Food
//
//  Created by PC1 on 26.04.22.
//

import UIKit
import SnapKit

class BottomSheet : UIView {
    
    
    private lazy var addARequest : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "Add a request"
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.textColor = UIColor(red: 0.40, green: 0.40, blue: 0.53, alpha: 1.00)
        return view
    }()
    
    
    private lazy var mainView : UIView = {
        var view = UIView()
        self.addSubview(view)
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.937, alpha: 1).cgColor
        view.clipsToBounds = true
        
        return view
    }()
    
    
    private lazy var label : UITextView = {
        var view = UITextView()
        self.addSubview(view)
        //        view.frame = CGRect(x: 0, y: 0, width: 295, height: 18)
        view.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.663, alpha: 1)
        view.font = UIFont(name: "Mulish-SemiBold", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.02
        
        view.attributedText = NSMutableAttributedString(string: "Ex: Don’t add onion", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return view
    }()
    
    private lazy var limitText : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.frame = CGRect(x: 0, y: 0, width: 33, height: 20)
        view.backgroundColor = .white
        
        view.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.812, alpha: 1)
        view.font = UIFont(name: "Mulish-Regular", size: 12)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.33
    
        
        view.textAlignment = .right
        view.attributedText = NSMutableAttributedString(string: "0/250", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
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
        
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 295).isActive = true
        self.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        
        
        
        self.addARequest.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(16)
            make.left.equalTo(self.snp.left)
        }
        
        self.mainView.snp.makeConstraints { make in
            make.top.equalTo(self.addARequest.snp.bottom).offset(16)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(82)
        }
        
        self.label.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.snp.top).offset(16)
            make.left.equalTo(self.mainView.snp.left).offset(16)
            make.right.equalTo(self.mainView.snp.right).offset(-16)
            make.bottom.equalTo(self.mainView.snp.bottom).offset(-16)
        }
        
        self.limitText.snp.makeConstraints { make in
            make.right.equalTo(self.mainView.snp.right).offset(-12)
            make.bottom.equalTo(self.mainView.snp.bottom).offset(-12)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 327).isActive = true
        self.heightAnchor.constraint(equalToConstant: 82).isActive = true
        self.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        self.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        
    }
}
