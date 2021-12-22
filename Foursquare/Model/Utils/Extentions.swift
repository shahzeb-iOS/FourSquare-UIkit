//
//  Extentions.swift
//  Foursquare
//
//  Created by Shahzaib khan on 03/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import Foundation
import UIKit
// MARKS:- Image Download
extension UIImageView {
    func downloaded(from url: URL){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                // PhotosViewController.imageArray.append(image)
                //  print("downloaded images are \(PhotosViewController.imageArray.count)")
            }
            }.resume()
    }
    func downloaded(from link: String) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url)
    }
}
//Marks:- Spinner Extention
extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 2)
        let ai = UIActivityIndicatorView.init(style: .white)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        return spinnerView
    }
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }

}

//Marks:- Dashboard:UISearchBarDelegate
extension DashboardViewController:UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty  {
            search = false
            table.reloadData()
            filteredData.removeAll()
        } else  {
            search = true
             filteredData = places.filter({$0.name.lowercased().contains(searchText.lowercased())})
            //its was not working properly
            //filteredData = places.filter({$0.name.prefix(searchText.count)==searchText})
            if filteredData.count == 0 {
            // createLabel()
            }
            else {
                search = true
            }
            table.reloadData()
        }
    }
}
//MARKS:- UIButton
extension UIButton {
    func centerVertically(padding: CGFloat = 6.0) {
        guard
            let imageViewSize = self.imageView?.frame.size,
            let titleLabelSize = self.titleLabel?.frame.size else {
                return
        }
        let totalHeight = imageViewSize.height + titleLabelSize.height + padding

        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageViewSize.height),
            left: 0.0,
            bottom: 0.0,
            right: -titleLabelSize.width
        )

        self.titleEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: -imageViewSize.width,
            bottom: -(totalHeight - titleLabelSize.height),
            right: 0.0
        )

        self.contentEdgeInsets = UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: titleLabelSize.height,
            right: 0.0
        )
    }
}
extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
