//
//  Movie.swift
//  MovieKe
//
//  Created by Kunwar on 12/4/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import Foundation

class Movie {
    var title = ""
    var id = 0
    var posterUrl = ""
    
    class func movieWithDictionary(dictionary: [String : AnyObject])-> Movie {
        var movie = Movie()
        
        
        return movie;
    }
}

//{
//"page": 1,
//"results": [
//{
//"adult": false,
//"backdrop_path": "/wBZ9jtFrsxth4VQA724TeBb5T2L.jpg",
//"id": 198663,
//"original_title": "The Maze Runner",
//"release_date": "2014-09-19",
//"poster_path": "/coss7RgL0NH6g4fC2s5atvf3dFO.jpg",
//"popularity": 47.8332349712059,
//"title": "The Maze Runner",
//"vote_average": 7.4,
//"vote_count": 426
//},
//
//
//}