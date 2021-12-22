//
//  DashboardViewController.swift
//  Foursquare
//
//  Created by Shahzaib khan on 26/11/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit
class DashboardViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var photosBtn:UIButton!
    @IBOutlet weak var tipsBtn:UIButton!
    @IBOutlet weak var NnearPlacebtn:UIButton!
    @IBOutlet weak var searchData:UISearchBar!
    @IBOutlet weak var table:UITableView!
    var places = [results]()
    var integrateApi = ApiIntegration()
    var id:String!
    var selectedCategory:String!
    var detail:results!
    var filteredData = [results]()
    var search = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //Give Access to use Delegate
        searchData.delegate = self
        //Clear EmptyCells
        table.tableFooterView = UIView()
    }
    //MARKS:- viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        let loadspinner = UIViewController.displaySpinner(onView: self.view)
        DispatchQueue.main.async {
            self.integrateApi.placeApi(name: self.selectedCategory) { (result) in

                self.places = result.results
                print("places data \(self.places.count)")
                if self.places.isEmpty  {
                    UIViewController.removeSpinner(spinner: loadspinner)
                    self.createLabel()
                }
                else
                {
                    UIViewController.removeSpinner(spinner: loadspinner)
                    self.table.reloadData()
                }

            }                // Do any additional etup after loading the view.
        }
    }
    //MARKS:- TableView numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if search == true
        {
            return filteredData.count ?? 0
        }
        else {
             return places.count ?? 0
        }
    }
    //MARKS:- Tableview cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DashboardTableViewCell
        switch search {
        case true:

            if let prefix = (filteredData[indexPath.row].categories.first?.icon.prefix), let suffix = (filteredData[indexPath.row].categories.first?.icon.suffix){
                let icon = prefix+"bg_120"+suffix
                cell.images.downloaded(from: icon)
            } else
            {
                print("Nothig")
            }
            cell.name.text = filteredData[indexPath.row].name
            cell.distance.text = String(filteredData[indexPath.row].distance)
            cell.category.text = filteredData[indexPath.row].categories.first?.name
        case false:
            if let prefix = (places[indexPath.row].categories.first?.icon.prefix), let suffix = (places[indexPath.row].categories.first?.icon.suffix){
                let icon = prefix+"bg_120"+suffix
                cell.images.downloaded(from: icon)
            } else
            {
                print("Nothig")
            }

            cell.name.text = places[indexPath.row].name
            cell.distance.text = String(places[indexPath.row].distance)
            cell.category.text = places[indexPath.row].categories.first?.name
     default:
            print("Nothing find")
        }
        return cell
    }
    //MARKS:- TableView DidSelect RowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detail = places[indexPath.row]
         self.id = places[indexPath.row].fsq_id

        details.init(name: (places[indexPath.row].name), distance: (places[indexPath.row].distance), categoryName: (places[indexPath.row].categories.first?.name)!)
        performSegue(withIdentifier: "container", sender: self)
    }
    //MARKS:- Back Button
    @IBAction func backbtn(_ sender:Any)
    {
        dismiss(animated: true, completion: nil)
    }
    //MARKS:- SEGUE Function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"
        {
            let values = segue.destination as! MainViewController
            values.details = detail
    }
    }
    //MARKS:- Creating label Programmatically
    func createLabel()
    {
        let label = UILabel(frame: CGRect(x: 166, y: 303, width: 70, height: 70))
        label.textAlignment = .center
        label.text = "No data"
        self.table.addSubview(label)
    }
        }

