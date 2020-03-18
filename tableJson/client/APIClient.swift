//
//  APIClient.swift
//  tableJson
//
//  Created by Alex Rudoi on 183//20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import UIKit

struct APIClient {

    let viewController: ViewController
    let url = URL(string: "https://api.myjson.com/bins/vi56v")
    
    func fetchData() {
          guard let data = try? Data(contentsOf: url!, options: []),
            let companies = try? JSONDecoder().decode(Companies.self, from: data) else { return }
        
        viewController.companiesArray = companies.companies
    }
}
