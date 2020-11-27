//
//  HomeController.swift
//  SpaceX API Explorer
//
//  Created by Vladimir Aridov on 18.11.2020.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private static let cellIdentifier = "HomeCell"
    fileprivate let homePresenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        initViews()
    }
    
    fileprivate func setupNavBar() {
        UINavigationBar.appearance().backgroundColor = UIColor.lightGray
        navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.red]

        navigationItem.title = "Home"
    }
    
    fileprivate func initViews() {
        tableView.register(UINib(nibName: HomeController.cellIdentifier, bundle: nil), forCellReuseIdentifier: HomeController.cellIdentifier)
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePresenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeController.cellIdentifier, for: indexPath) as! HomeCell
        let homeItem = homePresenter.getItem(by: indexPath.row)
        
        cell.setHomeItem(homeItem)
        
        return cell
    }
}

extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let explorePresenter = ExplorePresenter(from: homePresenter.getItem(by: indexPath.row))
        let exploreController = ExploreController(with: explorePresenter)
        navigationController?.pushViewController(exploreController, animated: true)
    }
}
