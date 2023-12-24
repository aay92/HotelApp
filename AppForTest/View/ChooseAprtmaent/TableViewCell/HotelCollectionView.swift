//
//  HotelCollectionView.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//
//
import UIKit
import SnapKit

class HotelCollectionView: UIView {
    
    private var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.clipsToBounds = false
        collectionView.layer.cornerRadius = 15
        return collectionView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    
    init(){
        super.init(frame: .zero)
        setCollectionViewDelegates()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
       
    }
    
    func setSum()->[ItemInCollectionView]{
        
        var arrayCollectionView = [ItemInCollectionView]()
        let profitItem = ItemInCollectionView(name: "hotel-1")
        
        let groosItem = ItemInCollectionView(name: "hotel-2")
        arrayCollectionView.append(profitItem)
        arrayCollectionView.append(groosItem)
        
        return arrayCollectionView
    }
    
    private func setConstraint(){
        backgroundColor = AppColor.bgView
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(253)
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-16)
        }
    }
}


//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension HotelCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private func setCollectionViewDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setSum().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionView", for: indexPath)
        cell.backgroundColor  = .red
//        guard let cell = collectionView.dequeueReusableCell(
//            withReuseIdentifier: CustomCollectionCell.identifier,
//            for: indexPath) as? CustomCollectionCell
//        else {
//            return UICollectionViewCell()
//        }
//        cell.setUp(imageName: setSum()[indexPath.row])
        return cell
    }

}


//MARK: - Set create Layout
extension HotelCollectionView {
    
    private func createLayout()-> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout {[weak self] index, _ in
            guard let self = self else { return nil }
            return self.createProfitCollectionView()
        }
    }
    
    private func setCollectionView(){
        self.collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        self.collectionView.collectionViewLayout = createLayout()
    }
    
    //       Быстрые настройки секции коллекции
    private func settingCollectionLayoutSection(
        group: NSCollectionLayoutGroup,
        behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
        intetGroupSpacing: CGFloat,
        supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
        contentInsets: Bool)-> NSCollectionLayoutSection {
            
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = intetGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createProfitCollectionView()-> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(
            layoutSize:.init(widthDimension: .fractionalWidth(1),heightDimension: .absolute(105)))
        item.contentInsets.leading = 10
        item.contentInsets.trailing = 10
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize:.init(widthDimension: .fractionalWidth(0.8),heightDimension: .estimated(600)),
            subitems: [item])
        
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let section = settingCollectionLayoutSection(
            group: group,
            behavior: .continuous,
            intetGroupSpacing: 0,
            supplementaryItems: [],
            contentInsets: false)
        return section
    }
}
