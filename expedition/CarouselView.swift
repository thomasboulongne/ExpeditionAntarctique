//
//  CarouselView.swift
//  expedition
//
//  Created by J.C Gigonnet on 03/06/2016.
//  Copyright © 2016 KLCT. All rights reserved.
//

import UIKit

class CarouselView: UIViewController {

    var pageIndex : Int = 0
    var imageFile : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImageView(image: UIImage(named: imageFile))
        image.frame = CGRectMake(0, 0, 383, self.view.frame.height)
        image.contentMode = UIViewContentMode.ScaleAspectFill
        image.clipsToBounds = true
        view.addSubview(image)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
