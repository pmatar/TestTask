//
//  HomeViewController.swift
//  TestTask
//
//  Created by Paul Matar on 24/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(regBarButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(dashBarButtonTapped))
    }

    @objc func regBarButtonTapped() {
        if let regVC = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") {
//            regVC.modalPresentationStyle = .overFullScreen
            present(regVC, animated: true)
        }
    }
    
    @objc func dashBarButtonTapped() {
        let dashVC = DashboardViewController()
        
//            dashVC.modalPresentationStyle = .overFullScreen
        present(dashVC, animated: true)
    }
    
    
    private func setupBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.alpha = 0.2
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
}

