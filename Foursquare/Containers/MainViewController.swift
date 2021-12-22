//
//  MainViewController.swift
//  Foursquare
//
//  Created by Shahzaib khan on 06/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class MainViewController: UIViewController {
    @IBOutlet weak var Img:UIImageView!
    @IBOutlet weak var pContainer: UIView!
    @IBOutlet weak var tContainer: UIView!
    @IBOutlet weak var nPlaceContainer:UIView!
    @IBOutlet weak var Segment: UISegmentedControl!
    @IBOutlet weak var resturantLbl:UILabel!
    @IBOutlet weak var categoryName:UILabel!
    var details: results!
  //  var Pics = [results]()
    override func viewDidLoad() {
        super.viewDidLoad()
       // var url = Pics!.res[0].prefix + "original" + details![0].suffix
      //  self.Img.downloaded(from: url)
        //show resturant name and category
        self.resturantLbl.text = details.name
        self.categoryName.text = details.categories.first?.name
        //Hiding Containers
        tContainer.isHidden = false
        nPlaceContainer.isHidden = true
        pContainer.isHidden = true
    }

    @IBAction func back(_sender:Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func video(_sender:Any)
    {
        //default player
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
        //  let layer = AVPlayer(player:player)
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc,animated: true)
        // for creating own player its wil be used
        // performSegue(withIdentifier: "videoplay", sender: self)
    }
    //Marks:- Segment Actions
    @IBAction func segmentClicked(_ sender: Any) {
        switch Segment.selectedSegmentIndex
        {
        case 0:
            pContainer.isHidden = false
            tContainer.isHidden = true
            nPlaceContainer.isHidden = true
            break
        case 1:
            pContainer.isHidden = true
            tContainer.isHidden = false
            nPlaceContainer.isHidden = true
            break
        case 2:
            pContainer.isHidden = true
            tContainer.isHidden = true
            nPlaceContainer.isHidden = false
        default:
            print("Nothing show")
        }
    }
    //Marks:- Segue prepare functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tips = segue.destination as? TipsViewController
        tips?.details = details
        let pics = segue.destination as? PicturesViewcontroller
        pics?.details = details
        let nearPlaces = segue.destination as? NearByPlacesViewController
        nearPlaces?.lati = details.geocodes.main.latitude
        nearPlaces?.longi = details.geocodes.main.longitude
        
    }
}
