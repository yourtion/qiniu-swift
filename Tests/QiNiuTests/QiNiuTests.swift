import XCTest
@testable import QiNiu

class QiNiuTests: XCTestCase {

  private var apiKey = ProcessInfo.processInfo.environment["ACCESS_KEY"] ?? "MY_ACCESS_KEY"
  private var apiSecret = ProcessInfo.processInfo.environment["SECRET_KEY"] ?? "MY_SECRET_KEY"
  private var bucket = ProcessInfo.processInfo.environment["BUCKET"] ?? "BUCKET"

  func testSign() {
    let sign = QiNiuClient(accessKey: "MY_ACCESS_KEY", secretKey: "MY_SECRET_KEY")
      .sign(str: "/move/bmV3ZG9jczpmaW5kX21hbi50eHQ=/bmV3ZG9jczpmaW5kLm1hbi50eHQ=\n")
    XCTAssertEqual(sign, "FXsYh0wKHYPEsIAgdPD9OfjkeEM=");
  }

  func testAccessToken() {
    let token = QiNiuClient(accessKey: "MY_ACCESS_KEY", secretKey: "MY_SECRET_KEY")
      .accessToken(str: "/move/bmV3ZG9jczpmaW5kX21hbi50eHQ=/bmV3ZG9jczpmaW5kLm1hbi50eHQ=\n")
    XCTAssertEqual(token, "MY_ACCESS_KEY:FXsYh0wKHYPEsIAgdPD9OfjkeEM=");
  }

  func testGetBucketDomain() {
    let expectation = self.expectation(description: "testGetBucketDomain")

    QiNiuClient(accessKey: self.apiKey, secretKey: self.apiSecret)
      .getBucketDomain(bucket: self.bucket, callback: {domains in
        XCTAssertGreaterThan(domains.count, 0)
        expectation.fulfill()
      });

    waitForExpectations(timeout: 15.0, handler: nil)
  }
}

extension QiNiuTests {
  static var allTests : [(String, (QiNiuTests) -> () throws -> Void)] {
    return [
    ]
  }
}
