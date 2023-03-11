//
//  NetWorkManager.swift
//  MasterCook1
//
//  Created by Татьяна Мальчик on 11.03.2023.
//

import UIKit

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<NetworkData, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    print("Some erorr")
                    completion(.failure(error!))
                    return
                }
                guard let data = data else { return }
                do {
                    let dataCaracters = try JSONDecoder().decode(NetworkData.self, from: data)
                    completion(.success(dataCaracters))
                } catch let jsonError {
                    print("Faild to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
