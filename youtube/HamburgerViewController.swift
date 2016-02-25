//
//  HamburgerViewController.swift
//  youtube
//
//  Created by Sam Huskins on 2/24/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var menuImageView: UIView!
    @IBOutlet weak var feedImageView: UIView!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    
    var viewOriginalCenter: CGPoint!
    var viewRightOffset: CGFloat!
    var viewRight: CGPoint!
    

    

    
    func convertValue(value: CGFloat, r1Min: CGFloat, r1Max: CGFloat, r2Min: CGFloat, r2Max: CGFloat) -> CGFloat {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    



    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
        feedViewController = storyboard.instantiateViewControllerWithIdentifier("FeedViewController")
        

        // Do any additional setup after loading the view.
    }

    @IBAction func panGestureRecognizer(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)

        if (sender.state == UIGestureRecognizerState.Began) {
            print(feedImageView.center.x)
            viewOriginalCenter = feedImageView.center
            
            var feedTransform = CATransform3DIdentity;
            feedTransform = CATransform3DRotate(feedTransform, CGFloat(45 * M_PI / 180), 0, 1, 0)
            feedImageView.layer.transform = feedTransform
            setAnchorPoint(CGPoint(x: 1.0, y: 0.5), forView: feedImageView)
            
            var animation = CABasicAnimation(keyPath: "transform")
            animation.toValue = NSValue(CATransform3D:feedTransform)
            animation.duration = 3
            
            feedImageView.layer.addAnimation(animation, forKey: "transform")

            
        }  else if (sender.state == UIGestureRecognizerState.Changed) {
            //var scale = convertValue(feedImageView.center.x, r1Min: 160, r1Max: 430, r2Min: 0.9, r2Max: 1)
            feedImageView.center = CGPoint(x: viewOriginalCenter.x + translation.x, y: viewOriginalCenter.y)
            
            // menuImageView.transform = CGAffineTransformMakeScale(scale, scale)


        }  else if (sender.state == UIGestureRecognizerState.Ended) {
            
            if velocity.x > 0 {
                
//                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    self.feedImageView.center = self.viewRight
//                    self.menuImageView.transform = CGAffineTransformMakeScale(1, 1)
//
//                })

                
            } else {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.feedImageView.center.x = 160
                    self.menuImageView.transform = CGAffineTransformMakeScale(0.9,0.9)

                })
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = CGPointApplyAffineTransform(newPoint, view.transform)
        oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform)
        
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
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
