//
//  LocationManager.swift
//  Foursquare
//
//  Created by Shahzaib khan on 26/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
import UIKit
class LocationManager {
    var latitude = 31.4545
    var longitude = 74.2738
    var radius = 1000
    func placeApi(name:String,completed:@escaping (Initial)->()) -> Void
    {
        var query = "https://api.foursquare.com/v3/places/search?query=\(name)&ll=\(latitude)%2C\(longitude)"
        let headers = [
            "Accept": "application/json",
            "Authorization": "fsq372DHFclwuOR7RJgrP/kFwscHNjT3aaVz3WfolQnan3A="
        ]
        let request = NSMutableURLRequest(url: NSURL(string: query)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
            do
            {
                 // let json = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]

       let result = try JSONDecoder().decode(Welcome.self, from: data)
                print (result.results[0].distance)
                DispatchQueue.main.async {
                    completed(result)
                }
            }
            catch {}
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)

        })
        dataTask.resume()
    }
}
