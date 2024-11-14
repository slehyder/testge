//
//  MainErrorResponse.swift
//  test
//
//  Created by Slehyder Martinez on 13/11/24.
//

import Foundation

struct MainErrorResponse : BaseErrorResponse {
    
    var error: [String]
    
    var errorType: ResponseErrorType?
    
    static func cathError(error: Any? = nil) -> MainErrorResponse {
        var message: [String] = ["An unexpected error has occurred, please try again later."]
        var errorType = ResponseErrorType.none
        
        if error is BaseError {
            let baseError = (error as! BaseError)
            if (baseError.statusCode == 403) {
                if !(baseError.message ?? []).isEmpty {
                    message = baseError.message ?? []
                }
                errorType = ResponseErrorType.unauthorized
            } else {
                if !(baseError.message ?? []).isEmpty {
                    message = baseError.message ?? []
                }
                errorType = ResponseErrorType.badRequest
            }
        }
        
        return MainErrorResponse(error: message, errorType: errorType)
    }
}
