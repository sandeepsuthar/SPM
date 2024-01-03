//
//  File.swift
//  
//
//  Created by Sandeep on 02/01/24.
//

import Foundation
import Alamofire

public class TestClass {
    public init() { }
    public func printHello() {
        print("Hello world")
    }

    public func fetchData() {
        AF.request("https://jsonplaceholder.typicode.com/todos/1", method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                    case .success(let data):
                        print("Validation Successful")
                        if let result = try? JSONSerialization.jsonObject(with: data) {
                            print(result)
                        }
                    case let .failure(error):
                        print(error)
                }
            }
    }
}
