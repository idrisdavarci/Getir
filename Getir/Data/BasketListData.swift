//
//  BasketListData.swift
//  Getir
//
//  Created by İdris Davarcı on 3.05.2022.
//

import Foundation
import UIKit

struct BasketListData {
  
    let bottomView = BasketListFootherView();
    
    public func config(view:UIView, tableView:UITableView){
        //Mark - Basket Top
        let basketListTopStackView = BasketListHeaderStackView();
       
        
        //Mark - Basket Container
        let basketListStackView = UIStackView(arrangedSubviews: [basketListTopStackView,tableView])
        basketListStackView.axis = .vertical
        view.addSubview(basketListStackView)
         
        basketListStackView.translatesAutoresizingMaskIntoConstraints = false
        basketListStackView.fillAreaSuperView()
         
         
        //Mark - Basket Foother
         
         view.addSubview(bottomView)
        bottomView.anchor(top: nil, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, size: .init(width: view.frame.width, height: 100))

        
    }
     
  public func getData()-> [BasketProductModal]
    {
        
        var BasketList     = [BasketProductModal]();
        
        BasketList.append(BasketProductModal ( product: ProductModal(
            productName: "Hyalüronik asit duş jeli ",
            productImage: "product1",
            productDescription: "500ml",
            productMoney: 15.00,
            productNotDiscountMoney: 15.00,
            productAddTpe: .piace,
            productNumberOfIncrease:1
        ),basketCount: 1));
        
        
        
        BasketList.append(BasketProductModal ( product: ProductModal(
            productName: "Herby Detox Tea Kayısılı",
            productImage: "product2",
            productDescription: "20'li",
            productMoney: 25,
            productNotDiscountMoney: 27.50,
            productAddTpe: .piace,
            productNumberOfIncrease:1
        ),basketCount: 1));
        
        
        BasketList.append(BasketProductModal ( product: ProductModal(
            productName: "Elidor Güçlü ve Parlak",
            productImage: "product3",
            productDescription: "400ml",
            productMoney: 35,
            productNotDiscountMoney:50,
            productAddTpe: .piace,
            productNumberOfIncrease:1
        ),basketCount: 1));
        
        
        BasketList.append(BasketProductModal ( product: ProductModal(
            productName: "Beauty Bar Sabun",
            productImage: "product4",
            productDescription: "800ml",
            productMoney: 35,
            productNotDiscountMoney:55,
            productAddTpe: .piace,
            productNumberOfIncrease:1
        ),basketCount: 1));
        
        
        
        BasketList.append(BasketProductModal ( product: ProductModal(
            productName: "Finish Parlatıcı",
            productImage: "product5",
            productDescription: "800ml",
            productMoney: 29.75,
            productNotDiscountMoney:29.75,
            productAddTpe: .piace,
            productNumberOfIncrease:1
        ),basketCount: 1));
        
        
        
        BasketList.append(BasketProductModal ( product: ProductModal(
            productName: "Finish Parlatıcı",
            productImage: "product5",
            productDescription: "800ml",
            productMoney: 29.75,
            productNotDiscountMoney:29.75,
            productAddTpe: .piace,
            productNumberOfIncrease:1
        ),basketCount: 1));
        
         
        
        return BasketList;
    }
}
