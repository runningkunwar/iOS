//
//  RTAPI.swift
//  MovieKe
//
//  Created by Kunwar on 12/21/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//
//Rotten Tomatoes API

import Foundation

class RTAPI : MovieAPI{
    
    private func baseApiUrl() -> String {
        let baseApiUrl = "http://api.rottentomatoes.com/api/public/v1.0/"
        return baseApiUrl;
    }
    
    private func baseImageUrl() -> String {
        let baseImageUrl = "http://image.tmdb.org/t/p/w300"
        return baseImageUrl;
    }
    
    private func apiKey() -> String {
        let apiKey = "527a6pzhux8fkq2qq7yxcv6c"
        return apiKey;
    }
    
    func moviesInTheaterApi() -> String {
//        http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=527a6pzhux8fkq2qq7yxcv6c
//        http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=527a6pzhux8fkq2qq7yxcv6c
        let api = baseApiUrl() + "lists/movies/in_theaters.json?" + "apikey=" + apiKey()
        return api
    }
    
    func upcomingMovesApi() -> String {
        let api = baseApiUrl() + "movie/popular?" + "api_key=" + apiKey()
        return api
    }
    
    func movieFromDict(dict: [String: AnyObject]) -> [Movie] {
        var movies: [Movie] = []
        var movieArray = dict["movies"] as [NSDictionary]
        
        for movieDict in movieArray {
            var movie = Movie()
            movie.id = movieDict["id"] as String
            movie.title = movieDict["title"] as String
            
            if let posterDict: AnyObject = movieDict["posters"] {
                var poster = posterDict["original"] as String
                //this is a hack to get original movie poster.
                poster = poster.stringByReplacingOccurrencesOfString("tmb", withString: "org", options: NSStringCompareOptions.LiteralSearch, range: nil)
                
                movie.posterUrl = poster;
            }
            
            movies.append(movie)
        }
        
        
        return movies
    }

    
}