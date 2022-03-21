//
//  ViewController.swift
//  QTable
//
//  Created by Myca Miralles on 3/18/22.
//

import UIKit

class ViewController: UIViewController {
    var itemsArray = [DataModel]()
    //var itemsArray = [CarViewModel]()
    var isExpanded = [Bool]()
    var viewModel: CarViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filtersView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        setCellState()
        setupUI()
        viewModel = CarViewModel()
    }
    
    private func setupUI() {
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableviewcellid")
        tableView.separatorStyle = .none
        filtersView.layer.cornerRadius = 8
    }
    
    func getData() {
        itemsArray = DataValue().items
    }
    
    // Set the cell state to false, because all cells are collapsed at the beginning
    func setCellState() {
        //let itemArray = viewModel?.datasource?.count ?? 0
        for _ in 0..<itemsArray.count {
            isExpanded.append(false)
        }
    }
    
    // Reload the tableview data when you rotate the device
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("march 19 \(viewModel?.datasource?.count)")
        return itemsArray.count//viewModel?.datasource?.count ?? 0 //
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let itemArray = viewModel?.datasource?[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcellid", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.set(content: self.itemsArray[indexPath.row], state: isExpanded[indexPath.row])//self.itemsArray[indexPath.row], state:  isExpanded[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TableViewCell else { return }
        let itemArray = viewModel?.datasource
        cell.detailsLabel.text = self.itemsArray[indexPath.row].answer//itemArray?[indexPath.row].make//
        if isExpanded[indexPath.row] == true {
            // Remove Padding
            cell.detailsLabel.paddingTop = 0
            cell.detailsLabel.paddingBottom = 0
            
            // Hide the Answer Label
            cell.answerLabelHeight.constant = 0
            
            // The cell is collapsed
            isExpanded[indexPath.row] = false
        } else {
            // Add Padding
            cell.detailsLabel.paddingTop = 8
            cell.detailsLabel.paddingBottom = 8
            
            // Get the height of the Answer Label by calculating the string
            //guard let stringHeight = self.itemsArray[indexPath.row].make?.height(width: cell.detailsLabel.frame.width - (cell.detailsLabel.paddingLeft + cell.detailsLabel.paddingRight), font: .systemFont(ofSize: 17, weight: .regular)) else { return }
            guard let stringHeight = self.itemsArray[indexPath.row].answer?.height(width: cell.detailsLabel.frame.width - (cell.detailsLabel.paddingLeft + cell.detailsLabel.paddingRight), font: .systemFont(ofSize: 17, weight: .regular)) else { return }
            // Expand Answer Label
            cell.answerLabelHeight.constant = stringHeight + cell.detailsLabel.paddingTop + cell.detailsLabel.paddingBottom
            
            // The cell is expanded
            isExpanded[indexPath.row] = true
        }
        // Expand/Collapse the cell with animation (The smaller the number, the faster the cell will expand/collapse)
        UIView.animate(withDuration: 0.3) {
            tableView.beginUpdates()
            cell.layoutIfNeeded()
            tableView.endUpdates()
        }
    }
}

extension String {
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        return label.frame.height
    }
}

extension UIColor {
//  struct MyTheme {
//      static var orange =  UIColor.colorFromHex("#FC6016")
//      static var lightGray =  UIColor.colorFromHex("#D5D5D5")
//      static var darkGray =  UIColor.colorFromHex("#858585")
//    }
}

