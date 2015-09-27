//
//  IntroViewController.swift
//  Carousel
//
//  Created by Margaret Bignell on 9/22/15.
//  Copyright © 2015 maggled. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var backgroundIntroImageView: UIImageView!
    @IBOutlet weak var bunnyEarsImage: UIImageView!
    @IBOutlet weak var deerImage: UIImageView!
    @IBOutlet weak var cabinImage: UIImageView!
    @IBOutlet weak var lakeImage: UIImageView!
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var fishImage: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = backgroundIntroImageView
            .image!.size
        scrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        //content offset: 0 ->568
        // x offset: -30->0
        // y offsetL -285->0
        
        print("content offset: \(scrollView.contentOffset.y)")
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -80, r2Max: 0)
        let ty = convertValue(offset, r1Min: 0.0, r1Max: 568.0, r2Min: -285, r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        bunnyEarsImage.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        bunnyEarsImage.transform = CGAffineTransformScale(bunnyEarsImage.transform, CGFloat(scale), CGFloat(scale))
        bunnyEarsImage.transform = CGAffineTransformRotate(bunnyEarsImage.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        let tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 45, r2Max: 0)
        let ty2 = convertValue(offset, r1Min: 0.0, r1Max: 568.0, r2Min: -270, r2Max: 0)
        let scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        deerImage.transform = CGAffineTransformMakeTranslation(CGFloat(tx2), CGFloat(ty2))
        deerImage.transform = CGAffineTransformScale(deerImage.transform, CGFloat(scale2), CGFloat(scale2))
        deerImage.transform = CGAffineTransformRotate(deerImage.transform, CGFloat(Double(rotation2) * M_PI / 180))
        
        let tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 85, r2Max: 0)
        let ty3 = convertValue(offset, r1Min: 0.0, r1Max: 568.0, r2Min: -400, r2Max: 0)
        let scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        let rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        lakeImage.transform = CGAffineTransformMakeTranslation(CGFloat(tx3), CGFloat(ty3))
        lakeImage.transform = CGAffineTransformScale(lakeImage.transform, CGFloat(scale3), CGFloat(scale3))
        lakeImage.transform = CGAffineTransformRotate(lakeImage.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
        let tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 30, r2Max: 0)
        let ty4 = convertValue(offset, r1Min: 0.0, r1Max: 568.0, r2Min: -418, r2Max: 0)
        let scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        fishImage.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
        fishImage.transform = CGAffineTransformScale(fishImage.transform, CGFloat(scale4), CGFloat(scale4))
        fishImage.transform = CGAffineTransformRotate(fishImage.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
        let tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -110, r2Max: 0)
        let ty5 = convertValue(offset, r1Min: 0.0, r1Max: 568.0, r2Min: -500, r2Max: 0)
        let scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.8, r2Max: 1)
        let rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        cabinImage.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
        cabinImage.transform = CGAffineTransformScale(cabinImage.transform, CGFloat(scale5), CGFloat(scale5))
        cabinImage.transform = CGAffineTransformRotate(cabinImage.transform, CGFloat(Double(rotation5) * M_PI / 180))
        
        let tx6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -80, r2Max: 0)
        let ty6 = convertValue(offset, r1Min: 0.0, r1Max: 568.0, r2Min: -470, r2Max: 0)
        let scale6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.8, r2Max: 1)
        let rotation6 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        dogImage.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
        dogImage.transform = CGAffineTransformScale(dogImage.transform, CGFloat(scale6), CGFloat(scale6))
        dogImage.transform = CGAffineTransformRotate(dogImage.transform, CGFloat(Double(rotation6) * M_PI / 180))

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
