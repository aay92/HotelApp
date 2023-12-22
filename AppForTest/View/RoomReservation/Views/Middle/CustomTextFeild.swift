//
//  CustomTextField.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//

import UIKit
import SnapKit

class CustomTextField: UIView {
  
    private let bgView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgTableView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.textColor = AppColor.textExtraInfo
        label.font = AppFont.regular(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var phoneTextField: UITextField = {
        let label = UITextField()
        label.attributedPlaceholder = NSAttributedString(
            string: "+7 (XXX) XXX-XXXX",
            attributes: [NSAttributedString.Key.foregroundColor: AppColor.textTitle]
        )
        label.font = AppFont.regular(ofSize: 19)
        label.textColor = AppColor.textTitle
        label.keyboardType = .numberPad
        label.textAlignment = .left
        label.tintColor = AppColor.textTitle
        label.backgroundColor = .clear
        label.layer.cornerRadius = 10
        return label
    }()
    
    private let bgView2: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgTableView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Почта"
        label.textColor = AppColor.textExtraInfo
        label.font = AppFont.regular(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailTextField: UITextField = {
        let label = UITextField()
        label.attributedPlaceholder = NSAttributedString(
            string: "examplemail.000@mail.ru",
            attributes: [NSAttributedString.Key.foregroundColor: AppColor.textTitle]
        )
        label.font = AppFont.regular(ofSize: 19)
        label.textColor = AppColor.textTitle
        label.keyboardType = .numberPad
        label.textAlignment = .left
        label.tintColor = AppColor.textTitle
        label.backgroundColor = .clear
        label.layer.cornerRadius = 10
        return label
    }()
    

    private lazy var phoneStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 5
        stack.backgroundColor = .clear
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 5
        stack.backgroundColor = .clear
        stack.distribution = .fillProportionally
        return stack
    }()
    
    init(){
        super.init(frame: .zero)
        setConstraint()
        print(phoneTextField.text)
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
        [bgView, phoneStackView, bgView2, emailStackView].forEach(addSubview(_:))
        [phoneLabel, phoneTextField].forEach(phoneStackView.addArrangedSubview(_:))
        [emailLabel, emailTextField].forEach(emailStackView.addArrangedSubview(_:))

        bgView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(phoneStackView.snp.bottom).offset(10)
        }
        
        phoneStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
        }
        
        bgView2.snp.makeConstraints { make in
            make.top.equalTo(phoneStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(emailStackView.snp.bottom).offset(0)
        }
        
        emailStackView.snp.makeConstraints { make in
            make.top.equalTo(phoneStackView.snp.bottom).offset(25)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
//            make.bottom.equalTo(snp.bottom)
        }
        
        phoneTextField.snp.makeConstraints { make in
            make.height.equalTo(20)
//            make.width.equalTo(200)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
//            make.width.equalTo(200)
        }
    }
}
