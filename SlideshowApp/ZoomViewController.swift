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
        
// コメントアウト部は拡大縮小可能にするためのコードで、検証途中のためコメントアウトしています
//        let doubleTap = UITapGestureRecognizer(target:self,action:#selector(ZoomViewController.doubleTap(gesture:)))
//        doubleTap.numberOfTapsRequired = 2
//        imageView2.addGestureRecognizer(doubleTap)
    }

//        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//            return self.imageView2
//        }

//        func scrollViewDidZoom(_ scrollView: UIScrollView) {
//           print("end zoom")
//        }

//        func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
//            print("start zoom")
//        }

//        @objc func doubleTap(gesture:UITapGestureRecognizer) -> Void {
//            if(self.scrollView2.zoomScale < 3){
//                let newScale:CGFloat = self.scrollView2.zoomScale*3
//                let zoomRect:CGRect = self.zoomForScale(scale:newScale, center:gesture.location(in:gesture.view))
//                self.scrollView2.zoom(to:zoomRect, animated: true)
//            } else {
//                self.scrollView2.setZoomScale(1.0, animated: true)
//            }
//        }

//       func zoomForScale(scale:CGFloat, center: CGPoint) -> CGRect{
//           var zoomRect: CGRect = CGRect()
//           zoomRect.size.height = self.scrollView2.frame.size.height / scale
//            zoomRect.size.width = self.scrollView2.frame.size.width  / scale
//            zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
//            zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
//
//            return zoomRect
//        }

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
