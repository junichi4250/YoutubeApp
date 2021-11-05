//
//  APIRequest.swift
//  YoutubeApp
//
//  Created by kato junichi on 2021/11/05.
//

import Foundation
import Alamofire

class APIRequest {
    
    enum PathType: String {
        case search
        case channels
    }
    
    static var shared = APIRequest()
    
    private let baseUrl = "https://www.googleapis.com/youtube/v3/"
    
    func request<T: Decodable>(path: PathType, params: [String: Any], type: T.Type, completion: @escaping (T) -> Void) {
        let path = path.rawValue
        let url = baseUrl + path + "?"
        
        var params = params
        params["key"] = "YOUR_API_KEY"
        params["part"] = "snippet"
        
        let request = AF.request(url, method: .get, parameters: params)
        
        request.responseJSON { (response) in
            do {
                guard let data = response.data else { return }
                let decode = JSONDecoder()
                let value = try decode.decode(T.self, from: data)

                completion(value)
            } catch {
                print("変換に失敗しました。：", error)
            }
        }
    }
    
}
