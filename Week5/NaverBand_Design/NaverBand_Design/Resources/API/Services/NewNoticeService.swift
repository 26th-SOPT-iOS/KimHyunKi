//
//  NewNoticeService.swift
//  NaverBand_Design
//
//  Created by 김현기 on 2020/06/12.
//  Copyright © 2020 HyunKi Kim. All rights reserved.
//

import Foundation
import Alamofire

class NewNoticeService {
    
    static let shared = NewNoticeService()
    
    func NewNotice(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let newNoticeURL = APIConstants.newNoticeURL
        
        Alamofire.request(newNoticeURL).responseJSON{
            response in
            
            switch response.result {
                
            case .success:
                if response.result.value != nil {
                    
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            guard let data = response.data else { return }
                            
                            do {
                                let decoder = JSONDecoder()
                                let object = try decoder.decode(NewNoticeData.self, from: data)
                                
                                if object.success == true {
                                    print("New notice 통신 성공!!!")
                                    completion(.success(object.data))
                                } else {
                                    print("통신 안 됨--;;")
                                }
                                
                            } catch (let err){
                                print(err.localizedDescription)
                                //                                completion(.failure(err))
                            }
                        case 400:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }// switch
                    }// if let
                }
                break
                
            // 통신 실패
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                print("NewNotice 통신 실패")
                // .networkFail이라는 반환 값이 넘어감
                break
                
            }
        }
        
    }
}
