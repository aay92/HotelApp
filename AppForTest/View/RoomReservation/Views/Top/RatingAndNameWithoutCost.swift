//
//  RatingAndNameWithoutCost.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//

import UIKit
import SnapKit

class RatingAndNameWithoutCost: UIView {
  
    private let viewRatingLabel: UILabel = {
        let label = UILabel()
        label.text = "5 Превосходно "
        label.textColor = AppColor.ratingColorText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageStar: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layoutIfNeeded()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = AppColor.ratingColorText
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var hStackViewRating: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            imageStar,
            viewRatingLabel
        ])
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.spacing = -1
        stack.layer.cornerRadius = 5
        stack.backgroundColor = AppColor.ratingColorView
        return stack
    }()
    
    private var nameHotel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.textTitle
        label.text = ""
        label.font = AppFont.regular(ofSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var hotelAdress: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.textAdress
        label.text = " "
        label.font = AppFont.regular(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(){
        super.init(frame: .zero)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(ratingText: String, hotelName: String, hotelAdressText: String){
        viewRatingLabel.text = ratingText
        nameHotel.text = hotelName
        hotelAdress.text = hotelAdressText
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
        backgroundColor = .clear
        [hStackViewRating, nameHotel, hotelAdress].forEach(addSubview(_:))
        
        imageStar.snp.makeConstraints { make in
            make.top.equalTo(hStackViewRating.snp.top).offset(10)// Тут какое-то предупреждение
            make.trailing.equalTo(viewRatingLabel.snp.trailing).offset(-autoLayout().width / 2.99)
            make.bottom.equalTo(hStackViewRating.snp.bottom).offset(-10)
        }
        
        hStackViewRating.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-autoLayout().width / 1.86)
        }
        
        nameHotel.snp.makeConstraints { make in
            make.top.equalTo(hStackViewRating.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
        
        hotelAdress.snp.makeConstraints { make in
            make.top.equalTo(nameHotel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
        }
    }
}
