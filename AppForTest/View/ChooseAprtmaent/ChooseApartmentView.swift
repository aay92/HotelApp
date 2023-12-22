//
//  ChooseApartmentView.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 19.12.2023.
//


import UIKit
import SnapKit

class ChooseApartmentView: UIViewController {

    weak var chooseApartmentViewCoordinator: ChooseApartmentViewCoordinator?
    ///ViewModel
    let chooseApartamentViewModel = ChooseApartamentViewModel()
    var mockData: [ItemInChooseTableView] = []
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigView()
        setConstraint()
        setConfigTable()
        getNetworkData()
        
//        tableView.reloadData()
    }
    
    ///Получаем data с сервера
    private func getNetworkData(){
        var num = 0
        var newMockData: [ItemInChooseTableView] = []
        Task {
            let data = await self.chooseApartamentViewModel.fetchMainData()
            print(data)

            for i in data.rooms {
                num + 1
                newMockData.append(ItemInChooseTableView(
                    image: i.imageUrls.first ?? "5",
                    name: i.name ?? "",
                    plus1: i.peculiarities[i.id] ?? "",
                    plus2: i.peculiarities[num] ?? "",
                    cost: i.price ?? 0))
            }
            mockData = newMockData
            tableView.reloadData()
        }
    }
    
    private func setConfigView(){
        title = "Steigenberger Makadi"
        view.backgroundColor = .red
    }
    
    private func setConfigTable(){
        tableView.backgroundColor = AppColor.bgTableView
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ChooseApartmentViewCell.self, forCellReuseIdentifier: ChooseApartmentViewCell.identifier)
    }
    
    private func setConstraint(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    ///Переход на страницу резерва номера
    @objc func seguaOnViewReservation(){
        chooseApartmentViewCoordinator?.moveReservationOrder()
    }
}

extension ChooseApartmentView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChooseApartmentViewCell.identifier, for: indexPath) as! ChooseApartmentViewCell
        let mockDataItem = mockData[indexPath.row]
        cell.configure(with: mockDataItem)
        ///Фон для ячеек
        cell.backgroundColor = AppColor.bgTableView
        ///Кнопка перехода на другую страницу по нажатию кнопки на ячейке
        cell.buttonOrderAction.addTarget(self, action: #selector(seguaOnViewReservation), for: .touchUpInside)
        ///Убираем back в navigation bar
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
