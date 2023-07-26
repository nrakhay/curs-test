//
//  ViewController.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

final class IndividualPlanVC: GenericVC<IndividualPlanView> {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Индивидуальный учебный план"
        
        setupBarButtons()
        parseData()
    }
    
    func setupBarButtons() {
        self.navigationItem.leftBarButtonItem = rootView.backBarButton
        self.navigationItem.rightBarButtonItem = rootView.downloadBarButton
        
        rootView.backBarButton.target = self
        rootView.backBarButton.action = #selector(backButtonTapped)

        rootView.downloadBarButton.target = self
        rootView.downloadBarButton.action = #selector(saveFileTapped)
    }
    
    private func parseData() {
        let jsonData = Data(PlanData.data.utf8)

        do {
            let plan = try JSONDecoder().decode(IndividualPlanModel.self, from: jsonData)
            print(plan.Semesters[0].Number)
        } catch {
            print(error)
        }
    }
    
    @objc private func backButtonTapped() {

    }
    
    @objc private func saveFileTapped() {
        
    }





}

