//
//  MovieModel.swift
//  MyMovie
//
//  Created by Radhika Yusuf on 09/11/18.
//  Copyright © 2018 Radhika Yusuf. All rights reserved.
//

import Foundation


class MovieModel {
    
    var name: String?
    var imageUrl: String?
    var overview: String?
    
    
    init(name: String?, imageurl: String?, overview: String?) {
        self.name = name
        self.imageUrl = imageurl
        self.overview = overview
    }
    
}
