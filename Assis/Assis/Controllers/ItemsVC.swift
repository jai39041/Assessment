//
//  ItemsController.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import UIKit
import Combine

class ItemsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @Published private var viewModal: ItemsViewModel = ItemsViewModel()
    private var cancellableSet = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Items"
        
        self.configureTableView()
        self.bindItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Additional navigation bar implementaion
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Additional navigation bar implementaion
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    
    func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.prefetchDataSource = self
        
        // registering cell
        let nib = UINib(nibName: "ItemTVC", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ItemTVC")
    }

    
    func bindItems() {
        // binding items
        self.viewModal.$items
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.tableView.reloadData() }
            .store(in: &cancellableSet)
    }

}

extension ItemsVC: UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModal.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let itemCell = tableView.dequeueReusableCell(withIdentifier: "ItemTVC", for: indexPath) as? ItemTVC else {
            return UITableViewCell()
        }
        let item = self.viewModal.items[indexPath.row]
        itemCell.configure(item: item)
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "ItemDetailVC") as? ItemDetailVC else {
            return
        }
        
        detailVC.item = self.viewModal.items[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: { $0.row >= self.viewModal.items.count - 3 }) {
            viewModal.fetchItems()
        }
    }
    
    
}
