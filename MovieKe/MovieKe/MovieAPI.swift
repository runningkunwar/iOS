//
//  MovieAPI.swift
//  MovieKe
//
//  Created by Kunwar on 12/21/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import Foundation

protocol MovieAPI {
    
    func moviesInTheaterApi() -> String
    func upcomingMovesApi() -> String
    func movieFromDict(dict: [String: AnyObject]) -> [Movie];
}