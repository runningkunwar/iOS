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
    @IBOutlet weak var moviePosterView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor.blackColor()
        // Do any additional setup after loading the view.
        if movie.posterUrl != "" {
            self.updateMovieView()
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateMovieView() {
        self.moviePosterView.setImageFromURL(movie.posterUrl)
    }

}
