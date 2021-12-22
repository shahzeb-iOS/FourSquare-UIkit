//
//  SwipeCollectionVC.swift
//  Foursquare
//
//  Created by Shahzaib khan on 02/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit
class SwipeCollectionVC: UIViewController,UICollectionViewDataSource,UISearchControllerDelegate,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var PhotoCollection:UICollectionView!
    var photoDetails = [Images]()
    var ImageIndex:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PhotoCollection.reloadData()
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("photos\(photoDetails.count)")
        return photoDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SwipeCell
        cell?.img.self.frame.size.width
        cell?.img.downloaded(from: self.ExactUrlstring(Indexnumber: indexPath.row))
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.size.height
        let width = view.frame.size.width
        return CGSize(width: width, height: height)
    }
    override func viewDidLayoutSubviews() {
        //Getting clicked images at View
        PhotoCollection.selectItem(at: IndexPath(item: ImageIndex, section: 0), animated: false, scrollPosition: .centeredHorizontally )
    }
    //MARKS:- Creating URL STRING
    func ExactUrlstring(Indexnumber:Int)->String
    {
        let prefix = photoDetails[Indexnumber].prefix
        let suffix = photoDetails[Indexnumber].suffix
        let size = "original"
        let urlString = prefix + size + suffix
        return urlString
    }
    @IBAction func back(_ sender:Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
