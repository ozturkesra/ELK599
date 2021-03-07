//
//  Service.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 27.09.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation
import Alamofire

public class RESTService {
    
    public static var shared = RESTService()
    
    public static let SERVICE_URL = "http://192.168.1.100:8080/api/v1/"
    
    public func getLastRecords(completion: @escaping (Result<ApiResponse<[Record]>>) -> Void) {
        Alamofire.request(RESTService.SERVICE_URL + "message", method: .get ).response {
            response in
            do {
                if(response.response?.statusCode == 200) {
                    print(String(data: response.data!, encoding: .utf8))
                    var result = try JSONDecoder().decode(ApiResponse<[Record]>.self,from: response.data!)
                    
                    
                    if let recordData = result.data {
                        for (index,element) in recordData.enumerated() {
                            result.data![index].mqttMessage = try JSONDecoder().decode(BeaconDecodable.self, from: (recordData[index].message?.data(using: .utf8))!)
                        }
                    }

                    completion(.success(result))
                } else {
                    completion(.failure("" as! Error))
                } 
            }
            catch(let error) {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
