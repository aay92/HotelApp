//
//  CostOrderView.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import UIKit
import SnapKit

class CostOrderView: UIView {
        
    private let toor = CostViewDown(
        leftText: "Тур",
        colorRightCell: AppColor.textExtraInfo,
        boldRightText: false)
    
    private let oil = CostViewDown(
        leftText: "Топливный сбор",
        colorRightCell: AppColor.textExtraInfo,
        boldRightText: false)
    
    private let servise = CostViewDown(
        leftText: "Сервисный сбор",
        colorRightCell: AppColor.textExtraInfo,
        boldRightText: false)
    
    private let totalCost = CostViewDown(
        leftText: "К оплате",
        colorRightCell: AppColor.textDescription,
        boldRightText: true)
   
    init(){
        super.init(frame: .zero)
        setConstraint()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(toorText: String,
                   oilText: String,
                   serviseText: String,
                   totalText: String){
        toor.configure(textRight: toorText)
        oil.configure(textRight: oilText)
        servise.configure(textRight: serviseText)
        totalCost.configure(textRight: totalText)
    }
    
    private func setConstraint(){
        backgroundColor = AppColor.bgTableView
        [toor, oil, servise, totalCost].forEach(addSubview(_:))
        
        toor.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        oil.snp.makeConstraints { make in
            make.top.equalTo(toor.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        servise.snp.makeConstraints { make in
            make.top.equalTo(oil.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        totalCost.snp.makeConstraints { make in
            make.top.equalTo(servise.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
            make.bottom.equalTo(snp.bottom).offset(-5)
        }
    }
}
