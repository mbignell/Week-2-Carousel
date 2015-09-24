//
//  IntroViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/22/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var backgroundIntroImageView: UIImageView!
    @IBOutlet weak var bunnyEarsImage: UIImageView!
    @IBOutlet weak var deerImage: UIImageView!
    @IBOutlet weak var cabinImage: UIImageView!
    @IBOutlet weak var lakeImage: UIImageView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var fishImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = backgroundIntroImageView
            .image!.size
        // Do any additional setup after loading the view.
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
