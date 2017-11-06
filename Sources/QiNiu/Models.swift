//
//  Models.swift
//  QiNiu
//
//  Created by YourtionGuo on 01/11/2017.
//

import Foundation

public struct FileItem : Codable {
  var key: String;
  var putTime: Int64;
  var hash: String;
  var fsize: Int64;
  var mimeType: String;
  var endUser: String?;
  var type: Int;
}

public struct BucketList : Codable {
  var marker: String?;
  var commonPrefixes: [String]?;
  var items: [FileItem]
}
