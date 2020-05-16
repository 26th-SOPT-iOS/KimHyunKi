//
//  LoginService.swift
//  iOS_SecondWeek_Assignment_Login
//
//  Created by 김현기 on 2020/05/16.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import Alamofire


struct LoginService {
static let shared = LoginService() //싱글톤 객체로 앱 어디서든 접근 가능

    
//request body에 들어갈 파라미터 생성
private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
    return ["id": id, "password": pwd]
}
    
func login(id: String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void){
    let header: HTTPHeaders = ["Content-Type": "application/json"] //request header 생성
    
    let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding:JSONEncoding.default, headers: header) //원하는 형식의 HTTP Request생성
    
    //encoding:JSONEncoding.default : JSON으로 인코딩 하겠다
    
    
    //데이터 통신 시작
    dataRequest.responseData { dataResponse in
        switch dataResponse.result {

        case .success:
            guard let statusCode = dataResponse.response?.statusCode else { return }
            guard let value = dataResponse.result.value else { return }
            let networkResult = self.judge(by: statusCode, value)
            completion(networkResult)

        case .failure: completion(.networkFail)
        }
        
    }
}

    
//satusCode에 따라 분기처리
private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
    
    switch statusCode {
    
    case 200: return isUser(by: data)
    case 400: return .pathErr
    case 500: return .serverErr
    default: return .networkFail }

    }
  
//최종적으로 데이터 동신에 성공한 경우, JSON타입 디코딩을 실행 한 후 값을 화긴한다.
private func isUser(by data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(SigininData.self, from: data) else { return .pathErr }
    guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
    return .success(tokenData.jwt)
    }
    
}

