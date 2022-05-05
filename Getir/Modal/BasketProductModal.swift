//
//  BasketProductModal.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import Foundation
struct BasketProductModal {
   
    var product:ProductModal
    var basketCount:Int
    
    
    init(product: ProductModal, basketCount: Int) {
       self.product = product
       self.basketCount = basketCount
        
   }
   
    
    
}
