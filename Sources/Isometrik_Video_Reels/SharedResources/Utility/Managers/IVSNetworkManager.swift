//
//  IVSNetworkManager.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 27/01/25.
//

import Foundation
import UIKit

enum IVSHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

struct IVSAPIError: Error {
    let message: String
}

protocol IVSURLConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: IVSHTTPMethod { get }
    var queryParams: [String: String]? { get }
    var headers: [String: String]? { get }
}

extension IVSURLConvertible {
    func makeRequest() -> URLRequest? {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = queryParams?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents?.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return request
    }
}

struct IVSAPIRequest<R> {
    let endPoint: IVSURLConvertible
    let requestBody: R?
}

struct IVSAPIManager {
    static func sendRequest<T: Codable, R: Any>(request: IVSAPIRequest<R>, showLoader: Bool = true, completion: @escaping (_ result: IVSResult<T, IVSReelsAPIError>) -> Void) {
        if showLoader {
            DispatchQueue.main.async { /*IVSLoaderView.show() */}
        }
        
        var urlComponents = URLComponents(url: request.endPoint.baseURL.appendingPathComponent(request.endPoint.path), resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = request.endPoint.queryParams?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents?.url else {
            completion(.failure(.invalidResponse))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.endPoint.method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.endPoint.headers?.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        if let requestBody = request.requestBody as? Codable {
            do {
                let jsonBody = try JSONEncoder().encode(requestBody)
                urlRequest.httpBody = jsonBody
            } catch {
                completion(.failure(.invalidResponse))
                DispatchQueue.main.async { IVSLoaderView.hide() }
                return
            }
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                DispatchQueue.main.async { IVSLoaderView.show() }
                return
            }
            
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print(jsonObject)
            }
            
            switch httpResponse.statusCode {
            case 200:
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(responseObject, nil))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            case 404:
                completion(.failure(.httpError(httpResponse.statusCode)))
            case 401, 406:
                completion(.failure(.tokenExpired))
            default:
                completion(.failure(.httpError(httpResponse.statusCode)))
            }
            
            if showLoader {
                DispatchQueue.main.async { IVSLoaderView.hide() }
            }
        }
        
        task.resume()
    }
}

enum IVSReelsAPIError: Error {
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
    case tokenExpired
    case httpError(Int)
}

public struct IVSErrorMessage: Codable {
    public let error: String?
    public let errorCode: Int?
}

public enum IVSResult<T, ErrorData> {
    case success(T, Data?)
    case failure(ErrorData)
}

//class NativeLoader {
//    static let shared = NativeLoader()
//    private var spinner: UIActivityIndicatorView?
//    
//    func startLoading() {
//        DispatchQueue.main.async {
//            guard let window = UIApplication.shared.windows.first else { return }
//            let spinner = UIActivityIndicatorView(style: .large)
//            spinner.center = window.center
//            spinner.startAnimating()
//            window.addSubview(spinner)
//            self.spinner = spinner
//        }
//    }
//    
//    func stopLoading() {
//        DispatchQueue.main.async {
//            self.spinner?.stopAnimating()
//            self.spinner?.removeFromSuperview()
//            self.spinner = nil
//        }
//    }
//}
