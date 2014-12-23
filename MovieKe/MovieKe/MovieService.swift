//
//  MovieService.swift
//  MovieKe
//
//  Created by Kunwar on 12/21/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import Foundation

typealias MoviesClosure = (movies : [Movie]) -> ()
typealias CompletionClosure = (data: AnyObject) -> ()

class MovieService {
    let movieApi = RTAPI()
    
    func fetchMoviesInTheater(#completionBlock : MoviesClosure) -> Void {
        
        let api = movieApi.moviesInTheaterApi()
        var request:NSURLRequest
        if let apiUrl = NSURL(string: api) {
            request = NSURLRequest(URL: apiUrl)
            
            callApi(request, completionClosure: { (data) -> () in
                
                completionBlock(movies: [])
                
            });
        }
        
    }
    

    func fetchUpcomingMovies() {
        
    }
    
    private func callApi(request: NSURLRequest, completionClosure: CompletionClosure) {
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response, data, error) -> Void in
            
            if let jsonObject: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) {

                completionClosure(data: jsonObject)
            }

        }
    }
    
}