//
//  ChooseApartamentViewModel.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import Foundation

class ChooseApartamentViewModel {
    func fetchMainData() async -> SecondViewRooms {
        guard let posts = try? await ServiceLayer.shared.fetchDataSecondViewRooms() else { return SecondViewRooms(rooms: [])}
        return posts
    }
}
