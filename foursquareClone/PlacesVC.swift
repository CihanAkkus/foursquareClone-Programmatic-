//
//  PlacesVC.swift
//  foursquareClone
//
//  Created by Cihan on 31.01.2026.
//

import UIKit
import FirebaseAuth

class PlacesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButtonTapped))
        
        setupUI()
    
        
    }
    
    func setupUI( ){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
        
    }
    
    
    
    @objc func addButtonTapped( ){
        
        let destinationVC = AddPlaceVC()
        
        navigationController?.pushViewController(destinationVC, animated: true)
        
    }
    
    @objc func logoutButtonTapped( ){
        
        do{
            try Auth.auth().signOut()
            
            let loginVC = SignUpVC()
            
            if let windowsScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let delegate = windowsScene.delegate as? SceneDelegate,
               let window = delegate.window{
                
                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve) {
                    window.rootViewController = loginVC
                }
                
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    


}
