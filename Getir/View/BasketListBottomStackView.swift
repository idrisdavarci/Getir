//
//  BasketListBottomStackView.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import UIKit

class BasketListBottomStackView: UIStackView {

  
    
    let GoPaymentButton : UIButton = {
        let btn = UIButton(type: .system);
        btn.setTitle("Devam", for: .normal)
        btn.backgroundColor  = UIColor(red: 0.36, green: 0.25, blue: 0.73, alpha: 1.00)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Bold", size: 17)!
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true;
        btn.layer.cornerRadius = 5
        
       return btn;
    }()
    
    
    
    let totalMoneyLabel : UILabel = {
        let lbl = UILabel();
        lbl.text = "₺15.60";
        lbl.font  = UIFont(name: "AvenirNextCondensed-Bold", size: 22)!
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor(red: 0.36, green: 0.25, blue: 0.73, alpha: 1.00)
        lbl.textAlignment  = .center
        return lbl;
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         
           axis = .horizontal
     
          [GoPaymentButton,totalMoneyLabel].forEach {(v) in   addArrangedSubview(v)   }
        
        layer.cornerRadius  = 5
        totalMoneyLabel.widthAnchor.constraint(equalTo: GoPaymentButton.widthAnchor, multiplier: 0.7, constant: 0).isActive = true
         
        
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    

}
