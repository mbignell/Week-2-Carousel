//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/23/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeCarouselButton: UIButton!
    @IBOutlet weak var takeCarouselImage: UIImageView!
    @IBOutlet weak var takeCarouselView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        // Do any additional setup after loading the view.
        scrollView.delegate = self
        takeCarouselView.alpha = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            UIView.animateWithDuration(0.5, animations: {
                self.pageControl.alpha = 0
                self.takeCarouselView.alpha = 1
            })
        } else {
                self.pageControl.alpha = 1
                self.takeCarouselView.alpha = 0

        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        if page == 3 {
            UIView.animateWithDuration(0.5, animations: {
                self.pageControl.alpha = 1
                self.takeCarouselView.alpha = 0
            })
        } else {}
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
