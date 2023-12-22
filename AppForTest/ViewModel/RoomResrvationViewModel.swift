//
//  RoomResrvationViewModel.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import Foundation

class RoomResrvationViewModel {
    func fetchMainData() async -> ThirdView {
        guard let posts = try? await ServiceLayer.shared.fetchDataThirdView() else { return ThirdView(
            id: 0,
            hotelName: "",
            hotelAdress: "",
            horating: 1,
            ratingName: "",
            departure: "",
            arrivalCountry: "",
            tourDateStart: "",
            tourDateStop: "",
            numberOfNights: 2,
            room: "",
            nutrition: "",
            tourPrice: 3,
            fuelCharge: 4,
            serviceCharge: 5) }
        return posts
    }
}
