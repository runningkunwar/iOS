//
//  MovieService.swift
//  MovieKe
//
//  Created by Kunwar on 12/21/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import Foundation

typealias MoviesClosure = (movies : [Movie]) -> ()
typealias CompletionClosure = (dataDict: [String: AnyObject]) -> ()

class MovieService {
    let movieApi = RTAPI()
    
    func fetchMoviesInTheater(#completionBlock : MoviesClosure) -> Void {
        
        let api = movieApi.moviesInTheaterApi()
        var request:NSURLRequest
        if let apiUrl = NSURL(string: api) {
            request = NSURLRequest(URL: apiUrl)
            
            self.callApi(request, completionClosure: { (dataDict) -> () in
                //get movies from data
                var movies = self.movieApi.movieFromDict(dataDict)
                completionBlock(movies: movies)

            });
        }
        
    }
    

    func fetchUpcomingMovies() {
        
    }
    
    private func callApi(request: NSURLRequest, completionClosure: CompletionClosure) {
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response, data, error) -> Void in
            
            let jsonDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as [String: AnyObject]
    
            completionClosure(dataDict: jsonDict)
        }
    }
    
}