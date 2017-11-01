//
//  HTTPClient.swift
//  QiNiuPackageDescription
//
//  Created by YourtionGuo on 29/10/2017.
//

import Foundation

class HTTPClient {

  func sendRequest(request: URLRequest,callback: @escaping (String?, Data?) -> Void) {

    let task = URLSession.shared.dataTask(with: request, completionHandler : {
      data, response, error in
      if error != nil {
        callback((error!.localizedDescription) as String, nil)
      } else {
        callback(nil, data)
      }
    })

    task.resume()
  }

  func get(url: String, callback: @escaping (String?, String) -> Void) {
    let request = URLRequest(url: URL(string: url)!)
    sendRequest(request: request, callback: { error, data in
      if error != nil {
        callback(error, "")
      } else {
        callback(nil, String(data: data!, encoding: .utf8)!)
      }
    })
  }
}
