//
//  FineDustAPI.swift
//  FineDust
//
//  Created by lee on 2021/01/27.
//

import Moya

enum FineDustAPI {
    case getFineDust(versionCode: Int,lat: Double,lon: Double)
}


extension FineDustAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.weatherplanet.co.kr")!
    }
    
    var path: String {
        switch self {
        case .getFineDust:
            return "/weather/dust"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getFineDust(let versionCode, let lat, let lon):
            return .requestParameters(parameters: ["version":versionCode,"lat":lat,"lon":lon], encoding: URLEncoding.queryString)
        }
    }
    var headers: [String : String]? {
        return ["appKey": "6b200e091d1a4d7e83fb9b4732809b33"]
    }
}
