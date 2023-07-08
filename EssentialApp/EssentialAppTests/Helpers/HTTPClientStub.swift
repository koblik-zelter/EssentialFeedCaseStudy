//
//  HTTPClientStub.swift
//  EssentialAppTests
//
//  Created by Alexandr Coblic-Zelter on 09.07.2023.
//

import Foundation
import EssentialFeed

final class HTTPClientStub: HTTPClient {
   private class Task: HTTPClientTask {
       func cancel() {}
   }

   private let stub: (URL) -> HTTPClient.Result

   init(stub: @escaping (URL) -> HTTPClient.Result) {
       self.stub = stub
   }

   func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask {
       completion(stub(url))
       return Task()
   }

   static var offline: HTTPClientStub {
       HTTPClientStub(stub: { _ in .failure(NSError(domain: "offline", code: 0)) })
   }

   static func online(_ stub: @escaping (URL) -> (Data, HTTPURLResponse)) -> HTTPClientStub {
       HTTPClientStub { url in .success(stub(url)) }
   }
}
