//
//  ServiceRequest.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation
import UIKit
import Alamofire
import Dependiject

struct BaseError: Codable, Error {
    var message: [String]? = []
    var statusCode: Int = 0
}

class ServiceRequest {
    
    static func makeRequest<T: Codable>(path: String, method: HTTPMethod, params: Codable? = nil) async throws -> T {
        let urlRequest = try getUrlRequest(path: path, method: method, params: params)
        let dataResponse = await AF.request(urlRequest).serializingData().response
        return try handleResponse(dataResponse: dataResponse)
    }

    private static func getUrlRequest(path: String, method: HTTPMethod, params: Codable? = nil) throws -> URLRequest {
        guard let url = URL(string: "\(BuildConfig.getURL(for: .BASE_URL))\(path)") else { throw BaseError() }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method

        if let params = params {
            _ = JSONEncoder()
            if var jsonDictionary = try? params.asDictionary() {
                jsonDictionary = jsonDictionary.removingNils()
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary, options: []) {
                    urlRequest.httpBody = jsonData
                }
            }
        }
        return urlRequest
    }

    private static func handleResponse<T: Codable>(dataResponse : DataResponse<Data, AFError>) throws -> T {
        
        let statusCode = dataResponse.response?.statusCode ?? 0
        guard statusCode >= 200 && statusCode < 300 else {
            let errorResponse = try JSONDecoder().decode(BaseError.self, from: dataResponse.data ?? Data())
            throw errorResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: dataResponse.data ?? Data())
            return decodedResponse
        } catch let error as DecodingError {
            print(error)
            throw BaseError()
        }
    }
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionary = json as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

extension Dictionary where Value: Any {
    func removingNils() -> [Key: Any] {
        return self.compactMapValues { $0 }
    }
}

