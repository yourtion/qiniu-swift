//
//  QiNiuClient.swift
//  QiNiuPackageDescription
//
//  Created by YourtionGuo on 29/10/2017.
//

import Foundation
import CryptoSwift

public class QiNiuClient {

  private var accessKey:String
  private var secretKey:String

  init(accessKey: String, secretKey: String) {
    self.accessKey = accessKey;
    self.secretKey = secretKey
  }


  func sign(str: String) -> String {
    do {
      let hex = try HMAC(key: self.secretKey, variant: .sha1).authenticate([UInt8](str.utf8)).toBase64()
      return hex!
    } catch _ {
      return ""
    }
  }

  func accessToken(str: String) -> String {
    return self.accessKey + ":" + self.sign(str: str)
  }

  public func getBucketDomain(bucket: String, callback: @escaping ([String]) -> Void) {
    var request = URLRequest(url: URL(string: "https://api.qiniu.com/v6/domain/list?tbl=" + bucket)!)
    let token = self.accessToken(str: "/v6/domain/list?tbl=" + bucket + "\n")
    request.addValue("QBox " + token, forHTTPHeaderField: "Authorization")
    HTTPClient().sendRequest(request: request, callback: { error, data in
      print(String(data: data!, encoding: .utf8)!)
      guard let domains = try? JSONSerialization.jsonObject(with: data!) as! [String] else {
        return callback([])
      }
      callback(domains)
    })
  }
}
