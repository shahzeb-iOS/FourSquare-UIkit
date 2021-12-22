//
//  Model.swift
//  Foursquare
//
//  Created by Shahzaib khan on 30/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
//MARKS:- Images Model
struct Images:Decodable {
    var id:String
    var created_at:String
    var prefix:String
    var suffix:String
    var width:Int
    var height:Int
}
//MARKS:- Details Model
struct  details {
    var name:String
    var distance:Float
    var categoryName:String
}
