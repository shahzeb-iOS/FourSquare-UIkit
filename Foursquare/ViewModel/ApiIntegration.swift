//
//  ApiIntegration.swift
//  Foursquare
//
//  Created by Shahzaib khan on 26/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
import UIKit
class ApiIntegration {
    var latitude = 41.8781
    var longitude = -87.6298
    var radius = 1000
    //MARKS:_ Tips searching using Fsq id
    func TipsApi(fsqID:String,completion:@escaping ([Tips])->()) -> Void
    {

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/\(fsqID)/tips")! as URL,
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
            guard let data = data else {return}
            print(String(data: data, encoding: .utf8)!)
            do {
                let tips = try? JSONDecoder().decode([Tips].self,from:data)
                DispatchQueue.main.async {
                    print(tips)
                    completion(tips!)
                }
            } catch { print (error.localizedDescription)}
        })

        dataTask.resume()
}
    //MARKS:- Search Places Using Category
    func placeApi(name:String,completed:@escaping (Welcome)->()) -> Void
    {
        var query = "https://api.foursquare.com/v3/places/search?query=\(name)&ll=\(latitude)%2C\(longitude)&limit=50"
        let headers = [
            "Accept": "application/json",
            "Authorization": foursqKey
        ]
        let request = NSMutableURLRequest(url: NSURL(string: query)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8)!)
            do
            {
                let result = try JSONDecoder().decode(Welcome.self, from: data)
              //  print (result.results[0].distance)
                DispatchQueue.main.async {
                    completed(result)
                }
            }
            catch {print(error.localizedDescription) }
        })
        dataTask.resume()
    }
    //MARKS:- Search images Using ID
    func imagesFromid(id:String,completed:@escaping([Images]) -> ()) -> Void
    {
        let headers = [
            "Accept": "application/json",
            "Authorization": foursqKey
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
            }
        })
        dataTask.resume()
    }
    func nearPlacesSearching(latitude:Double,longitude:Double,completion:@escaping (Welcome)->()) -> Void
    {
        let headers = [
            "Accept": "application/json",
            "Authorization": foursqKey
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/nearby?ll=41.8781%2C-87.6298")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8)!)
            do
            {
                let result = try JSONDecoder().decode(Welcome.self, from: data)
                //  print (result.results[0].distance)
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            catch {print(error.localizedDescription) }


        })
        dataTask.resume()
    }

}
