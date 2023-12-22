//
//  CustomFieldPerson.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import UIKit
import SnapKit

class CustomFieldPerson: UIView {
  
    private let namebgView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgTableView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.textColor = AppColor.textExtraInfo
        label.font = AppFont.regular(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameTextField: UITextField = {
        let label = UITextField()
        label.attributedPlaceholder = NSAttributedString(
            string: "Иван",
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
    
    private let lastNamebgView2: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgTableView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Фамилия"
        label.textColor = AppColor.textExtraInfo
        label.font = AppFont.regular(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var lastNameTextField: UITextField = {
        let label = UITextField()
        label.attributedPlaceholder = NSAttributedString(
            string: "Иванов",
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
    
    let dataBirdDayTextField = OneCellTextField(atribut: "Дата рождения")
    let countryDayTextField = OneCellTextField(atribut: "Гражданство")
    let numberPasportTextField = OneCellTextField(atribut: "Номер загранпаспорта")
    let timingPasportDayTextField = OneCellTextField(atribut: "Срок действия загранпаспорта")

    private lazy var nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 5
        stack.backgroundColor = .clear
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var lastNameStackView: UIStackView = {
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
         nameStackView,
         lastNamebgView2,
         lastNameStackView,
         dataBirdDayTextField,
         countryDayTextField,
         numberPasportTextField,
         timingPasportDayTextField
         ].forEach(addSubview(_:))
        
        [nameLabel,
         nameTextField].forEach(nameStackView.addArrangedSubview(_:))
        [lastNameLabel,
         lastNameTextField].forEach(lastNameStackView.addArrangedSubview(_:))
            
        namebgView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(nameStackView.snp.bottom).offset(10)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
        }
        
        lastNamebgView2.snp.makeConstraints { make in
            make.top.equalTo(nameStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(lastNameStackView.snp.bottom).offset(0)
        }
        
        lastNameStackView.snp.makeConstraints { make in
            make.top.equalTo(nameStackView.snp.bottom).offset(25)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
        }
        
        dataBirdDayTextField.snp.makeConstraints { make in
            make.top.equalTo(lastNameStackView.snp.bottom).offset(25)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        countryDayTextField.snp.makeConstraints { make in
            make.top.equalTo(dataBirdDayTextField.snp.bottom).offset(25)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        numberPasportTextField.snp.makeConstraints { make in
            make.top.equalTo(countryDayTextField.snp.bottom).offset(25)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        timingPasportDayTextField.snp.makeConstraints { make in
            make.top.equalTo(numberPasportTextField.snp.bottom).offset(25)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(20)
//            make.width.equalTo(200)
        }
        
        lastNameTextField.snp.makeConstraints { make in
            make.height.equalTo(20)
//            make.width.equalTo(200)
        }
        dataBirdDayTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            //            make.width.equalTo(200)
        }
        countryDayTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            //            make.width.equalTo(200)
        }
        numberPasportTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            //            make.width.equalTo(200)
        }
        timingPasportDayTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            //            make.width.equalTo(200)
        }
    }
}
