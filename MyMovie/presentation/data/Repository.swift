//
//  Repository.swift
//  MyMovie
//
//  Created by Radhika Yusuf on 09/11/18.
//  Copyright © 2018 Radhika Yusuf. All rights reserved.
//

import Foundation

class Repository : DataSource {
    
    
    var remoteDataSource: DataSource
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func loadMovie(callback: MovieCallback) {
        remoteDataSource.loadMovie(callback: callback)
    }

    
}
