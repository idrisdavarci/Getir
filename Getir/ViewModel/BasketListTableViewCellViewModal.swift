//
//  BasketListTableViewCellViewModal.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import Foundation
import UIKit

struct BasketListTableViewCellViewModal{
    
    
    var productName :String?
    let productImage:UIImage?
    var productDescription:String?
    var productMoney:Decimal
    var productNotDiscountMoney:Decimal
    var productAddTpe:productAddType
    var productNumberOfIncrease:Float
    var productDiscount:Decimal = 0.00;
    var productBasketCount :Float = 1 ;
    var productIsActive:Bool  = true
    var indexPath:Int  = 0;
    init(with model:BasketProductModal) {
        self.productName = model.product.productName
        self.productImage = UIImage(named: model.product.productImage ?? "getir")
        
        self.productName         = model.product.productName
        self.productDescription     = model.product.productDescription
        self.productMoney         = model.product.productMoney
        self.productNotDiscountMoney  = model.product.productNotDiscountMoney
        self.productAddTpe         = model.product.productAddTpe
        self.productNumberOfIncrease   = model.product.productNumberOfIncrease
        self.productDiscount        = model.product.productDiscount;
        self.productBasketCount      = Float(model.basketCount)
        
    }
}
