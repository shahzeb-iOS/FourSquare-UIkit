//
//  VideoPlayerViewController.swift
//  Foursquare
//
//  Created by Shahzaib khan on 02/12/2021.
//  Copyright © 2021 Shahzaib khan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices
class VideoPlayerViewController: UIViewController  {
let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_sender:Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
        let layer = AVPlayerLayer(player: player)
        layer.frame = view.bounds
        layer.videoGravity = .resizeAspect
        view.layer.addSublayer(layer)
        player.volume = 2
        layer.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        player.play()
    }
    func playVideo()
    {
        imagePicker.sourceType = .photoLibrary

        imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate

        imagePicker.mediaTypes = ["public.image", "public.movie"]

        present(imagePicker, animated: true, completion: nil)
    }

}

