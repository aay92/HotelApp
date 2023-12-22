//
//  OneCellTextField.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import UIKit
import SnapKit

class OneCellTextField: UIView {
  
    private let namebgView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgTableView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var nameTextField: UITextField = {
        let label = UITextField()
        label.placeholder = "Заглушка"
        label.font = AppFont.regular(ofSize: 19)
        label.textColor = AppColor.textExtraInfo
        label.keyboardType = .numberPad
        label.textAlignment = .left
        label.tintColor = AppColor.textTitle
        label.backgroundColor = .clear
        label.layer.cornerRadius = 10
        return label
    }()
        
    init(atribut: String){
        super.init(frame: .zero)
        setConstraint()
        nameTextField.text = "\(atribut)"
//        leftLabel.text = leftText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(textRight: String){
//        leftLabel.text = textLeft
//        rightLabel.text = textRight
    }
    
    private func setConstraint(){
        backgroundColor = .clear
        [namebgView,
         nameTextField].forEach(addSubview(_:))
      
        namebgView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(namebgView.snp.top).offset(5)
            make.leading.equalTo(namebgView.snp.leading).offset(5)
            make.trailing.equalTo(namebgView.snp.trailing).offset(-5)
            make.bottom.equalTo(namebgView.snp.bottom).offset(-5)
        }
    }
}
