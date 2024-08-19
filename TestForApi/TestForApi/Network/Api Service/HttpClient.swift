//
//  HttpClient.swift
//  TestForApi
//
//  Created by Habibur Rahman on 17/8/24.
//

import Foundation

enum ApiError: LocalizedError {
    case InvalidURL
    case NetworkError
    case JsonParsingFailure
    case ErrorStatusCode
    case Custom(message: String)

    var errorDescription: String {
        switch self {
            case .InvalidURL:
                return NSLocalizedString("The URL provided was invalid.", comment: "")
            case .NetworkError:
                return NSLocalizedString("Please check your connection!", comment: "")
            case .JsonParsingFailure:
                return NSLocalizedString("There was an error parsing the JSON data.", comment: "")
            case .ErrorStatusCode:
                return NSLocalizedString("Wrong Status Code ", comment: "")
            case let .Custom(message):
                return NSLocalizedString(message, comment: "")
        }
    }
}

class HttpClient {

    let apiHelper = APIHelper.shared
    
    func callApi(request : URLRequest, shouldPrintDebug : Bool = true) async throws -> (Data, URLResponse) {
        if Reachable.isConnectedToNetwork() == false {
            throw ApiError.NetworkError
        }


        let (data, response) = try await URLSession.shared.data(for: request)

        if shouldPrintDebug{
            debugPrint("U>> url \(String(describing: request.url))  --- response")
            debugPrint(data.prettyString ?? "")
        }
       

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            debugPrint("U>> url \(request.url)  --- Error statuscode \(String(describing: (response as? HTTPURLResponse)?.statusCode))")
            throw ApiError.ErrorStatusCode
        }

        return (data, response)
    }

//    func post(url: String, body: Data?, formData: [String: Any]?) async throws -> (Data, URLResponse) {
//        if Reachable.isConnectedToNetwork() == false {
//            throw ApiError.NetworkError
//        }
//
//        guard let url = URL(string: url) else {
//            throw ApiError.InvalidURL
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
////        request.setValue(getStoredCookie(), forHTTPHeaderField: "Cookie")
//
//        prepareFormDataInRequest(request: &request, formData: formData)
//
//        let (data, response) = try await URLSession.shared.data(for: request)
//
//        debugPrint("U>> url \(url)  --- response")
//        debugPrint(data.prettyString)
//
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw ApiError.ErrorStatusCode
//        }
//
//        return (data, response)
//    }
}

extension Data {

    var prettyString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}

final class ResponseParser {

    func parseResponse<T: Codable>(from data: Data) throws -> T? {
        let decoder = JSONDecoder()

        do {
            return try decoder.decode(T.self, from: data)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Decoding error (keyNotFound): \(key) not found in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.dataCorrupted(context) {
            print("Decoding error (dataCorrupted): data corrupted in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Decoding error (typeMismatch): type mismatch of \(type) in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(type, context) {
            print("Decoding error (valueNotFound): value not found for \(type) in \(context.debugDescription)")
            print("Coding path: \(context.codingPath)")
        }

        return nil
    }
}
