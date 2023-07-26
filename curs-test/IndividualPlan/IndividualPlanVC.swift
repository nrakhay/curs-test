//
//  ViewController.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

final class IndividualPlanVC: GenericVC<IndividualPlanView> {
    private let segmentedVC = SegmentedControlVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Индивидуальный учебный план"
        
        self.add(segmentedVC, view: rootView.bottomView)
        setupBarButtons()
        parseData()
    }
    
    private func setupBarButtons() {
        self.navigationItem.leftBarButtonItem = rootView.backBarButton
        self.navigationItem.rightBarButtonItem = rootView.downloadBarButton
        
        rootView.backBarButton.target = self
        rootView.backBarButton.action = #selector(backButtonTapped)

        rootView.downloadBarButton.target = self
        rootView.downloadBarButton.action = #selector(saveFileTapped)
    }
    
    private func setupViews(with data: IndividualPlanModel) {
        rootView.bottomHeaderLabel.text = "на \(data.AcademicYear)"
    }
    
    private func parseData() {
        let jsonData = Data(PlanData.data.utf8)

        do {
            let parsedData = try JSONDecoder().decode(IndividualPlanModel.self, from: jsonData)
            setupViews(with: parsedData)
            segmentedVC.configureView(with: parsedData)
        } catch {
            print(error)
        }
    }
    
    @objc private func backButtonTapped() {

    }
    
    @objc private func saveFileTapped() {
        
    }





}

