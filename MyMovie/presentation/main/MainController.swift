//
//  MainController.swift
//  MyMovie
//
//  Created by Radhika Yusuf on 09/11/18.
//  Copyright © 2018 Radhika Yusuf. All rights reserved.
//

import UIKit
import Alamofire


class MainController: UIViewController, MovieCallback {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainProgress: UIActivityIndicatorView!
    
    
    let repository: Repository = Repository(remoteDataSource: RemoteDataSource())
    var mData = [MovieModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        mainProgress.startAnimating()
        repository.loadMovie(callback: self)
    }
    
    func onSuccess(data: [MovieModel]) {
        mData.removeAll()
        for i in 0...data.count - 1{
            mData.append(data[i])
        }
        tableView.reloadData()
        mainProgress.isHidden = true
    }
    
    func onError(message: String?) {
        
    }
    
    
    
}

extension MainController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMovie") as! MainTableViewCell
        cell.movieName.text = mData[indexPath.row].name ?? ""
        cell.movieOverview.text = mData[indexPath.row].overview ?? ""
        
        Alamofire.request("https://image.tmdb.org/t/p/w185_and_h278_bestv2" + (mData[indexPath.row].imageUrl ?? "")).responseData{ (response) in
            if response.error == nil {
                if let data = response.data {
                    cell.imageContent.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
    
}
