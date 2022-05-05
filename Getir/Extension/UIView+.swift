import UIKit

extension UIView {
    
   @discardableResult
    func corners(_ radius:CGFloat) -> UIView {
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        return self
    }
    
 
    
    
    
    @discardableResult
    func shadow(radius:CGFloat, color:UIColor,Offset:CGSize,opacity:Float)->UIView{
        self.layer.shadowRadius = radius
        self.layer.shadowColor  = color.cgColor
        self.layer.shadowOffset = Offset
        self.layer.shadowOpacity = opacity
        return self
    }
    
    
    func anchor (top:NSLayoutYAxisAnchor?,bottom:NSLayoutYAxisAnchor?, leading:NSLayoutXAxisAnchor?, trailing:NSLayoutXAxisAnchor?, padding:UIEdgeInsets = .zero, size: CGSize = .zero){
        
        translatesAutoresizingMaskIntoConstraints = false;
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive          = true;
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo:bottom, constant: -padding.bottom).isActive   = true;
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive    = true;
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive  = true;
        }
       
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true;
        }
    
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true;
        }
         
        
    }
    
    func anchorSize(view : UIView){
        widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true;
        heightAnchor.constraint(equalTo:view.heightAnchor).isActive = true;
    }
    func fillSuperView(){
        anchor(top: superview?.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor)
    }
    
    
    func fillAreaSuperView(){
        anchor(top: superview?.safeAreaLayoutGuide.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorPaddin(top:CGFloat = .zero, bottom:CGFloat = .zero , left:CGFloat = .zero, right:CGFloat = .zero){
        let paddding:UIEdgeInsets  = .init(top: top, left: left, bottom: bottom, right:right)
        
    
        topAnchor.constraint(equalTo: superview!.topAnchor , constant: paddding.top).isActive  = true;
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor , constant: paddding.bottom).isActive  = true;
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor , constant: paddding.right).isActive  = true;
        leadingAnchor.constraint(equalTo: superview!.trailingAnchor , constant: paddding.left).isActive  = true;
    }
    
}


extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0,y: 0, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }

    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width,y: 0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }

    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
    }

    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
}



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


extension UIView {
    func addDashBorder(getColor:UIColor) {
        let color = getColor

        let shapeLayer:CAShapeLayer = CAShapeLayer()

        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)

        shapeLayer.bounds = shapeRect
        shapeLayer.name = "DashBorder"
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.5
        shapeLayer.lineJoin = .round
        shapeLayer.lineDashPattern = [2,4]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 10).cgPath

        self.layer.masksToBounds = false

        self.layer.addSublayer(shapeLayer)
    }
}
