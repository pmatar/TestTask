//
//  DashboardViewController.swift
//  TestTask
//
//  Created by Paul Matar on 24/05/2022.
//

import UIKit

class DashboardViewController: UITableViewController {
    
    private var products: [Product] = [] {
        didSet{
            DispatchQueue.main.async {
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
        registerNibCell()
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
            return UITableViewCell()
        }
        
        let product = products[indexPath.row]
        cell.configure(with: product)
        
        return cell
    }
    
    
    private func registerNibCell() {
        let productCell = UINib(nibName: "ProductCell", bundle: nil)
        tableView.register(productCell, forCellReuseIdentifier: "ProductCell")
    }
    
    private func getProducts() {
        let nm = NetworkManager.shared
        nm.fetchProducts { [weak self] result in
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


