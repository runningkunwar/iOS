//
//  TMDBAPI.swift
//  MovieKe
//
//  Created by Kunwar on 12/21/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//
//themoviedb API

import Foundation


class TMDBAPI : MovieAPI{
    
    private func baseApiUrl() -> String {
        let baseApiUrl = "http://api.themoviedb.org/3/"
        return baseApiUrl;
    }
    
    private func baseImageUrl() -> String {
        let baseImageUrl = "http://image.tmdb.org/t/p/w300"
        return baseImageUrl;
    }
    
    private func apiKey() -> String {
        let apiKey = "0e3feb05ea5ca313c072a0946bd9d29c"
        return apiKey;
    }
    
    func moviesInTheaterApi() -> String {
        let api = baseApiUrl() + "movie/popular?" + "api_key=" + apiKey()
        return api
    }
    
    func upcomingMovesApi() -> String {
        let api = baseApiUrl() + "movie/popular?" + "api_key=" + apiKey()
        return api
    }
 
    func movieFromDict([String: AnyObject]) -> Movie {
        
        return Movie()
    }
    
    func movieFromDict(dict: [String: AnyObject]) -> [Movie] {
        var movies: [Movie] = []
        var movieArray = dict["movies"] as [NSDictionary]
        
        for movieDict in movieArray {
            var movie = Movie()
            movie.id = dict["id"] as String
            movie.title = dict["title"] as String
            
            if let posterDict: AnyObject = dict["posters"] {
                var poster = posterDict["original"] as String
                //this is a hack to get original movie poster.
                poster.stringByReplacingOccurrencesOfString("tmb", withString: "org", options: NSStringCompareOptions.LiteralSearch, range: nil)
                
                movie.posterUrl = poster;
            }
            
            movies.append(movie)
        }
        
        
        return movies
    }

}