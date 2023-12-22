//
//  MainViewViewModel.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import Foundation

class MainViewViewModel {
    func fetchMainData() async -> FirstViewHotel {
        guard let posts = try? await ServiceLayer.shared.fetchDataFirstViewHotel() else { return FirstViewHotel(
            id: 0,
            name: "",
            adress: "",
            minimalPrice: 1,
            priceForIt: "",
            rating: 2,
            ratingName: "",
            imageUrls: [],
            aboutTheHotel: AboutTheHotel(description: "", peculiarities: []))}
        return posts
    }
}
