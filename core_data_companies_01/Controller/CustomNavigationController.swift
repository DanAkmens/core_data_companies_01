//
//  CustomNavigationController.swift
//  core_data_companies_01
//
//  Created by Dainis Putans on 19/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

// custom nav controller for status bar
class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

