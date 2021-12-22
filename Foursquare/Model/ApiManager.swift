//
//  ApiManager.swift
//  Foursquare
//
//  Created by Shahzaib khan on 30/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
import UIKit
class  ApiManager {
    func imagesFromid(id:String,completed:@escaping([Images]) -> ()) -> Void
    {
        let headers = [
            "Accept": "application/json",
            "Authorization": "fsq372DHFclwuOR7RJgrP/kFwscHNjT3aaVz3WfolQnan3A="
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/\(id)/photos")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
              //  print(httpResponse)
            }
            guard let data = data else { return}
            print(String(data: data, encoding: .utf8)!)
            do {
                let resultImages = try? JSONDecoder().decode([Images].self,from:data)
                DispatchQueue.main.async {
                    completed(resultImages!)
                }
                //print(result)
               // let result = try? JSONDecoder.decode(,from:data)
            }
        })

        dataTask.resume()

    }
}
