//
//  ExploreController.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 20.11.2020.
//

import UIKit

class ExploreController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private static let cellIdentifier = "ExploreCell"
    
    fileprivate var explorePresenter: ExplorePresenter!
    
    convenience init(with presenter: ExplorePresenter) {
        self.init()
        explorePresenter = presenter
    }
    
    private init () {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        initViews()
        
        fetchItems()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = explorePresenter.title
    }
    
    fileprivate func initViews() {
        tableView.register(UINib(nibName: ExploreController.cellIdentifier, bundle: nil), forCellReuseIdentifier: ExploreController.cellIdentifier)
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func fetchItems() {
        
    }
}

extension ExploreController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return explorePresenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExploreController.cellIdentifier, for: indexPath) as! ExploreCell
        let exploreItem = explorePresenter.getItem(by: indexPath.row)
        
        cell.setExploreItem(exploreItem)
        
        return cell
    }
}
