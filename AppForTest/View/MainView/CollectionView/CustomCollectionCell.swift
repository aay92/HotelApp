//
//  CustomCollectionCell.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//
import UIKit
import SnapKit

class CustomCollectionCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionCell"
    
    private let imageCollection: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
//        image.layoutIfNeeded()
//        image.image = UIImage(named: "pngHotel")?.withRoundedCorners(radius: 15)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConsrtaints()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
        backgroundColor = .clear
        addSubview(imageCollection)
    }
    
    func setUp(imageName: String){
        print(imageName)
        guard let urlImage = URL(string: imageName) else { return }
        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
            if let data = try? Data(contentsOf: urlImage) {
                DispatchQueue.main.async {
                    self.imageCollection.image = UIImage(data: data)?.withRoundedCorners(radius: 35)
                }
            }
        }
    }
        
    private func setConsrtaints(){
        imageCollection.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
            make.bottom.equalTo(snp.bottom).offset(-5)
        }
    }
    
}


