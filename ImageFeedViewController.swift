//
//  ImageFeedViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/23/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class ImageFeedViewController: UIViewController {

    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var banner: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = feedView
            .image!.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onXPress(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: {
            self.banner.alpha = 0;
            self.xButton.alpha = 0;
        })
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
