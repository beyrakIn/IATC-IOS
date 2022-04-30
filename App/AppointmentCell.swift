//
//  AppointmentCell.swift
//  App
//
//  Created by PC1 on 29.04.22.
//

import UIKit
import SnapKit

class AppointmentCell: UICollectionViewCell {

    
    private lazy var card : UIView = {
        let view = UIView()
        self.contentView.addSubview(view)
        view.frame = CGRect(x: 0, y: 0, width: 282, height: 120.73)
        view.backgroundColor = .white

        view.layer.backgroundColor = UIColor(red: 0.11, green: 0.42, blue: 0.643, alpha: 1).cgColor
        view.layer.cornerRadius = 28
        return view

    }()
    
    private lazy var dateBg : UIView = {
        let view = UIView()
        self.contentView.addSubview(view)
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.14).cgColor
        view.layer.cornerRadius = 26
        return view
    }()
    
    private lazy var name : UILabel = {
        var view = UILabel()
        self.contentView.addSubview(view)
        view.frame = CGRect(x: 0, y: 0, width: 138, height: 26)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = .systemFont(ofSize: 19, weight: .semibold) //UIFont(name: "NunitoSans-Bold", size: 19)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99

        view.attributedText = NSMutableAttributedString(string: "Dr. Mim Akhter", attributes: [NSAttributedString.Key.kern: 0.19, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return view
    }()
    
    private lazy var time : UILabel = {
        var view = UILabel()
        self.contentView.addSubview(view)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular) //UIFont(name: "NunitoSans-Regular", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        view.attributedText = NSMutableAttributedString(string: "09:30 AM", attributes: [NSAttributedString.Key.kern: 0.14, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        return view
    }()
    
    private lazy var desc : UILabel = {
        var view = UILabel()
        self.contentView.addSubview(view)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.65)
        view.font = .systemFont(ofSize: 15, weight: .regular) //UIFont(name: "NunitoSans-Regular", size: 15)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        view.attributedText = NSMutableAttributedString(string: "Depression", attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        return view
    }()
    
    
    private lazy var dot : UILabel = {
        var view = UILabel()
        self.contentView.addSubview(view)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.65)
        view.font = .systemFont(ofSize: 15, weight: .bold) //UIFont(name: "NunitoSans-Regular", size: 15)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        view.attributedText = NSMutableAttributedString(string: "...", attributes: [NSAttributedString.Key.kern: 0.15, NSAttributedString.Key.paragraphStyle: paragraphStyle])

        return view
    }()
    
    
    private lazy var date : UILabel = {
        var view = UILabel()
        self.contentView.addSubview(view)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.font = .systemFont(ofSize: 22, weight: .black) //UIFont(name: "NunitoSans-ExtraBold", size: 22)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        view.attributedText = NSMutableAttributedString(string: "12\nTue", attributes: [NSAttributedString.Key.kern: 0.22, NSAttributedString.Key.paragraphStyle: paragraphStyle])
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
//            make.width.height.equalTo(50)
        }
        
        self.dateBg.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(10)
            make.left.equalTo(self.contentView.snp.left).offset(13)
            make.width.equalTo(71)
            make.height.equalTo(99)
        }

        self.name.snp.makeConstraints { make in
            make.left.equalTo(self.dateBg.snp.right).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.centerY.equalToSuperview()
        }
        
        self.time.snp.makeConstraints { make in
            make.left.equalTo(self.name.snp.left)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.name.snp.top)
        }
        
        self.desc.snp.makeConstraints { make in
            make.left.equalTo(self.name.snp.left)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.top.equalTo(self.name.snp.bottom)
        }
        
        
        self.date.snp.makeConstraints { make in
            make.center.equalTo(self.dateBg.snp.center)
        }
        
        self.dot.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.top).offset(8)
            make.right.equalTo(self.contentView.snp.right).offset(-20)
        }
    }
    
    public func setData(_ appointment : Appointment){
        self.name.text = appointment.name
    }
}
