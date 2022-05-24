//
//  DashboardViewController.swift
//  TestTask
//
//  Created by Paul Matar on 24/05/2022.
//

import UIKit

class DashboardViewController: UITableViewController {
    let nm = NetworkManager.shared
    var products: [Product] = [] {
        didSet{
            DispatchQueue.main.async {
                  print("data saved")
                  self.tableView.reloadData()
              }
        }
    }
    
    
    
    init() {
        super.init(style: .plain)
        getProducts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not a Storyboard VC")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.separatorStyle = .none


    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.title
        

        return cell
    }
    
    private func getProducts() {
        nm.fetchProducts {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let fproducts):
                self.products = fproducts
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


