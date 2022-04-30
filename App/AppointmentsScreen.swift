//
//  Appointments.swift
//  App
//
//  Created by PC1 on 29.04.22.
//

import UIKit
import SnapKit


class AppointmentScreen : UIView{
    let collectionviewCell = "collectionview_cell"
    var appointments = [
        Appointment(name: "Dr. Mim Akhter1", title: "Depression", time: "09:30 AM", date: "12"),
        Appointment(name: "Dr. Mim Akhter2", title: "Depression", time: "09:30 AM", date: "12"),
        Appointment(name: "Dr. Mim Akhter3", title: "Depression", time: "09:30 AM", date: "12"),
    ]
    
    var colors = [ UIColor.systemRed , UIColor.systemBlue , UIColor.systemGreen ]
    
    
    private lazy var label : UILabel = {
        let view = UILabel()
        self.addSubview(view)
        view.text = "Appointments"
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
        view.text = "Upcoming Appointments"
        view.backgroundColor = .white
        
        view.textColor = UIColor(red: 0.055, green: 0.063, blue: 0.071, alpha: 1)
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.97
        return view
    }()
    
    private lazy var collectionView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: flow)
        self.addSubview(view)
        view.register(AppointmentCell.self, forCellWithReuseIdentifier: collectionviewCell)
        view.delegate = self
        view.dataSource = self
        view.isPagingEnabled = true
        view.contentInset.right = 24
        view.showsHorizontalScrollIndicator = false

        
        return view
    }()
    
    
    private lazy var pageControl : UIPageControl = {
        let view = UIPageControl()
        self.addSubview(view)
        view.currentPageIndicatorTintColor = .systemBlue
        view.numberOfPages = self.appointments.count
        view.pageIndicatorTintColor = .systemGray
        view.currentPage = 0
        view.backgroundStyle = .minimal
        view.addTarget(self, action: #selector(self.onChangePage(_:)), for: .valueChanged)
        
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
        
        self.secondLabel.snp.makeConstraints { make in
            make.top.equalTo(self.label.snp.bottom).offset(24)
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.right).offset(-24)
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.top.equalTo(self.secondLabel.snp.bottom).offset(24)
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.right)
        }
        
        self.pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.collectionView.snp.bottom).offset(16)
        }
        
    }
    
}

extension AppointmentScreen :
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.appointments.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionviewCell, for: indexPath) as! AppointmentCell
        
        cell.setData(appointments[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var index = scrollView.contentOffset.x / 270
        self.pageControl.currentPage = Int(index)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    
    @objc func onChangePage(_ sender: UIPageControl){
        self.collectionView.setContentOffset(CGPoint(x: (sender.currentPage) * 290, y: 0), animated: true)
        
    }
    
}




struct Appointment {
    var name : String
    var title : String
    var time : String
    var date : String
    
}



