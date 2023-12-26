//
//  OrderPaidView.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import UIKit

class OrderPaidView: UIViewController {

    weak var orderPaidViewCoordinator: OrderPaidViewCoordinator?
    
    let successfulOrderImage: UIImageView = {
        let button = UIImageView()
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = UIImage(named: "successful")
        return button
    }()
    
    private let yourOrderInWorkLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ принят в работу"
        label.textColor = AppColor.textTitle
        label.font = AppFont.regular(ofSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let orderConfirmedLabel: UILabel = {
        let label = UILabel()
        label.text = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
        label.textColor = AppColor.textTitle
        label.font = AppFont.regular(ofSize: 17)
//        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    ///Rating, cost and name view
    private let bgView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var vStackView: UIStackView = {
        let stack = UIStackView()
//        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 20
        stack.backgroundColor = .clear
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let superButton: UIButton = {
        let button = UIButton()
        button.setTitle("Супер!", for: .normal)
        button.titleLabel?.font = AppFont.regular(ofSize: 16)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColor.ColorButton
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigView()
        setConstraint()
    }
   
    @objc func tappedButton(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setConfigView(){
        title = "Заказ оплачен"
        view.backgroundColor = AppColor.bgView
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    ///Высота и ширина autoLayout для определения разных экранов
    private func autoLayout() -> AutoLayout {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let height = window?.screen.bounds.height ?? 0
        let width = window?.screen.bounds.width ?? 0
        return AutoLayout.init(height: height, width: width)
    }
    
    private func setConstraint(){
        view.addSubview(vStackView)
        view.addSubview(superButton)
        
        [successfulOrderImage,
         yourOrderInWorkLabel,
         orderConfirmedLabel].forEach(vStackView.addArrangedSubview(_:))

        vStackView.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.centerY)
            make.leading.equalTo(view.snp.leading).offset(25)
            make.trailing.equalTo(view.snp.trailing).offset(-25)
            make.height.equalTo(autoLayout().height / 3.45)
        }
        
        superButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(10)
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.bottom.equalTo(view.snp.bottom).offset(-40)
            make.height.equalTo(autoLayout().height / 18)
        }
        
        yourOrderInWorkLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        orderConfirmedLabel.snp.makeConstraints { make in
            make.height.equalTo(autoLayout().height / 5.46)
        }
        
        successfulOrderImage.snp.makeConstraints { make in
            make.height.equalTo(autoLayout().height / 9.9)
        }
    }
}
