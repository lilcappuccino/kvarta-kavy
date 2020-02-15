//
//  ApiError.swift
//  KvartaKavy
//
//  Created by dewill on 15.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

public enum ApiError: Int, Error {
    case recieveNilResponse = 0,
    recieveNilBody,
    failedParse
}
