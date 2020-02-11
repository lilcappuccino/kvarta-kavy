//
//  RootTabBarController.swift
//  KvartaKavy
//
//  Created by dewill on 08.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .background
        tabBar.isTranslucent = false
        tabBar.tintColor = .textTitle

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
