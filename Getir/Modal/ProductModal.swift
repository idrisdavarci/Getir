//
//  Product.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import Foundation

enum productAddType {
    case piace,weight
}


struct ProductModal {

    let productName :String?
    let productImage:String?
    let productDescription:String?
    let productMoney:Decimal
    let productNotDiscountMoney:Decimal
    let productAddTpe:productAddType
    let productNumberOfIncrease:Float
    var productDiscount:Decimal = 0.00;
    
    init(productName: String?, productImage: String?, productDescription: String?, productMoney: Decimal = 0.00, productNotDiscountMoney: Decimal = 0.00, productAddTpe: productAddType, productNumberOfIncrease: Float) {
        self.productName = productName
        self.productImage = productImage
        self.productDescription = productDescription
        self.productMoney = productMoney
        self.productNotDiscountMoney = productNotDiscountMoney
        self.productAddTpe = productAddTpe
        self.productNumberOfIncrease = productNumberOfIncrease
        
        let discount = productNotDiscountMoney - productMoney;
        
        if (discount > self.productDiscount){
            self.productDiscount = discount;
    }
    
}
    
}
