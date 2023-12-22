//
//  CostViewDown.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import UIKit
import SnapKit

class CostViewDown: UIView {
  
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.text = "Заглушка левая"
        label.textColor = AppColor.textExtraInfo
        label.font = AppFont.regular(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = AppColor.textTitle
        label.font = AppFont.regular(ofSize: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var hStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .horizontal
        stack.distribution = .equalCentering
        return stack
    }()
    
    init(leftText: String, colorRightCell: UIColor, boldRightText: Bool){
        super.init(frame: .zero)
        setConstraint()
        leftLabel.text = leftText
        rightLabel.textColor = colorRightCell
        if boldRightText {
            rightLabel.font = UIFont.boldSystemFont(ofSize: 19)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(textRight: String){
//        leftLabel.text = textLeft
        rightLabel.text = textRight
    }
    
    private func setConstraint(){
        backgroundColor = .clear
        [hStackView].forEach(addSubview(_:))
        [leftLabel, rightLabel].forEach(hStackView.addArrangedSubview(_:))
        
        hStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

