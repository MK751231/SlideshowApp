//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 越川将人 on 2021/08/10.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var scrollView2: UIScrollView!
    
    var image2:UIImage!
    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pausePlay = true
        
        scrollView2.delegate = self
        scrollView2.maximumZoomScale = 4.0
        scrollView2.minimumZoomScale = 1.0
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height

        imageView2.frame = CGRect(x: 0, y: 0, width: view.frame.width * 2, height: view.frame.height * 2)
        imageView2.center = CGPoint(x: screenWidth / 2, y: screenHeight / 2)
        scrollView2.addSubview(imageView2)
        
        imageView2.image = image2!
        imageView2.contentMode = UIView.ContentMode.scaleAspectFit

        imageView2.isUserInteractionEnabled = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pausePlay = false
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
