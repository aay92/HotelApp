//
//  AboutHotelTableViewCell.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 18.12.2023.
//

import UIKit
import SnapKit

class AboutHotelTableViewCell: UITableViewCell {
    
    static let identifier = "AboutHotelTableViewCell"
    
    private let bgView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Удобства"
        label.font = AppFont.regular(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = AppColor.textTitle
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Самое необходимое"
        label.font = AppFont.regular(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = AppColor.textExtraInfo
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let iconImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "photo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackString: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = false
        stackView.axis = .vertical
        stackView.distribution  = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.spacing = 5
        return stackView
    }()
    
    private let stackMain: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = false
        stackView.axis = .horizontal
        stackView.distribution  = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.spacing = 15
        return stackView
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: ItemInTableView){
        iconImage.image = UIImage(named: item.image)?.withRoundedCorners(radius: 15)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        backgroundColor = AppColor.tableView
        layer.cornerRadius = 15
        [nameLabel, descriptionLabel].forEach(stackString.addArrangedSubview(_:))
        addSubview(stackString)
        [iconImage, stackString].forEach(stackMain.addArrangedSubview(_:))
        addSubview(stackMain)
        
        stackMain.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.trailing.equalTo(snp.trailing).offset(-10)
        }
        
        iconImage.snp.makeConstraints { make in
            make.width.equalTo(24)
        }

    }

}

