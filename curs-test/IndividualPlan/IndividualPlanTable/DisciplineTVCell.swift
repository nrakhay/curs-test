//
//  DisciplinesTVCell.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class DisciplineTVCell: UITableViewCell {
    static let identifier = "DisciplineTVCell"
    static let preferredHeight: CGFloat = 80
    
    struct Hours {
        let plannedHours: String
        let realHours: String
    }
    
    struct ViewModel {
        let disciplineName: String
        let lectureHours: Hours?
        let seminarHours: Hours?
        let labHours: Hours?
        
        init(disciplineName: String, lectureHours: Hours? = nil, seminarHours: Hours? = nil, labHours: Hours? = nil) {
            self.disciplineName = disciplineName
            self.lectureHours = lectureHours
            self.seminarHours = seminarHours
            self.labHours = labHours
        }
    }
    
    
    let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let lectureView: UIView = {
        let view = UIView()
        return view
    }()
    
    let seminarView: UIView = {
        let view = UIView()
        return view
    }()
    
    let labView: UIView = {
        let view = UIView()
        return view
    }()
    
    let lectureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let seminarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let labLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let disciplineNameLabel = TableLabel(font: UIFont.systemFont(ofSize: 14, weight: .bold), color: .label, linesNumber: 0)

    private func generateCompletedHoursLabel(with str: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: str)
        
        let slashPosition = findSlashPosition(in: str)
    
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "green") ?? .green, range: NSRange(location: 0, length: slashPosition))
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "green") ?? .green, range: NSRange(location: slashPosition, length: str.count - slashPosition))
        
        return attributedString
    }
    
    private func generateInCompletedHoursLabel(with str: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: str)
        
        let slashPosition = findSlashPosition(in: str)
    
        attributedString.addAttribute(.foregroundColor, value: UIColor(named: "green") ?? .green, range: NSRange(location: 0, length: slashPosition))
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: slashPosition, length: str.count - slashPosition))
        
        return attributedString
    }
    
    private func findSlashPosition(in str: String) -> Int {
        for (index, char) in str.enumerated() {
            if char == "/" {
                return index
            }
        }
        
        return -1
    }
    
    private func addViews() {
        addSubviews(leftView, rightView)
        leftView.addSubview(disciplineNameLabel)
        rightView.addSubviews(lectureView, seminarView, labView)

        
        lectureView.addSubview(lectureLabel)
        seminarView.addSubview(seminarLabel)
        labView.addSubview(labLabel)
    }
    
    func configure(with viewModel: ViewModel) {
        disciplineNameLabel.text = viewModel.disciplineName
        
        if let lecture = viewModel.lectureHours {
            let str = "\(lecture.realHours) / \(lecture.plannedHours)"
            
            if lecture.realHours == lecture.plannedHours {
                lectureLabel.attributedText = generateCompletedHoursLabel(with: str)
            } else {
                lectureLabel.attributedText = generateInCompletedHoursLabel(with: str)
            }
            
            
        }
        
        if let seminar = viewModel.seminarHours {
            let str = "\(seminar.realHours) / \(seminar.plannedHours)"
            
            if seminar.realHours == seminar.plannedHours {
                seminarLabel.attributedText = generateCompletedHoursLabel(with: str)
            } else {
                seminarLabel.attributedText = generateInCompletedHoursLabel(with: str)
            }
        }
        
        if let lab = viewModel.labHours {
            let str = "\(lab.realHours) / \(lab.plannedHours)"
            
            if lab.realHours == lab.plannedHours {
                labLabel.attributedText = generateCompletedHoursLabel(with: str)
            } else {
                labLabel.attributedText = generateInCompletedHoursLabel(with: str)
            }
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disciplineNameLabel.text = nil
        lectureLabel.text = nil
        seminarLabel.text = nil
        labLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.4)
        
        rightView.anchor(top: self.topAnchor, left: leftView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6)
        
        disciplineNameLabel.anchor(left: self.leftAnchor, right: leftView.rightAnchor, paddingLeft: 14)
        disciplineNameLabel.centerY(in: self)
        
        lectureView.anchor(top: self.topAnchor, left: rightView.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6 * 0.33)
        
        seminarView.anchor(top: self.topAnchor, left: lectureView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6 * 0.33)
        
        labView.anchor(top: self.topAnchor, left: seminarView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6 * 0.33)
        
        lectureLabel.center(in: lectureView, in: lectureView)
        seminarLabel.center(in: seminarView, in: seminarView)
        labLabel.center(in: labView, in: labView)
    }
}
