//
//  ChooseApartmentViewCell.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//

import UIKit
import SnapKit

class ChooseApartmentViewCell: UITableViewCell {
    
    static let identifier = "ChooseApartmentViewCell"
    
    var customCollectionCell: [String] = []

    private let bgView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var collectionView2: UICollectionView!
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = AppFont.regular(ofSize: 22)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = AppColor.textTitle
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var plusLabel_1: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = AppFont.regular(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = AppColor.textExtraInfo
        label.textAlignment = .left
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.backgroundColor = AppColor.hotelPlusCollectionView
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var plusLabel_2: UILabel = {
        let label = UILabel()
        label.text = " "
        label.font = AppFont.regular(ofSize: 14)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = AppColor.textExtraInfo
        label.textAlignment = .left
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.layer.cornerRadius = 5
        label.backgroundColor = AppColor.hotelPlusCollectionView
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackPlus: UIStackView = {
        let stackView = UIStackView()
        stackView.clipsToBounds = false
        stackView.axis = .horizontal
        stackView.distribution  = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.spacing = 5
        return stackView
    }()
    
    private var hotelCost: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.textCost
        label.text = " ₽"
        label.font = AppFont.regular(ofSize: 39)
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var hotelCostTextExtraInfo: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.textExtraInfo
        label.text = "за 7 ночей с перелётом"
        label.font = AppFont.regular(ofSize: 16)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let stackCost: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution  = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        stackView.spacing = -35
        return stackView
    }()
    
    private let buttonDetailed: UIButton = {
        let button = UIButton()
        button.setTitle("Подробнее о номере", for: .normal)
        button.titleLabel?.font = AppFont.regular(ofSize: 16)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .left
        button.setTitleColor(AppColor.ColorButton, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColor.colorButtonDetailed
        button.setImage(UIImage(named: "arrow_pic1"), for: .normal)
        button.setImageTintColor(AppColor.ColorButton)
        button.imageEdgeInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: -360)
        button.addTarget(self, action: #selector(tappedButtonFake), for: .touchUpInside)
        return button
    }()
    
    let buttonOrderAction: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать номер", for: .normal)
        button.titleLabel?.font = AppFont.regular(ofSize: 16)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColor.ColorButton
        button.addTarget(self, action: #selector(tappedButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedButtonFake(){} //Подробнее об номере
    @objc func tappedButtonAction(){print("Переход к заказу")}
    
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
    
    func configure(with item: ItemInChooseTableView){
        nameLabel.text = item.name
        plusLabel_1.text = " \(item.plus1) "
        plusLabel_2.text = " \(item.plus2) "
        hotelCost.text = "\(item.cost) ₽"
        ///Получение картинки
        guard let imageStrings = item.imageUrl else { return }
        customCollectionCell = imageStrings
    }

    func setupCollectionView() {
        //        Set collection view
        let layout = UICollectionViewFlowLayout()
        collectionView2 = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView2.backgroundColor = .clear
        collectionView2.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        collectionView2.showsVerticalScrollIndicator = false
        collectionView2.showsHorizontalScrollIndicator = false
        collectionView2.isPagingEnabled = true
        collectionView2.delegate = self
        collectionView2.dataSource = self
        layout.scrollDirection = .horizontal
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
        [bgView,
         collectionView2,
         nameLabel,
         stackPlus,
         stackCost,
         buttonDetailed,
         buttonOrderAction
        ].forEach(self.contentView.addSubview(_:))
        [plusLabel_1,plusLabel_2].forEach(stackPlus.addArrangedSubview(_:))
        [hotelCost, hotelCostTextExtraInfo].forEach(stackCost.addArrangedSubview(_:))
        
        bgView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(snp.bottom)
        }
        
        collectionView2.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView2.snp.bottom).offset(0)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(autoLayout().height / 12)
        }
        
        stackPlus.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-30)
            make.height.equalTo(autoLayout().height / 25)
        }
        
        buttonDetailed.snp.makeConstraints { make in
            make.top.equalTo(stackPlus.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(16)
            make.width.equalTo(202)
            make.height.equalTo(autoLayout().height / 30)
        }
        
        stackCost.snp.makeConstraints { make in
            make.top.equalTo(buttonDetailed.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
        }
        
        buttonOrderAction.snp.makeConstraints { make in
            make.top.equalTo(stackCost.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
            make.height.equalTo(autoLayout().height / 20)
            make.bottom.equalTo(snp.bottom).offset(-10)
        }
        
        plusLabel_1.snp.makeConstraints { make in
            make.top.equalTo(stackPlus.snp.top).offset(-10)
            make.bottom.equalTo(stackPlus.snp.bottom).offset(-10)
        }
    }
}

extension ChooseApartmentViewCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return customCollectionCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as! CustomCollectionCell
        let itemsArray = customCollectionCell[indexPath.row]
        cell.setUp(imageName: itemsArray)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: autoLayout().width, height: autoLayout().height / 3)
    }
}
