//
//  FirstPersonView.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import UIKit
import SnapKit

class FirstPersonView: UIView {
        
    let firstPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Первый турист"
        label.textColor = AppColor.textTitle
        label.font = AppFont.regular(ofSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageArrowStar: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "IconUp"), for: .normal)
        return button
    }()

    private let customFieldPerson = CustomFieldPerson()
   
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
    
    func hiddenObjects(needHidden: Bool){
        if needHidden {
            imageArrowStar.setImage(UIImage(named: "IconDown"), for: .normal)
            customFieldPerson.isHidden = true
        } else {
            imageArrowStar.setImage(UIImage(named: "IconUp"), for: .normal)
            customFieldPerson.isHidden = false
        }
    }
    
    private func setConstraint(){
        backgroundColor = AppColor.bgView
        [firstPersonLabel, imageArrowStar, customFieldPerson].forEach(addSubview(_:))
        
        firstPersonLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(16)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(imageArrowStar.snp.leading).offset(10)
        }
        
        imageArrowStar.snp.makeConstraints { make in
            make.top.equalTo(firstPersonLabel.snp.top)
            make.trailing.equalTo(snp.trailing).offset(-10)
        }
        
        customFieldPerson.snp.makeConstraints { make in
            make.top.equalTo(firstPersonLabel.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.bottom.equalTo(snp.bottom).offset(-10)
        }
        
        firstPersonLabel.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        
        imageArrowStar.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
    }
}
