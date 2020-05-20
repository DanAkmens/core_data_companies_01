//
//  ViewController.swift
//  core_data_companies_01
//
//  Created by Dainis Putans on 19/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

class CompaniesController: UITableViewController, CreateCompanyControllerDelegate {
    
    func didAddCompany(company: Company) {
        // 1. - modify your array
        companies.append(company)
        // 2. - insert a new index path into tableView
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    
    var companies = [
        Company(name: "Apple", founded: Date()),
        Company(name: "Google", founded: Date()),
        Company(name: "Facebook", founded: Date())
    ]
    
    // method that ading company to the list
    func addCompany(company: Company) {
//
//        // 1. - modify your array
//        companies.append(company)
//        // 2. - insert a new index path into tableView
//        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
//        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.backgroundColor = .darkBlue
        // tableView.separatorStyle = .none
        
        // line color
        tableView.separatorColor = .white
        
        // removes unecesery rows below what we need
        tableView.tableFooterView = UIView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
        
        setupNavBarStyleTitleColorAndNavBarColor()
       
    }
    
    // cell with identifier, displays text in the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        cell.backgroundColor = .tealColor
        
        // displays name of the company
        let company = companies[indexPath.row]
        cell.textLabel?.text = company.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        return cell
    }
    
    // returns number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    // function responsible for right button action
    @objc func handleAddCompany() {
        
        let createCompanyController = CreateCompanyController()
        // createCompanyController.view.backgroundColor = .green
       
        // Custom Nav Controller - for white status bar
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        
        createCompanyController.delegate = self
        
        navController.modalTransitionStyle = .flipHorizontal
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
    
    // responsible for header, under nav controller
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    // header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}

