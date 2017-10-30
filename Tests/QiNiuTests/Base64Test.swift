import XCTest
@testable import QiNiu

class Base64Tests: XCTestCase {

  func testEncodeString() {
    let s = "你好/+=";
    XCTAssertEqual(s.base64SafeEncode(), "5L2g5aW9Lys9");
  }

  func testDecodeString() {
    let s = "5L2g5aW9Lys9";
    XCTAssertEqual(String(data: s.base64SafeDecode()!, encoding: .utf8), "你好/+=");
  }
  
}
