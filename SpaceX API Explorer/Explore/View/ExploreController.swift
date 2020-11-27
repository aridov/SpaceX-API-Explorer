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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.explorePresenter = nil
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
        explorePresenter.attachView(view: self)
        explorePresenter.fetchItems()
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

extension ExploreController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension ExploreController: ExploreProtocol {
    func startLoading() {
        print("start loading")
    }
    
    func finishLoading() {
        print("finish loading")
    }
    
    func reloadItems() {
        tableView.reloadData()
    }
}
