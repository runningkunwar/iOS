//
//  MoviesViewController.swift
//  MovieKe
//
//  Created by Kunwar on 12/4/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UIPageViewControllerDataSource {
    var pageViewController = UIPageViewController()
    var movies: Array<Movie> = []
    let movieService = MovieService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.showBorder()
        
        var movieViewController = MovieViewController(index: 0)
        pageViewController.setViewControllers([movieViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true) { (complete) -> Void in
        }
        pageViewController.dataSource = self
        pageViewController.view.showBorderWithColor(UIColor.greenColor())
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        
        movieService.fetchMoviesInTheater { (movies) -> () in
            self.movies = movies
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let currentMovieController = viewController as MovieViewController
        let currentIndex = currentMovieController.index
        
        if (currentIndex == 0){
            return nil
        }
        
        let index = currentIndex - 1
        let movieViewController = MovieViewController(index: index)
        movieViewController.movie = self.movies[index]
        
        return movieViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentMovieController = viewController as MovieViewController
        let currentIndex = currentMovieController.index
        
        if (currentIndex == self.movies.count - 1){
            return nil
        }
        
        let index = currentIndex + 1
        let movieViewController = MovieViewController(index: index)
        movieViewController.movie = self.movies[index]
        
        return movieViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.movies.count;
    }
    
}
