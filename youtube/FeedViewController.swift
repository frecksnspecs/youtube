//
//  FeedViewController.swift
//  youtube
//
//  Created by Sam Huskins on 2/24/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet var feedView: UIView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var viewOriginalCenter: CGPoint!
    var viewRightOffset: CGFloat!
    var viewRight: CGPoint!
    
    var feedOriginalCenter: CGPoint!
    var feedRightOffset: CGFloat!
    var feedRight: CGPoint!
    
//    @IBAction func panGestureRecognizer(sender: UIPanGestureRecognizer) {
//        
//        let translation = sender.translationInView(view)
//        let velocity = sender.velocityInView(view)
//        
//        if (sender.state == UIGestureRecognizerState.Began) {
//            
//            viewOriginalCenter = feedView.center
//            
//        }  else if (sender.state == UIGestureRecognizerState.Changed) {
//            
//            feedView.center = CGPoint(x: viewOriginalCenter.x + translation.x, y: viewOriginalCenter.y)
//            
//            
//        }  else if (sender.state == UIGestureRecognizerState.Ended) {
//            
//            if velocity.x > 0 {
//                
//                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    self.feedView.center = self.viewRight
//                })
//                
//            } else {
//             
//                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    self.feedView.center.x = 160
//                })
//                
//            }
//        }
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewRightOffset = 270
        viewRight = CGPoint(x: feedView.center.x + viewRightOffset, y: feedView.center.y)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
