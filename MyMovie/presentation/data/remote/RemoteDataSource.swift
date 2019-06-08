//
//  RemoteDataSource.swift
//  MyMovie
//
//  Created by Radhika Yusuf on 09/11/18.
//  Copyright © 2018 Radhika Yusuf. All rights reserved.
//

import Foundation
import Alamofire


class RemoteDataSource: DataSource {
    
    static let API_KEY = "983e2812b719e865d53ccf59c73d7624"
    static let BASE_URL = "https://api.themoviedb.org/3/"
    
    func loadMovie(callback: MovieCallback) {
        var movies = [MovieModel]()
        Alamofire.request(RemoteDataSource.BASE_URL + "movie/popular",
                          method: .get,
                          parameters: [
                            "api_key": RemoteDataSource.API_KEY,
                            "language" : "en-US"
            ]).responseJSON{ response in
                if let json = response.result.value{
                    print(json)
                    let baseMovieResponse: NSObject = json as! NSObject
                    let arrayResult: NSArray = baseMovieResponse.value(forKey: "results") as! NSArray
                
                    for i in 0...arrayResult.count - 1{
                        movies.append(
                            MovieModel(
                                name: (arrayResult[i] as AnyObject).value(forKey: "original_title") as! String?,
                                imageurl: (arrayResult[i] as AnyObject).value(forKey: "poster_path") as! String?,
                                overview: (arrayResult[i] as AnyObject).value(forKey: "overview") as! String?
                            )
                        )
                    }
                    
                    callback.onSuccess(data: movies)
                }
                
        }
    }
}
