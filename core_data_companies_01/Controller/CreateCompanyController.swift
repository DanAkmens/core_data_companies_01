//
//  CreateCompanyController.swift
//  core_data_companies_01
//
//  Created by Dainis Putans on 20/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

// to avoid code duplication, we use extension in this case
extension UIViewController {
    func setupNavBarStyleTitleColorAndNavBarColor() {
           navigationController?.navigationBar.isTranslucent = false
           navigationController?.navigationBar.prefersLargeTitles = true
        
           // change leftBarButton color
           navigationController?.navigationBar.tintColor = .white
        
           // new from iOS 13, in order to set up large Tilte for nav bar and color
           let navBarAppearance = UINavigationBarAppearance()
           navBarAppearance.configureWithOpaqueBackground()
        
           
           navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
           navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
           navBarAppearance.backgroundColor = .lightRed
           
           self.navigationController?.navigationBar.standardAppearance = navBarAppearance
           self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
       }
}

// Custom Delegation
protocol CreateCompanyControllerDelegate {
    func didAddCompany(company: Company)
}

class CreateCompanyController: UIViewController {
    
    var delegate: CreateCompanyControllerDelegate?
    
    // var companiesController: CompaniesController?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        // label.backgroundColor = .orange
        // enable autolayout
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        navigationItem.title = "Create Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        view.backgroundColor = .darkBlue
        
        setupNavBarStyleTitleColorAndNavBarColor()
    }
    
    // save button, right side
    @objc private func handleSave() {
        
        dismiss(animated: true) {
                   
            guard let text = self.nameTextField.text else { return }
                   
            let company = Company(name: text, founded: Date())
                   
            self.delegate?.didAddCompany(company: company)
        }
        
    }
    
    private func setupUI() {
        
        let lightBlueBackgroundView = UIView()
        lightBlueBackgroundView.backgroundColor = UIColor.lightBlue
        lightBlueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroundView)
        lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        // nameLabel.backgroundColor = UIColor.orange
        // nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        
    }

    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
}
