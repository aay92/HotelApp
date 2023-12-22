//
//  CustomTurist.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import UIKit
import SnapKit

class CustomTurist: UIView {
        
    let firstPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить туриста"
        label.textColor = AppColor.textTitle
        label.font = AppFont.regular(ofSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageArrowStar: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "IconPlus"), for: .normal)
        return button
    }()
   
    init(){
        super.init(frame: .zero)
        setConstraint()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(ratingText: String, adress: String, hotelCosts: String){
//        viewRatingLabel.text = ratingText
//        hotelAdress.text = adress
    }
    
    private func setConstraint(){
        backgroundColor = AppColor.bgView
        [firstPersonLabel, imageArrowStar].forEach(addSubview(_:))
        
        firstPersonLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(imageArrowStar.snp.leading).offset(10)
            make.bottom.equalTo(snp.bottom).offset(-10)
        }
        
        imageArrowStar.snp.makeConstraints { make in
            make.top.equalTo(firstPersonLabel.snp.top)
//            make.leading.equalTo(firstPersonLabel.snp.trailing).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-10)
        }
        
        firstPersonLabel.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        
        imageArrowStar.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
    }
}
