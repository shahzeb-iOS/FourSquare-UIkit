//
//  PicturesViewcontroller.swift
//  Foursquare
//
//  Created by Shahzaib khan on 06/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit

class PicturesViewcontroller: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var picsCollection:UICollectionView!
    var details: results!
    var result = [Images]()
    var Indexpath:Int!
    var CallingApi = ApiIntegration()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //Marks:- Calling Api
    override func viewWillAppear(_ animated: Bool) {
        var url = details.fsq_id
        CallingApi.imagesFromid(id: url) {(results) in
            self.result = results
          // let spinner = UIViewController.displaySpinner(onView: self.collection)
            if results.count == 0 {
                print("")
            }
            else
            {
              //  UIViewController.removeSpinner(spinner: spinner)
                self.picsCollection.reloadData()
            }
        }

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return result.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let prefix = result[indexPath.row].prefix
        let suffix = result[indexPath.row].suffix
         let width = Int((view.frame.size.width-4)/3)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pics", for: indexPath) as? PicturesCollectionViewCell
        var url = prefix + "\(width)x\(width)" + suffix
        cell?.img.downloaded(from: url)
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Indexpath = indexPath.row
       // sendImages = result
        performSegue(withIdentifier: "Swipecollection", sender: self)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.size.width-4)/3
        return CGSize(width: width, height: width)
    }

    //MARKS:- Segue Function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Backdashboard"
        {
            self.dismiss(animated: true, completion: nil)
        }
        else if segue.identifier == "Swipecollection"
        {
            let v = segue.destination as? SwipeCollectionVC
            v?.photoDetails = result
            v?.ImageIndex = Indexpath
        }
    }
}
