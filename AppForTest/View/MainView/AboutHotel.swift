//
//  AboutHotel.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 18.12.2023.
//

import UIKit
import SnapKit

class AboutHotel: UIView {
    
    private let titleAboutHotel: UILabel = {
        let label = UILabel()
        label.text = "Об отеле"
        label.textColor = AppColor.textTitle
        label.font = AppFont.regular(ofSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hotelPlusTextCollection = HotelPlusTextCollection()

    private var AboutHotelDescription: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.textTitle
        label.text = " "
        label.font = AppFont.regular(ofSize: 16).withSize(19)
//        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            titleAboutHotel,
            hotelPlusTextCollection,
            AboutHotelDescription
        ])
        stack.alignment = .leading
        stack.axis = .vertical
        stack.spacing = 10
        stack.backgroundColor = .clear
        return stack
    }()

    init(){
        super.init(frame: .zero)
        setConstraint()
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(hotelDescription: String, ratingText: String, wifi: String, km: String, aeroport: String ){
        AboutHotelDescription.text = hotelDescription
        hotelPlusTextCollection.configure(
            ratingText: ratingText,
            wifi: wifi,
            km: km,
            aeroport: aeroport)
    }
    
    private func setConstraint(){
        backgroundColor = .clear
        [hStackView].forEach(addSubview(_:))
  
        hStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(snp.bottom).offset(-10)
        }
    }
}
