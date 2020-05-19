//
//  ViewController.swift
//  core_data_companies_01
//
//  Created by Dainis Putans on 19/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAddCompany))
        
        
        setupNavBarStyleTitleAndTitleBackgroundColor()
       
    }
    
    @objc func handleAddCompany() {
        print("Adding company...")
    }
    
    func setupNavBarStyleTitleAndTitleBackgroundColor() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        // new from iOS 13, in order to set up large Tilte for nav bar and color
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(displayP3Red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
        navigationItem.title = "Companies"
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }

}

