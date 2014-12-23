//
//  MovieViewController.swift
//  MovieKe
//
//  Created by Kunwar on 12/9/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    var movie = Movie()
    var index: Int = 0
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    init(index: Int) {
        self.index = index
        super.init(nibName: "", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.showBorder()
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
