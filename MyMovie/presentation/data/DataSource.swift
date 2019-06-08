//
//  DataSource.swift
//  MyMovie
//
//  Created by Radhika Yusuf on 09/11/18.
//  Copyright © 2018 Radhika Yusuf. All rights reserved.
//

import Foundation


protocol DataSource {
    
    func loadMovie(callback: MovieCallback)
    
}

protocol MovieCallback {
    
    func onSuccess(data: [MovieModel])
    
    func onError(message: String?)
    
}
