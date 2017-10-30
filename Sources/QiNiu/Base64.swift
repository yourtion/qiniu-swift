//
//  Base64.swift
//  QiNiu
//
//  Created by YourtionGuo on 29/10/2017.
//

import Foundation

extension String {

  /// Safe base64 String encode
  ///
  /// - Returns: encoded base64 string
  func base64SafeEncode() -> String? {
    guard let utf8EncodeData = self.data(using: .utf8) else {
      return nil;
    }
    return utf8EncodeData.base64SafeEncode();
  }

  /// Safe base64 String decode
  ///
  /// - Returns: decoded base64 data
  func base64SafeDecode() -> Data? {
    let s = self.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/");
    return Data(base64Encoded: s);
  }
}

extension Data {

  /// Safe base64 Data encode
  ///
  /// - Returns: encoded base64 string
  func base64SafeEncode() -> String {
    let base64EncodedString = self.base64EncodedString();
    return base64EncodedString.replacingOccurrences(of: "/", with: "_").replacingOccurrences(of: "+", with: "-");
  }
}
