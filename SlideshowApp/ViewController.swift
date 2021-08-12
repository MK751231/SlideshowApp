//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 越川将人 on 2021/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var timerView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    var timer: Timer!
    var timer_sec: Float = 0

    var flagPlay: Bool = false

    var nowIndex: Int = 0
    var imageArray:[UIImage] = [
        UIImage(named:"image_01")!,
        UIImage(named:"image_02")!,
        UIImage(named:"image_03")!,
        UIImage(named:"image_04")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = imageArray[nowIndex]
        playButton.setTitle("再生", for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.image2 = imageView.image!
    }

    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 0.1
        if flagPlay == true {
            if self.timer_sec > 2 {
                if (nowIndex == imageArray.count - 1) {
                    nowIndex = 0
                } else {
                    nowIndex += 1
                }
                self.timerView.image = imageArray[nowIndex]
                self.timer_sec = 0
            }
        }
    }

    @IBAction func changeTimer(_ sender: Any) {
        if flagPlay == false {
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                playButton.setTitle("停止", for: .normal)
                forwardButton.isEnabled = false
                rewindButton.isEnabled = false
                flagPlay = true
            }
        } else {
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
                playButton.setTitle("再生", for: .normal)
                forwardButton.isEnabled = true
                rewindButton.isEnabled = true
                flagPlay = false
            }
        }
    }
    
    @IBAction func tapAction(_ sender: Any) {
        performSegue(withIdentifier: "ZoomViewController" ,sender: nil)
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func ImageForwardView(_ sender: Any) {
        if (nowIndex == imageArray.count - 1) {
            nowIndex = 0
            } else {
            nowIndex += 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func ImageRewindView(_ sender: Any) {
        if (nowIndex == 0) {
            nowIndex = imageArray.count - 1
            } else {
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
    }
}

