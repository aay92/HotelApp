//
//  RoomReservationView.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//

import UIKit

class RoomReservationView: UIViewController {
    
    
    var isHiddenCustomTable = true
    weak var roomReservationCoordinator: RoomReservationCoordinator?
    ///ViewModel
    let roomResrvationViewModel = RoomResrvationViewModel()
    private var totalCostTour = 0
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
    
    ///Rating, cost and name view
    private let bgView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let ratingAndNameWithoutCost = RatingAndNameWithoutCost()
    private let infoAboutHotel = InfoAboutHotel()
    private let infoAboutUser = InfoAboutUser()
    private let firstPersonView: FirstPersonView = {
        let firstPersonView = FirstPersonView()
        firstPersonView.translatesAutoresizingMaskIntoConstraints = false
        return firstPersonView
    }()
    private let secondPersonView: SecondPersonView = {
        let secondPersonView = SecondPersonView()
        secondPersonView.translatesAutoresizingMaskIntoConstraints = false
        return secondPersonView
    }()
    private let customTurist = CustomTurist()
    private let costOrderView = CostOrderView()
    
    private let bgInfoAboutHotel: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.backgroundColor = AppColor.bgView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let payTheOrder: UIButton = {
        let button = UIButton()
        button.setTitle("Оплатить", for: .normal)
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
        getNetworkData()
        setConfigView()
        setConfigTable()
        setConstraint()
        changeNameButton()
        delegateTextFeild()
    }
    
    ///Получаем data с сервера
    private func getNetworkData(){
        Task {
            let data = await self.roomResrvationViewModel.fetchMainData()
            ratingAndNameWithoutCost.configure(
                ratingText: data.ratingName ?? "",
                hotelName: data.hotelName ?? "",
                hotelAdressText: data.hotelAdress ?? "")
            
            infoAboutHotel.configure(
                fromWhichCity: data.departure ?? "",
                whatСity: data.arrivalCountry ?? "",
                dataFling: "\(data.tourDateStart ?? "") - \(data.tourDateStop ?? "")",
                howNights: "\(data.numberOfNights)",
                nameHotel: data.room ?? "",
                numberHotel: data.hotelName ?? "",
                eatsHotel: data.nutrition ?? "")
            
            var totalCostTour = data.tourPrice + data.fuelCharge + data.serviceCharge
            
            costOrderView.configure(
                toorText: "\(data.tourPrice)",
                oilText: "\(data.fuelCharge)",
                serviseText: "\(data.serviceCharge)",
                totalText: "\(totalCostTour)")
            self.payTheOrder.setTitle("Оплатить \(totalCostTour) ₽", for: .normal)
        }
    }
    
    @objc func tappedButton(){
        ///Переход на страницу успешный заказ
        roomReservationCoordinator?.moveOrderPaidView()
        ///Убираем back в navigation bar
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @objc func tapArrowfirst(){
        isHiddenCustomTable.toggle()
        if self.isHiddenCustomTable {
            self.firstPersonView.clipsToBounds = true
            self.firstPersonView.snp.updateConstraints { make in
                make.height.equalTo(self.autoLayout().height / 13)
            }
            self.firstPersonView.hiddenObjects(needHidden: true)
            self.firstPersonView.layoutIfNeeded()
            
        } else {
            self.firstPersonView.clipsToBounds = true
            self.firstPersonView.snp.updateConstraints { make in
                make.height.equalTo(self.autoLayout().height / 1.9)
            }
            self.firstPersonView.hiddenObjects(needHidden: false)
            self.firstPersonView.layoutIfNeeded()
        }
        
    }
    
    @objc func tapArrowSecond(){
        isHiddenCustomTable.toggle()
        if isHiddenCustomTable {
            secondPersonView.clipsToBounds = true
            secondPersonView.snp.updateConstraints { make in
                make.height.equalTo(autoLayout().height / 13)
            }
            secondPersonView.hiddenObjects(needHidden: true)
            secondPersonView.layoutIfNeeded()
        } else {
            secondPersonView.clipsToBounds = true
            secondPersonView.snp.updateConstraints { make in
                make.height.equalTo(autoLayout().height / 1.9)
            }
            secondPersonView.hiddenObjects(needHidden: false)
            secondPersonView.layoutIfNeeded()
        }
    }
    
    private func changeNameButton(){
        var costOnButton = 198036
        self.payTheOrder.setTitle("Оплатить \(costOnButton) ₽", for: .normal)
    }
    
    
    private func setConfigView(){
        title = "Бронирование"
        view.backgroundColor = AppColor.bgTableView
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    private func setConfigTable(){
        firstPersonView.imageArrowStar.addTarget(self, action: #selector(tapArrowfirst), for: .touchUpInside)
        secondPersonView.imageArrowStar.addTarget(self, action: #selector(tapArrowSecond), for: .touchUpInside)
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
        view.addSubview(scrollView)
        
        [bgView,
         ratingAndNameWithoutCost,
         bgInfoAboutHotel,
         infoAboutHotel,
         infoAboutUser,
         firstPersonView,
         secondPersonView,
         customTurist,
         costOrderView,
         bgButtonView,
         payTheOrder
        ].forEach(scrollView.addSubview(_:))
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bgView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(10)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing).offset(10)
            make.height.equalTo(autoLayout().height / 5.8)
        }
        
        ratingAndNameWithoutCost.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(autoLayout().height / 6.2)
        }
        
        bgInfoAboutHotel.snp.makeConstraints { make in
            make.top.equalTo(ratingAndNameWithoutCost.snp.bottom).offset(10)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing).offset(10)
            make.bottom.equalTo(infoAboutHotel.snp.bottom).offset(25)
        }
        
        infoAboutHotel.snp.makeConstraints { make in
            make.top.equalTo(ratingAndNameWithoutCost.snp.bottom).offset(10)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-30)
            make.height.equalTo(autoLayout().height / 3.001)
        }
        
        infoAboutUser.snp.makeConstraints { make in
            make.top.equalTo(infoAboutHotel.snp.bottom).offset(40)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(autoLayout().height / 3.1)
            make.width.equalTo(autoLayout().width)
        }
        
        firstPersonView.snp.makeConstraints { make in
            make.top.equalTo(infoAboutUser.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(autoLayout().height / 13)
        }
        firstPersonView.hiddenObjects(needHidden: true)
        
        secondPersonView.snp.makeConstraints { make in
            make.top.equalTo(firstPersonView.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(autoLayout().height / 13)
        }
        secondPersonView.hiddenObjects(needHidden: true)
        
        customTurist.snp.makeConstraints { make in
            make.top.equalTo(secondPersonView.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(autoLayout().height / 15.3)
        }
        
        costOrderView.snp.makeConstraints { make in
            make.top.equalTo(customTurist.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(autoLayout().height / 7.7)
        }
        
        payTheOrder.snp.makeConstraints { make in
            make.top.equalTo(costOrderView.snp.bottom).offset(20)
            make.leading.equalTo(scrollView.snp.leading).offset(10)
            make.trailing.equalTo(scrollView.snp.trailing).offset(-10)
            make.height.equalTo(autoLayout().height / 13)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-10)
        }
        
        bgButtonView.snp.makeConstraints { make in
            make.top.equalTo(costOrderView.snp.bottom).offset(10)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.height.equalTo(autoLayout().height / 15.3)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-10)
        }
    }
}

extension RoomReservationView: UITextFieldDelegate {
    
    func delegateTextFeild(){
        infoAboutUser.customTextField.phoneTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X (XXX) XXX-XXXX", phone: newString)
        return false
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

