//
//  InfoAboutUser.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//

import UIKit
import SnapKit

class InfoAboutUser: UIView {
  
    private let infoUser: UILabel = {
        let label = UILabel()
        label.text = "Информация о покупателе"
        label.textColor = AppColor.textTitle
        label.font = AppFont.regular(ofSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let customTextField = CustomTextField()
    
    let insuranceLabel: UILabel = {
        let label = UILabel()
        label.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
        label.textColor = AppColor.textExtraInfo
        label.font = AppFont.regular(ofSize: 16)
//        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(){
        super.init(frame: .zero)
        setConstraint()
//        leftLabel.text = leftText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Высота и ширина autoLayout для определения разных экранов
    private func autoLayout() -> AutoLayout {
        //        print(autoLayout().height) //930
        //        print(autoLayout().width)  //430
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let height = window?.screen.bounds.height ?? 0
        let width = window?.screen.bounds.width ?? 0
        return AutoLayout.init(height: height, width: width)
    }
    
    private func setConstraint(){
        backgroundColor = AppColor.bgView
        layer.cornerRadius = 15
        [infoUser, customTextField, insuranceLabel].forEach(addSubview(_:))
        
        infoUser.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(35)
        }
        
        customTextField.snp.makeConstraints { make in
            make.top.equalTo(infoUser.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(autoLayout().height / 7.7)
        }
        
        insuranceLabel.snp.makeConstraints { make in
            make.top.equalTo(customTextField.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(65)
        }
    }
}
