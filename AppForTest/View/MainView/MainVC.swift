//
//  MainVC.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import UIKit
import SnapKit

    ///Hotel view
class MainVC: UIViewController {
    ///ViewModel
    let mainViewViewModel = MainViewViewModel()
    
    weak var mainVCCoordinator: MainVCCoordinator?
    ///Получаем инстанс мок даты для таблицы с преимуществами
    let tableViewData = GetItemInTableView()
    ///Пустой массив для Коллекции
    var customCollectionCell: [String] = []
    ///Пустой массив для Tаблицы
    var itemsCellVorTabel:[ItemInTableView] = []

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.frame = view.bounds
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    ///Вычесляемое свойство для размера скрола
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 200)
    }
    
    ///Title navigation controller
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Отель"
        label.textColor = AppColor.textTitle
        return label
    }()
    
    private var hotelCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.clipsToBounds = false
        collectionView.layer.cornerRadius = 15
        return collectionView
    }()
    
    ///BackgroundColor hotel view
    private let bgHotelView: UIView = {
        let view = UILabel()
        view.backgroundColor = AppColor.bgView
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    ///Rating, cost and name view
    private let ratingAndName = RatingAndName()
    private let aboutHotel = AboutHotel()
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    ///BackgroundColor hotelDescription view
    private let bgHotelDescriptionView: UIView = {
        let view = UILabel()
        view.backgroundColor = AppColor.bgView
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let buttonHotelView: UIButton = {
        let button = UIButton()
        button.setTitle("К выбору номера", for: .normal)
        button.titleLabel?.font = AppFont.regular(ofSize: 16)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = AppColor.ColorButton
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    ///BackgroundColor bgButtonView view
    private let bgButtonView: UIView = {
        let view = UILabel()
        view.backgroundColor = AppColor.bgView
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewDelegates()
        setConstraint()
        setConfig()
        setConfigForTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNetworkData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.hotelCollectionView.reloadData()
        }
    }
    
    ///Получаем data с сервера
    private func getNetworkData(){
        var newCustomCollectionCell: [String] = []

        Task {
            let data = await self.mainViewViewModel.fetchMainData()
            ratingAndName.configure(
                hotelName: data.name ?? "",
                ratingText: data.ratingName ?? "",
                adress: data.adress ?? "",
                hotelCosts: String(data.minimalPrice ?? 0))
            
                aboutHotel.configure(
                    hotelDescription: data.aboutTheHotel?.description ?? "",
                ratingText:  "Бесплатный Wifi на всей территории отеля" ,
                wifi: "1 км до пляжа",
                km: "Бесплатный фитнес-клуб",
                aeroport: "20 км до аэропорта")
        
            for i in data.imageUrls {
                guard let image = i else { return }
                newCustomCollectionCell.append(image)
            }
            customCollectionCell = newCustomCollectionCell
        }
    }
    
    ///Переход на страница выбора номера
    @objc private func tappedButton(){
        mainVCCoordinator?.moveSecond()
    }
    
    private func setConfigForTable(){
        itemsCellVorTabel = tableViewData.getItemInTableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AboutHotelTableViewCell.self, forCellReuseIdentifier: AboutHotelTableViewCell.identifier)
        tableView.reloadData()
    }
    
    ///Настройка главного вью
    private func setConfig(){
        view.backgroundColor = AppColor.separator
        navigationItem.title = titleLabel.text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)///Убрираем кнопку Back
        navigationController?.navigationBar.backgroundColor = AppColor.bgView
    }
    
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
    
    func setConstraint(){
        [scrollView].forEach(view.addSubview(_:))
        
        [bgHotelView,
         hotelCollectionView,
         ratingAndName,
         bgHotelDescriptionView,
         aboutHotel,
         tableView,
         bgButtonView,
         buttonHotelView
        ].forEach(scrollView.addSubview(_:))
        //        print(autoLayout().height) //930
        //        print(autoLayout().width)  //430
        bgHotelView.snp.makeConstraints { make in
            make.width.equalTo(autoLayout().width)
            make.height.equalTo(autoLayout().height / 1.9)
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(bgHotelDescriptionView.snp.top).offset(-10)
        }
        
        hotelCollectionView.snp.makeConstraints { make in
            make.height.equalTo(autoLayout().height / 3.6)
            make.top.equalTo(bgHotelView.snp.top).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
        }
        
        ratingAndName.snp.makeConstraints { make in
            make.height.equalTo(autoLayout().height / 3.1)
            make.top.equalTo(hotelCollectionView.snp.top).offset(autoLayout().height / 3.57)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
        }
        
        bgHotelDescriptionView.snp.makeConstraints { make in
            make.width.equalTo(autoLayout().width)
            make.height.equalTo(autoLayout().height / 2.03)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(bgButtonView.snp.top).offset(-10)
        }
        
        aboutHotel.snp.makeConstraints { make in
            make.top.equalTo(bgHotelDescriptionView.snp.top).offset(10)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.bottom.equalTo(bgHotelDescriptionView.snp.bottom).offset(-autoLayout().height / 4.4)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(aboutHotel.snp.bottom).offset(10)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.bottom.equalTo(bgHotelDescriptionView.snp.bottom)
        }
        
        bgButtonView.snp.makeConstraints { make in
            make.height.equalTo(autoLayout().height / 10.5)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        buttonHotelView.snp.makeConstraints { make in
            make.width.equalTo(autoLayout().width / 1.15)
            make.height.equalTo(48)
            make.centerX.equalTo(scrollView.snp.centerX)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension MainVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private func setCollectionViewDelegates(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20 // Отступы между коллескиями

        hotelCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        hotelCollectionView.isPagingEnabled = true // Страницы будут перекючаться по одному
        hotelCollectionView.showsHorizontalScrollIndicator = false
        self.view.addSubview(hotelCollectionView)
       
    
        hotelCollectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.identifier)
        hotelCollectionView.delegate = self
        hotelCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(customCollectionCell.count)
        return customCollectionCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionCell.identifier,
            for: indexPath) as? CustomCollectionCell
        else {
            return UICollectionViewCell()
        }
        cell.setUp(imageName: customCollectionCell[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: autoLayout().width / 1.066,
                      height: autoLayout().height / 3.06)
    }

}
//MARK: -  UITableViewDataSource, UITableViewDelegate
extension MainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsCellVorTabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AboutHotelTableViewCell.identifier, for: indexPath) as! AboutHotelTableViewCell
        let cellIndex = itemsCellVorTabel[indexPath.row]
        cell.configure(with: cellIndex)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
