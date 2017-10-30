import XCTest
@testable import QiNiu

class Base64Tests: XCTestCase {

  func testEncodeString() {
    let s = "你好/+=";
    XCTAssert(s.base64SafeEncode() == "5L2g5aW9Lys9", "Pass");
  }

  func testDecodeString() {
    let s = "5L2g5aW9Lys9";
    XCTAssert(String(data: s.base64SafeDecode()!, encoding: .utf8) == "你好/+=", "Pass");
  }
  
}
