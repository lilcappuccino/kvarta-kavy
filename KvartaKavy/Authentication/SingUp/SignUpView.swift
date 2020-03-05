//
//  KvartaKavy
//
//  Created by dewill on 08.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit

protocol SignUpViewInputs: AnyObject {
    //func reloadTableView(tableViewDataSource: Int)
}

protocol SignUpViewOutputs: AnyObject {
    func viewDidLoad()
    func skipButtonLocalize() -> String
}


final class SignUpViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    internal var presenter: SignUpViewOutputs?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
         navigationController?.navigationBar.shadowImage = UIImage()
         navigationController?.navigationBar.barTintColor = .clear
         navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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

extension SignUpViewController: SignUpViewInputs{
    
}

extension SignUpViewController: Viewable {
    static var storyboardName: UIStoryboard.Name = .authentication
}
