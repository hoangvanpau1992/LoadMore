//
//  DataServices.swift
//  LoadMore
//
//  Created by Trương Thắng on 3/31/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import Foundation


class DataServices {
    
    static let shared : DataServices = DataServices()
    private var _characters: [Characters]?
    
    var characters: [Characters] {
        set {
            _characters = newValue
        }
        get {
            if _characters == nil {
                updateChamps()
            }
            return _characters ?? []
        }
    }
    
    func updateChamps() {
        loadMoreChamps()
    }
    var isNeedLoadMore : Bool {
        return currentPage < totalPage
    }
    private let totalPage = 20
    private var currentPage = 0
    private var isLoading = false
    private var champUrl : URL? {
        return URL(string: "http://infomationchampion.pe.hu/showInfo.php?index=\(currentPage)&number=\(totalPage)")
    }
    
    func loadMoreChamps() {
        guard isLoading == false else {
            return
        }
        guard let url = champUrl else {return}
        isLoading = true
        if _characters == nil {
            _characters = []
        }
        let request = URLRequest(url: url)
        let downloadTask = URLSession.shared.dataTask(with: request){ (data, urlResponse, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let aData = data else {
                return
            }
            do {
                if let result = try JSONSerialization.jsonObject(with: aData) as? [Dictionary<AnyHashable, Any>] {
                    result.forEach({ (dictionary) in
                        self._characters?.append(Characters(dict: dictionary))
                    })
                    NotificationCenter.default.post(name: NotificationKey.didUpdateChamps, object: nil)
                    self.currentPage += 1
                    self.isLoading = false
                }
            } catch {
                print("Error")
            }
        }
        downloadTask.resume()
    }
}


struct NotificationKey {
    static var didUpdateChamps = Notification.Name(rawValue: "didUpdateChamps")
}

