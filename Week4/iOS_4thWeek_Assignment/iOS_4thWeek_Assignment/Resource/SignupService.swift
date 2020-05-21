//
//  SignupService.swift
//  iOS_4thWeek_Assignment
//
//  Created by 김현기 on 2020/05/22.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import Alamofire


struct SignupService {
static let shared = SignupService() //싱글톤 객체로 앱 어디서든 접근 가능

    
//request body에 들어갈 파라미터 생성
    private func makeParameter(_ id: String, _ pwd: String, _ name: String, _ email: String, _ phone: String  ) -> Parameters {
        return ["id": id, "password": pwd, "name": name, "email": email, "phone": phone]
}
    
    func signup(id: String, pwd: String, name: String, email: String, phone: String , completion: @escaping (NetworkResult<Any>) -> Void){
    let header: HTTPHeaders = ["Content-Type": "application/json"] //request header 생성
    
        let dataRequest = Alamofire.request(APIConstants.signupURL, method: .post, parameters: makeParameter(id, pwd, name, email, phone), encoding:JSONEncoding.default, headers: header) //원하는 형식의 HTTP Request생성
    
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
    
    case 200: return isSignup(by: data)
    case 400: return .pathErr
    case 500: return .serverErr
    default: return .networkFail }

    }
  
    
//최종적으로 데이터 통신에 성공한 경우, JSON타입 디코딩을 실행 한 후 값을 화긴한다.
//가입된 유저인지 판별
private func isSignup(by data: Data) -> NetworkResult<Any> {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(SignupData.self, from: data) else { return .pathErr }
    
        if decodedData.success{
            return .success(data)
        }
        else {
            return .requestErr(decodedData.message)
        }
    }
    
}
