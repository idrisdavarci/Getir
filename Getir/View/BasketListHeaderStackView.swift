//
//  BasketListHeaderStackView.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import UIKit

class BasketListHeaderStackView: UIStackView {
    
    let exitButton : UIButton = {
        let btn = UIButton();
     
        btn.setImage(UIImage(named: "closeBtn")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn;
    }()
    
    let basketTopTextLabel : UILabel = {
        let lbl = UILabel();
        lbl.text = "Sepetim";
        lbl.font =  UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        return lbl;
    }()
    
    let deleteButton : UIButton = {
        let btn = UIButton(type: .system);
        btn.setImage(UIImage(named: "deleteButton")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
       return btn;
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
         axis = .horizontal
         backgroundColor = UIColor(red: 0.36, green: 0.25, blue: 0.73, alpha: 1.00)
         heightAnchor.constraint(equalToConstant: 50).isActive = true
          [exitButton,basketTopTextLabel,deleteButton].forEach {(v) in
                addArrangedSubview(v)
            }
        
       
        exitButton.widthAnchor.constraint(equalToConstant: 50).isActive   = true
    
        basketTopTextLabel.textAlignment = .center
        deleteButton.widthAnchor.constraint(equalToConstant: 50).isActive  = true
      
         
        
        
    }

    required init(coder: NSCoder) {
        fatalError()
    }
    
  

}
