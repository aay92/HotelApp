//
//  HotelPlusTextCollection.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 18.12.2023.
//

import UIKit
import SnapKit

class HotelPlusTextCollection: UIView {
  
    private let hotelPlusl: UILabel = {
        let label = UILabel()
        label.text = "  "
        label.textColor = AppColor.hotelPlusCollectionText
        label.font = AppFont.regular(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.numberOfLines = 0
        label.backgroundColor = AppColor.hotelPlusCollectionView
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hotelPlus2: UILabel = {
        let label = UILabel()
        label.text = "  "
        label.textColor = AppColor.hotelPlusCollectionText
        label.font = AppFont.regular(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.backgroundColor = AppColor.hotelPlusCollectionView
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            hotelPlusl,
            hotelPlus2
        ])
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.spacing = 10
        stack.backgroundColor = .clear
        return stack
    }()
    
    private let hotelPlus3: UILabel = {
        let label = UILabel()
        label.text = "  "
        label.textColor = AppColor.hotelPlusCollectionText
        label.font = AppFont.regular(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.backgroundColor = AppColor.hotelPlusCollectionView
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hotelPlus4: UILabel = {
        let label = UILabel()
        label.text = "  "
        label.textColor = AppColor.hotelPlusCollectionText
        label.font = AppFont.regular(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.backgroundColor = AppColor.hotelPlusCollectionView
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var hStackView2: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            hotelPlus3,
            hotelPlus4
        ])
        stack.alignment = .leading
        stack.axis = .horizontal
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
    
    func configure(ratingText: String, wifi: String, km: String, aeroport: String){
        hotelPlusl.text = ratingText
        hotelPlus2.text = wifi
        hotelPlus3.text = km
        hotelPlus4.text = aeroport
    }
    
    private func setConstraint(){
        backgroundColor = .clear
        [hStackView, hStackView2].forEach(addSubview(_:))
  
        hStackView.snp.makeConstraints { make in
            make.top.equalTo(snp.top)// Тут какое-то предупреждение
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
        }
        hStackView2.snp.makeConstraints { make in
            make.top.equalTo(hStackView.snp.bottom).offset(-10)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(snp.bottom).offset(-10)
        }
    }
}
