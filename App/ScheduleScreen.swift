//
//  ScheduleScreen.swift
//  App
//
//  Created by PC1 on 29.04.22.
//

import UIKit
import SnapKit


class ScheduleScreen : UIView{
    var date : Date? = Date() {
        didSet{
            onDateChange()
        }
    }
    
    
    private lazy var label : UILabel = {
       let view = UILabel()
        self.addSubview(view)
        view.text = "Schedule"
        view.backgroundColor = .white

        view.textColor = UIColor(red: 0.055, green: 0.063, blue: 0.071, alpha: 1)
        view.font = .systemFont(ofSize: 27, weight: .semibold)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.97
        return view
    }()
    
    private lazy var secondLabel : UILabel = {
       let view = UILabel()
        self.addSubview(view)
        view.backgroundColor = .white

        view.textColor = UIColor(red: 0.533, green: 0.533, blue: 0.533, alpha: 1)
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.97
        return view
    }()
    
    
    private lazy var datePicker : UIDatePicker = {
        let view = UIDatePicker.init()
        self.addSubview(view)
        view.datePickerMode = .dateAndTime
        view.preferredDatePickerStyle = .inline
        view.addTarget(self, action: #selector(onDateChanged(_:)), for: .valueChanged)
        
        return view
    }()
    
    
    private lazy var calendar : UIImageView = {
        let view = UIImageView()
        self.addSubview(view)
        view.image = UIImage.init(named: "calendar")
        
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
        
        self.label.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(24)
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.right).offset(-24)
        }
        
        self.calendar.snp.makeConstraints { make in
            make.centerY.equalTo(self.label.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-24)
        }
        
        self.secondLabel.snp.makeConstraints { make in
            make.top.equalTo(self.label.snp.bottom).offset(9)
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.right).offset(-24)
        }
        
        self.datePicker.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.right).offset(-24)
            make.bottom.equalTo(self.snp.bottom).offset(-24)
        }
        
    }
    
    
    @objc func onDateChanged(_ sender: UIDatePicker){
        self.date = sender.date
    }
    
    func onDateChange(){
        let df = DateFormatter()
        df.dateFormat = "dd MMM yyyy"
        
        guard self.date != nil else {
            self.secondLabel.text = df.string(from: Date())
            return
        }
        
    
        self.secondLabel.text = df.string(from: self.date!)
    }
}

