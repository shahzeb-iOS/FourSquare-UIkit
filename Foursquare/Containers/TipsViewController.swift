//
//  TipsViewController.swift
//  Foursquare
//
//  Created by Shahzaib khan on 06/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
var details: results!
var tips = [Tips]()
let formatter = DateFormatter()
    @IBOutlet weak var tipsTableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var id =  details.fsq_id
        tipsTableview.tableFooterView = UIView()
        DispatchQueue.main.async {
            ApiIntegration().TipsApi(fsqID: id, completion: { (results) in
                print("Successfully get tips")
                 self.tips = results
                self.tipsTableview.reloadData()
                print(self.tips.count)
            })
        }
        print("Tips Pressed")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tips.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tips", for: indexPath) as? TipsTableViewCell
        let mystring = tips[indexPath.row].created_at
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "dd-MM-yyyy"
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let Getdate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: Getdate!)
        print("date is \(mystring)")
        cell?.date.text = (myStringafd)
        cell?.id.text = "ID:\(tips[indexPath.row].id)"
        cell?.comment.text = tips[indexPath.row].text
        return cell!
    }
}
