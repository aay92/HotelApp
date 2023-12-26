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
