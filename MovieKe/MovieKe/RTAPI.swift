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
    
}