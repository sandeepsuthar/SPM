//
//  File.swift
//
//
//  Created by Sandeep on 02/01/24.
//

import Foundation
import Alamofire

public struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

public class TestClass {
    public init() { }
    public func printHello() {
        print("Hello world")
    }

    public func fetchData(completion: @escaping (Result<Todo, AFError>) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/todos/1", method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                completion(response.result.flatMap { data in
                    do {
                        let decodedData = try JSONDecoder().decode(Todo.self, from: data)
                        return .success(decodedData)
                    } catch {
                        return .failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength))
                    }
                })
            }
    }
}
