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

        self.title = NSLocalizedString("individualPlan", comment: "Individual Plan Strings")
        
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
        var formattedAcademicYear = ""
        for (idx, char) in data.AcademicYear.enumerated() {
            if idx == 9 {
                break
            }
            
            formattedAcademicYear.append(String(char))
        }
        
        let text = NSLocalizedString("academicYearText", comment: "Individual Plan Strings")
        rootView.bottomHeaderLabel.text = String(format: text, formattedAcademicYear)
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
        guard let url = URL(string: "https://yes-pdf.com/electronic-book/5109") else { return }
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
}

extension IndividualPlanVC: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("file downloaded to: ", location)
    }
}

