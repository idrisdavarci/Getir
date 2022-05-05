//
//  error.swift
//  Getir
//
//  Created by İdris Davarcı on 2.05.2022.
//

import Foundation


enum getirErrorError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
