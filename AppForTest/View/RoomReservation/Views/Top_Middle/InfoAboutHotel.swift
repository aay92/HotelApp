//
//  InfoAboutHotel.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//

import UIKit
import SnapKit

class InfoAboutHotel: UIView {
  
    private let fromWhichCityLabel = InfoOrderView(leftText: "Вылет из")
    private let whatСityLabel = InfoOrderView(leftText: "Страна, город")
    private let dataFlingLabel = InfoOrderView(leftText: "Даты")
    private let howNigtsLabel = InfoOrderView(leftText: "Кол-во ночей")
    private let nameHotelLabel = InfoOrderView(leftText: "Отель")
    private let numberHotelLabel = InfoOrderView(leftText: "Номер")
    private let eatsHotelLabel = InfoOrderView(leftText: "Питание")

    
    private lazy var hStackViewRating: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.backgroundColor = AppColor.ratingColorView
        return stack
    }()
    

    init(){
        super.init(frame: .zero)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(fromWhichCity: String,
                   whatСity: String,
                   dataFling: String,
                   howNights: String,
                   nameHotel: String,
                   numberHotel: String,
                   eatsHotel: String){
        fromWhichCityLabel.configure(textRight: fromWhichCity)
        whatСityLabel.configure(textRight: whatСity)
        dataFlingLabel.configure(textRight: dataFling)
        howNigtsLabel.configure(textRight: howNights)
        nameHotelLabel.configure(textRight: nameHotel)
        numberHotelLabel.configure(textRight: numberHotel)
        eatsHotelLabel.configure(textRight: eatsHotel)
    }
    
    private func setConstraint(){
        backgroundColor = .clear
        [fromWhichCityLabel,
         whatСityLabel,
         dataFlingLabel,
         howNigtsLabel,
         nameHotelLabel,
         numberHotelLabel,
         eatsHotelLabel].forEach(addSubview(_:))

        fromWhichCityLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(30)
        }
        
        whatСityLabel.snp.makeConstraints { make in
            make.top.equalTo(fromWhichCityLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(30)
        }
        
        dataFlingLabel.snp.makeConstraints { make in
            make.top.equalTo(whatСityLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(30)
        }
        
        howNigtsLabel.snp.makeConstraints { make in
            make.top.equalTo(dataFlingLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(30)
        }
        
        nameHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(howNigtsLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(50)
        }
        
        numberHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(nameHotelLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(60)
        }

        eatsHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(numberHotelLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(30)
        }
    }
}
