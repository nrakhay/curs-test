//
//  ViewController.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class IndividualPlanVC: GenericVC<IndividualPlanView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtons()
    }
    
    func setupBarButtons() {
        self.navigationItem.leftBarButtonItem = rootView.backBarButton
        self.navigationItem.rightBarButtonItem = rootView.downloadBarButton
        
        rootView.backBarButton.target = self
        rootView.backBarButton.action = #selector(backButtonTapped)

        rootView.downloadBarButton.target = self
        rootView.downloadBarButton.action = #selector(saveFileTapped)
    }
    
    @objc private func backButtonTapped() {
        
    }
    
    @objc private func saveFileTapped() {
        
    }


}

