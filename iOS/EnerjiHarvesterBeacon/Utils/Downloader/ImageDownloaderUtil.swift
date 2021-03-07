//
//  ImageDownloaderUtil.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 18.06.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public class ImageDownloaderUtil {
    
    public static let shared = ImageDownloaderUtil()
    
    func downloadedFrom(url: URL, completion: @escaping (Result<UIImage>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            switch (response as? HTTPURLResponse)?.statusCode {
                
            case 200:
                do {
                    let image = UIImage(data: data!)
                    completion(.success(image!))
                }catch {
                    completion(.failure(error))
                }
                
                break
            default:
                completion(.failure(error!))
                break
                
            }
            
//            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
////                completion(.success(image))
//                else { return }
            }.resume()
    }
}
