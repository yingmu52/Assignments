//
//  Auth0.swift
//  Authentication
//
//  Created by Xinyi Zhuang on 16/11/2017.
//  Copyright © 2017 Xinyi Zhuang. All rights reserved.
//

import Foundation
import Alamofire

struct Service {
  static func signup(email: String, pass: String, callback: @escaping (String, Bool) -> Void) {
    let r = Router.signup
    var payload = r.payloadFor(email: email, pass: pass)
    payload["scope"] = "openid profile email"
    Alamofire.request(r.url, method: .post, parameters: payload).responseJSON { (resp) in
      guard
        let result = resp.result.value as? [String:Any],
        let code = resp.response?.statusCode else {
          callback("error", false)
          return
      }
      switch code {
      case 200:
        callback("OK", true)
      case 400:
        let desc = result["description"] as? String
        callback(desc ?? "error", false)
      default:
        callback("error", false)
      }
    }
  }

  static func login(email: String, pass: String, callback: @escaping (String, Bool) -> Void) {
    let r = Router.login
    var payload = r.payloadFor(email: email, pass: pass)
    payload["grant_type"] = "password"
    Alamofire.request(r.url, method: .post, parameters: payload).responseJSON { (resp) in
      guard
        let result = resp.result.value as? [String:Any],
        let code = resp.response?.statusCode else {
          callback("error", false)
          return
      }
      print(result)
      switch code {
      case 200:
        // TODO: store the session
        callback("OK", true)
      default:
        let desc = result["error_description"] as? String
        callback(desc ?? "error", false)
      }
    }
  }
}

enum Router: String {
  case signup = "/dbconnections/signup"
  case login = "/oauth/ro"
  var url: String {
    return "https://qileap.auth0.com" + self.rawValue
  }

  func payloadFor(email: String, pass: String) -> [String: String] {
    let usernameOrEmailKey = self == .signup ? "email" : "username"
    return [
      usernameOrEmailKey: email,
      "password": pass,
      "connection" : "Username-Password-Authentication",
      "client_id" : "DzX5Np7PyEXMnziG8F3peNnVXhVjJboN",
    ]
  }
}

