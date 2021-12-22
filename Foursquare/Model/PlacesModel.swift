//
//  StructureModel.swift
//  Foursquare
//
//  Created by Shahzaib khan on 26/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
import UIKit
//MARKS:- Welcome Model
struct Welcome:Codable
{
let results: [results]
}
struct results:Codable
{
let fsq_id:String
let categories: [category]
let distance: Float
let name:String
let geocodes:geocodes
}
struct category: Codable
{
let id: Int
let name:String
let icon: icon
}
struct icon: Codable
{
let prefix:String
let suffix:String
}
struct geocodes:Codable
{
let main: main
}
struct location: Codable
{
let address:String
let country:String
//let cross_street:String
let dma:String
let locality:String
let postcode:String
let region:String


}
struct main:Codable
{
let latitude: Double
let longitude: Double
}
struct context : Codable
{
let geo_bounds: geo_bounds
let etc = "example"
}
struct geo_bounds:Codable
{
let circle: circle
}
struct circle:Codable
{
let center: center
let radius:Int
}
struct center:Codable
{
let latitude:Float
let longitude:Float
}
