//
//  UIButton+.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import Foundation
import UIKit

extension UIButton {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
       
            layer.mask = mask
        }
    
    
    func roundedButton(){
          let maskPath1 = UIBezierPath(roundedRect: bounds,
              byRoundingCorners: [.topLeft , .topRight],
              cornerRadii: CGSize(width: 8, height: 8))
          let maskLayer1 = CAShapeLayer()
          maskLayer1.frame = bounds
          maskLayer1.path = maskPath1.cgPath
          layer.mask = maskLayer1
      }
}
