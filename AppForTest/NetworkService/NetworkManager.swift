//
//  NetworkManager.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 20.12.2023.
//

import Foundation

class ServiceLayer {

    static let shared = ServiceLayer()
    init(){}
    func fetchDataFirstViewHotel() async throws -> FirstViewHotel {
        return try await withCheckedThrowingContinuation { continuation in
            let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")!
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let data = data,
                          let posts = try? JSONDecoder().decode(FirstViewHotel.self, from: data) {
                    continuation.resume(returning: posts)
                } else {
                    assertionFailure("Error from get request")
                }
            }.resume()
        }
    }
    
    func fetchDataSecondViewRooms() async throws -> SecondViewRooms {
        return try await withCheckedThrowingContinuation { continuation in
            let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195")!
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let data = data,
                          let posts = try? JSONDecoder().decode(SecondViewRooms.self, from: data) {
                    continuation.resume(returning: posts)
                } else {
                    assertionFailure("Error from get request")
                }
            }.resume()
        }
    }
    
    func fetchDataThirdView() async throws -> ThirdView {
        return try await withCheckedThrowingContinuation { continuation in
            let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff")!
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let data = data,
                          let posts = try? JSONDecoder().decode(ThirdView.self, from: data) {
                    continuation.resume(returning: posts)
                } else {
                    assertionFailure("Error from get request")
                }
            }.resume()
        }
    }
}

//MARK: - Model Api
//1  https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473
struct FirstViewHotel: Codable {
    let id: Int?
    let name, adress: String?
    let minimalPrice: Int?
    let priceForIt: String?
    let rating: Int?
    let ratingName: String?
    let imageUrls: [String?]
    let aboutTheHotel: AboutTheHotel?

    enum CodingKeys: String, CodingKey {
        case id, name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating = "rating"
        case ratingName = "rating_name"
        case imageUrls = "image_urls"
        case aboutTheHotel = "about_the_hotel"
    }
}

struct AboutTheHotel: Codable {
    let description: String?
    let peculiarities: [String?]
}


//2  https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195
struct SecondViewRooms: Codable {
    let rooms: [Room]
}

struct Room: Codable {
    let id: Int
    let name: String?
    let price: Int?
    let pricePer: String?
    let peculiarities: [String?]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}

//3  https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff

struct ThirdView: Codable {
    let id: Int
    let hotelName, hotelAdress: String?
    let horating: Int?
    let ratingName, departure, arrivalCountry, tourDateStart: String?
    let tourDateStop: String?
    let numberOfNights: Int
    let room, nutrition: String?
    let tourPrice, fuelCharge, serviceCharge: Int

    enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAdress = "hotel_adress"
        case horating
        case ratingName = "rating_name"
        case departure
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room, nutrition
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
}
