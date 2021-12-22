//
//  ViewController.swift
//  Foursquare
//
//  Created by Shahzaib khan on 25/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate,UISearchBarDelegate{
@IBOutlet weak var search:UISearchBar!
@IBOutlet weak var Breakfast:UIButton!
@IBOutlet weak var lunchBtn:UIButton!
@IBOutlet  weak var dinnerBtn:UIButton!
@IBOutlet weak var cofeeAndteaBtn:UIButton!
@IBOutlet weak var nightLife:UIButton!
@IBOutlet weak var thingsTodo:UIButton!
var currentlati:Double!
var currentLongi:Double!
var integrateApi = ApiIntegration()
var sendPlace = [results]()
var locationManager = CLLocationManager()
var currentLocation: CLLocation!
var category = ""
override func viewDidLoad() {
    super.viewDidLoad()
    self.search.delegate = self
    //getCurrent location
    //self.getCurrentlocation()
    // Do any additional setup after loading the view, typically from a nib.
}

@IBAction func BreakfastPressed(_ sender:Any)
{
    self.category = "Breakfast"

    self.performSegue(withIdentifier: "dashboard", sender: self)
    }

@IBAction func lunchPressed(_ sender:Any)
{
    self.category = "Lunch"
    performSegue(withIdentifier: "dashboard", sender: self)

}
@IBAction func dinnerPressed(_ sender:Any)
{
    self.category = "Dinner"
     performSegue(withIdentifier: "dashboard", sender: self)

}
@IBAction func  cofeeAndteaPressed(_ sender:Any)
{
    self.category = "Cofeeandtea"
     performSegue(withIdentifier: "dashboard", sender: self)

}
@IBAction func nightlifePressed(_ sender:Any)
{
    self.category = "nightlife"
     performSegue(withIdentifier: "dashboard", sender: self)
}
@IBAction func thingstoDoPressed(_ sender:Any)
{
    self.category = "thingstodo"
     performSegue(withIdentifier: "dashboard", sender: self)

}
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            print("Search is empty")
        } else {
        }

    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        category = searchBar.text!.replacingOccurrences(of: " ", with: "")
        print(category)
         performSegue(withIdentifier: "dashboard", sender: self)
    }
    //MARKS:- Segue Function
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "dashboard"
    {
        let vc = segue.destination as! DashboardViewController
        vc.selectedCategory = category
        vc.places = sendPlace
    }
}
  //  MARKS:- location Manager Function
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let userLocation :CLLocation = locations[0] as CLLocation
    currentlati = userLocation.coordinate.latitude
    currentLongi = userLocation.coordinate.longitude
    print("user latitude = \(userLocation.coordinate.latitude)")
    print("user longitude = \(userLocation.coordinate.longitude)")
}
    //MARKS:- Get Current Location
func getCurrentlocation()
{
    locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    if CLLocationManager.locationServicesEnabled(){
        locationManager.startUpdatingLocation()
    }
}
}

