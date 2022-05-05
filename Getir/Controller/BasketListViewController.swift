//
//  BasketListViewController.swift
//  Getir 
//
//  Created by İdris Davarcı on 1.05.2022.
//

import UIKit

class BasketListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
  
    var basket       = BasketListData();
    var BasketList     = [BasketProductModal]();
    var totalMonetLabel  = UILabel();
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(BasketListTableViewCell.self,forCellReuseIdentifier: BasketListTableViewCell.identifier )
        table.rowHeight =  130
        table.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
       
        return table;
    }()
    
    
    
     let footerView : UIView = {
         let v = UIView();
         v.frame = CGRect(x: 0, y: 0, width:   100, height:100)
         return v;
     }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        viewConfig()
         
    
    }
    
    
    // MARK: BasketListViewController config func
    private func viewConfig(){
        view.backgroundColor =   UIColor(red: 0.36, green: 0.25, blue: 0.73, alpha: 1.00)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = footerView
        
        BasketList = basket.getData()
        basket.config(view: view, tableView: tableView)
        totalMonetLabel  =  basket.bottomView.totalMonetLabel;

        totoalMoneyCalculate();
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        BasketList.count
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard  let cell = tableView.dequeueReusableCell(  withIdentifier: BasketListTableViewCell.identifier, for: indexPath ) as? BasketListTableViewCell else  {
            return UITableViewCell();
        }
       
        cell.configure(with: BasketListTableViewCellViewModal(with: BasketList[indexPath.row]) )
        cell.delegate  = self
        return cell;
        
    }
    
    
      
    
    // MARK: Basket total monet calculate func
    private func totoalMoneyCalculate(){
        var totalmoney : Decimal = 0.0
        self.BasketList.forEach { basket in
            totalmoney +=  basket.product.productMoney  * Decimal(basket.basketCount)
        }
        self.totalMonetLabel.text  = "₺\(totalmoney)";
    }
    

}

 
// MARK: BasketListTableViewCellDelegate
extension BasketListViewController : BasketListTableViewCellDelegate {
    
    
    func basketNegativeButtonPress(_ cell: BasketListTableViewCell, didTapWith viewModel: BasketListTableViewCellViewModal) {
        processTableView( cell:cell, viewModel:viewModel, isDelete: true)
      
    }
    
    
    func basketPlustButtonPress(_ cell: BasketListTableViewCell, didTapWith viewModel: BasketListTableViewCellViewModal) {
        processTableView( cell:cell, viewModel:viewModel, isDelete: false)
    }

    
    func processTableView( cell: BasketListTableViewCell, viewModel: BasketListTableViewCellViewModal, isDelete:Bool){
        
        let point = cell.convert(CGPoint.zero, to:self.tableView)
        guard let indexpath =  self.tableView.indexPathForRow(at: point) else{
            return
        }
        
       self.BasketList[indexpath.row].basketCount = Int(viewModel.productBasketCount)
        
        if isDelete {
            if  !viewModel.productIsActive {
                self.BasketList.remove(at: indexpath.row)
                self.tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .fade)
            }
        }
         
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (_) in
            cell.spinner.stopAnimating()
        }
             

        totoalMoneyCalculate();
         
    }
     
    
}
