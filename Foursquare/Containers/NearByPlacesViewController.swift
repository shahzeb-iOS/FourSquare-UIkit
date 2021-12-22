//
//  NearByPlacesViewController.swift
//  Foursquare
//
//  Created by Shahzaib khan on 06/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class NearByPlacesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var nearPlacesTableview:UITableView!
    var lati:Double!
    var longi:Double!
    var nearPlaces = [results]()
    var result:results!
    var CallingApi = ApiIntegration()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Clear emptyCells
        nearPlacesTableview.tableFooterView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.CallingApi.nearPlacesSearching(latitude: self.lati, longitude: self.longi) { (result) in
                self.nearPlaces = result.results
                print(self.nearPlaces.count)
                if self.nearPlaces.isEmpty  {
                }
                else
                {
                    self.nearPlacesTableview.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nearPlaces.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "places", for: indexPath) as? NearByPlacesTableViewCell
        let prefix = nearPlaces[indexPath.row].categories.first?.icon.prefix
        let suffix = nearPlaces[indexPath.row].categories.first?.icon.suffix
        let size = "bg_120"
        let icon = prefix! + size + suffix!
        cell?.catName.text = nearPlaces[indexPath.row].categories.first?.name
        cell?.name.text = nearPlaces[indexPath.row].name
        cell?.distance.text = String(nearPlaces[indexPath.row].distance)
        cell?.img.downloaded(from: icon)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       result = nearPlaces[indexPath.row]
        //performSegue(withIdentifier: "back", sender: self)
    }
    //Marks:- Prepare Segue Function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? MainViewController
        vc?.details = result
    }
}
