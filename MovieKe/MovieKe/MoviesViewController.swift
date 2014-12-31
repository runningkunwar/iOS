//
//  MoviesViewController.swift
//  MovieKe
//
//  Created by Kunwar on 12/4/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UIPageViewControllerDataSource {
    var pageViewController: UIPageViewController = UIPageViewController()
    var movies: Array<Movie> = []
    let movieService = MovieService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        
        movieService.fetchMoviesInTheater { (movies) -> () in
            self.movies += movies
            
            self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
            
            var movieViewController = self.pageContentViewControllerAtIndex(0)
            movieViewController.movie = movies[0]
            self.pageViewController.setViewControllers([movieViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true) { (complete) -> Void in
            }
            
            self.pageViewController.dataSource = self
            
            self.addChildViewController(self.pageViewController)
            self.view.addSubview(self.pageViewController.view)
            self.pageViewController.didMoveToParentViewController(self)
        }
    }
    
     override func viewWillAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pageContentViewControllerAtIndex(index: Int) -> MovieViewController {
        var movieViewController: MovieViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MovieViewController") as MovieViewController
        movieViewController.index = index
        return movieViewController
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
        var movieViewController = self.pageContentViewControllerAtIndex(index)
        movieViewController.movie = self.movies[index]
        movieViewController.title = String(index)

        return movieViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentMovieController = viewController as MovieViewController
        let currentIndex = currentMovieController.index
        
        if (currentIndex == self.movies.count - 1){
            return nil
        }
        
        let index = currentIndex + 1
        var movieViewController = self.pageContentViewControllerAtIndex(index)
        movieViewController.movie = self.movies[index]

        return movieViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.movies.count;
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
       return 0
    }
}
