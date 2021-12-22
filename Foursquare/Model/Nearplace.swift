//
//  Nearplace.swift
//  Foursquare
//
//  Created by Shahzaib khan on 03/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
struct finalJson {
    var nearPlace:[nearPlaces]
}
struct nearPlaces:Codable
{
    let fsq_id:String
    let categories: [cat]
    let distance: Float
    let name:String
}
struct cat: Codable
{
    let id: Int
    let name:String
    let icon: icons
}
struct icons: Codable
{
    let prefix:String
    let suffix:String
}
struct geocode:Codable
{
    let main: mains
}
struct locations: Codable
{
    let address:String
    let country:String
    let cross_street:String
    let dma:String
    let locality:String
    let postcode:String
    let region:String
}
struct mains:Codable
{
    let latitude: Float
    let longitude: Float
}
struct geo_bound:Codable
{
    let circle: circles
}
struct circles:Codable
{
    let center: centers
    let radius:Int
}
struct centers:Codable
{
    let latitude:Float
    let longitude:Float
}

