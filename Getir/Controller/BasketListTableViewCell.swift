//
//  BasketListTableViewCell.swift
//  Getir
//
//  Created by İdris Davarcı on 1.05.2022.
//

import UIKit



protocol BasketListTableViewCellDelegate : AnyObject {
    func basketPlustButtonPress(_ cell:BasketListTableViewCell, didTapWith viewModel: BasketListTableViewCellViewModal)
    func basketNegativeButtonPress(_ cell:BasketListTableViewCell, didTapWith viewModel: BasketListTableViewCellViewModal)
}

class BasketListTableViewCell: UITableViewCell {
    
    static let identifier = "BasketListTableViewCell";
    
    var delegate:BasketListTableViewCellDelegate?
    
    private var viewModel:BasketListTableViewCellViewModal?
    private var newModel:BasketListTableViewCellViewModal?
    
    var spinner  : UIActivityIndicatorView = {
        let act = UIActivityIndicatorView();
        act.style = .medium
        act.color = .white
        return act;
    }()
    
    let productImage:UIImageView = {
        let img = UIImageView();
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints =  false
        img.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
        return img;
    }()
    
    
    let productNameLabel : UILabel = {
        let label = UILabel();
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label;
        
    }()
    
    
    let productMoneyLabel : UILabel = {
        let label  = UILabel();
        label.textColor  = UIColor(red: 0.10, green: 0.10, blue: 0.10, alpha: 1.00)
        label.textColor =  UIColor(red: 0.35, green: 0.25, blue: 0.71, alpha: 1.00)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        
        return label;
    }()
    
    let productDescriptionLabel : UILabel = {
        let label = UILabel();
        label.heightAnchor.constraint(equalToConstant: 20).isActive  = true;
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.41, green: 0.45, blue: 0.53, alpha: 1.00)
        return label;
    }()
    
    
    let productBasketCountLabel : UILabel = {
        let label = UILabel();
        label.textColor  = .white
        label.backgroundColor = UIColor(red: 0.35, green: 0.25, blue: 0.71, alpha: 1.00)
        label.widthAnchor.constraint(equalToConstant: 35).isActive  = true
        label.font  = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        return label;
    }()
    
    let plustButton : UIButton = {
        let btn  = UIButton();
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("+", for: .normal)
        
        return btn;
    }()
    
    
    
    let negativeButton : UIButton = {
        let btn = UIButton();
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("-", for: .normal)
        
        return btn
        
    }();
    
    
    var containerStackView = UIStackView();
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
    // MARK: Basket plus press
    
    @objc func plusButtonPress(){
        
        plusNegativeFunc(plus: true)
        guard let newModel = newModel else {
            return
        }
        delegate?.basketPlustButtonPress(self, didTapWith: newModel)
        
    }
    
    
    
    // MARK: Basket negative buttun press
    @objc func negativeButtonPress(){
        
        plusNegativeFunc(plus: false)
        guard let newModel = newModel else {
            return
        }
        delegate?.basketNegativeButtonPress(self, didTapWith: newModel)
        
    }
    
    // MARK: Basket plus & negative process
    private func  plusNegativeFunc (plus:Bool) {
        
        guard let model = viewModel else {
            return
        }
        
        spinner.startAnimating()
        
        var editModel = model
        let pr = plus == true ? 1 : -1;
        
        editModel.productBasketCount+=Float(pr);
        
        if editModel.productBasketCount < 1 {   editModel.productIsActive = !editModel.productIsActive  }
        
        configure(with: editModel)
        self.newModel = editModel;
        
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: BasketListTableViewCell.identifier)
        
        selectionStyle = .none
       
        initSetup()
        
         
        
    }
     
    
    // MARK: init setup
    fileprivate func initSetup() {
        let productInfoStackView = UIStackView(arrangedSubviews: [productNameLabel,productDescriptionLabel,productMoneyLabel]);
        productInfoStackView.axis = .vertical;
        productNameLabel.numberOfLines = 0
        productNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        productBasketCountLabel.addSubview(spinner)
        spinner.anchor(top: productBasketCountLabel.topAnchor, bottom: productBasketCountLabel.bottomAnchor, leading: productBasketCountLabel.leadingAnchor, trailing: productBasketCountLabel.trailingAnchor, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        
        
        
        let productActionStackView = UIStackView(arrangedSubviews: [negativeButton ,productBasketCountLabel, plustButton])
        productActionStackView.axis = .horizontal;
        productActionStackView.distribution = .equalSpacing;
        
        
        productActionStackView.layer.masksToBounds = true
        productActionStackView.layer.borderColor = UIColor(red: 0.35, green: 0.25, blue: 0.71, alpha: 1.00).cgColor
        productActionStackView.layer.borderWidth = 1
        productActionStackView.layer.cornerRadius = 8
        productActionStackView.layer.shadowColor = UIColor(red: 0.35, green: 0.25, blue: 0.71, alpha: 1.00).cgColor
        productActionStackView.layer.shadowOpacity = 1
        productActionStackView.layer.shadowOffset = .zero
        productActionStackView.layer.shadowRadius = 8
        productActionStackView.layer.shadowPath = UIBezierPath(rect: productActionStackView.bounds).cgPath
        productActionStackView.layer.shouldRasterize = true
        productActionStackView.layer.rasterizationScale = UIScreen.main.scale
        
        
        
        
        let productPlusNegativeStackView = UIStackView(arrangedSubviews: [UIView(), productActionStackView,UIView()])
        productPlusNegativeStackView.axis  = .vertical
        productPlusNegativeStackView.distribution = .fillEqually
        productPlusNegativeStackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        let ProductImageContainerStackView = UIStackView(arrangedSubviews: [productImage]);
        ProductImageContainerStackView.layer.masksToBounds = true
        ProductImageContainerStackView.layer.cornerRadius = 15;
        ProductImageContainerStackView.layer.borderWidth = 0.5;
        ProductImageContainerStackView.layer.borderColor = UIColor.lightGray.cgColor
        ProductImageContainerStackView.backgroundColor   = .white
        
        
        
        
        containerStackView = UIStackView(arrangedSubviews: [ProductImageContainerStackView,productInfoStackView, productPlusNegativeStackView])
        containerStackView.axis = .horizontal;
        containerStackView.spacing = 10
        
        contentView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = true
        containerStackView.anchor(top: contentView.topAnchor, bottom: contentView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor,padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
        
        contentView.clipsToBounds = true;
        ProductImageContainerStackView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        plustButton.addTarget(self, action: #selector(plusButtonPress), for: .touchUpInside)
        negativeButton.addTarget(self, action: #selector(negativeButtonPress), for: .touchUpInside)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    // MARK: Basket cell config
    
    func configure(with model:BasketListTableViewCellViewModal){
        
        self.viewModel = model
        
        productImage.image         = model.productImage
        productNameLabel.text       = model.productName
        productDescriptionLabel.text   = model.productDescription
        productMoneyLabel.text       = "₺" + String(describing: model.productMoney)
        productBasketCountLabel.text   =   String(describing:Int (model.productBasketCount) )
        
    }
    
    
    
    
}
