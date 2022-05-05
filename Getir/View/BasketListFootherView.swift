//
//  BasketListFootherView.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import UIKit

class BasketListFootherView: UIView {

    var totalMonetLabel = UILabel();
      override init(frame: CGRect) {
          super.init(frame: frame)
          didLoad()
      }

      required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
      }

      convenience init() {
          self.init(frame: CGRect.zero)
      }

      func didLoad() {
          
          translatesAutoresizingMaskIntoConstraints = false
          backgroundColor = UIColor(red: 0.35, green: 0.25, blue: 0.71, alpha: 0)
  
          let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
          blurredView.translatesAutoresizingMaskIntoConstraints = false
          addSubview(blurredView)
          blurredView.fillSuperView()
          
          let bb = BasketListBottomStackView();
          self.totalMonetLabel = bb.totalMoneyLabel;
          bb.backgroundColor  = .white
          bb.translatesAutoresizingMaskIntoConstraints = false
           
          addSubview(bb)
          bb.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 19, bottom: 35, right: 19))
      
      }

      override func layoutSubviews() {
         super.layoutSubviews()

         //Custom manually positioning layout goes here (auto-layout pass has already run first pass)
      }

      override func updateConstraints() {
        super.updateConstraints()

        //Disable this if you are adding constraints manually
        //or you're going to have a 'bad time'
        //self.translatesAutoresizingMaskIntoConstraints = false

        //Add custom constraint code here
      }
  
    
    
    
    
}
