//
//  ViewController.swift
//  Demo_025
//
//  Created by 鄭淳澧 on 2021/8/13.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    @IBOutlet weak var myImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mySegCon: UISegmentedControl!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var myPageCon: UIPageControl!
    
    var imgName: [String] = ["001", "002", "003", "004", "005"]
    var songTitle: [String] = ["可愛女人", "夜曲", "夜的第七章", "煙花易冷", "對不起"]
    var songFile: [String] = ["videoplayback-1", "videoplayback-2", "videoplayback-3", "videoplayback-4", "videoplayback-5"]
    var arrayIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImgView.layer.cornerRadius = 8
    }

    @IBSegueAction func showMyVideo(_ coder: NSCoder) -> AVPlayerViewController? {
        let controller = AVPlayerViewController(coder: coder)
        print("\(songFile[arrayIndex])")
        if let url = Bundle.main.url(forResource: "\(songFile[arrayIndex])", withExtension: "mp4") {
          controller?.player = AVPlayer(url: url)
          controller?.player?.play()
        }
        
        return controller
    }
    
    func updateUI() {
        myPageCon.currentPage = arrayIndex
        mySegCon.selectedSegmentIndex = arrayIndex
        myImgView.image = UIImage(named: "\(imgName[arrayIndex])")
        titleLabel.text = "\(songTitle[arrayIndex])"
    }
    
    @IBAction func mySegConPressed(_ sender: UISegmentedControl) {
        arrayIndex = sender.selectedSegmentIndex
        myPageCon.currentPage = arrayIndex
        updateUI()
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        if sender.titleLabel!.text == " " {
            if arrayIndex <= 3 {
                arrayIndex += 1
                updateUI()
            } else {
                arrayIndex = 0
                updateUI()
            }
        } else {
            if arrayIndex >= 1 {
                arrayIndex -= 1
                updateUI()
            } else {
                arrayIndex = 4
                updateUI()
            }
        }
    }
    
    @IBAction func myPageConPressed(_ sender: UIPageControl) {
        arrayIndex = sender.currentPage
        mySegCon.selectedSegmentIndex = arrayIndex
        updateUI()
    }
    
    @IBAction func swipeChanged(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            if arrayIndex <= 3 {
                arrayIndex += 1
                updateUI()
            } else {
                arrayIndex = 0
                updateUI()
            }
        } else {
            if arrayIndex >= 1 {
                arrayIndex -= 1
                updateUI()
            } else {
                arrayIndex = 4
                updateUI()
            }
        }
    }

}

