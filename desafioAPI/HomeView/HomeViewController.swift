//
//  ViewController.swift
//  desafioAPI
//
//  Created by Rogério Tavares on 19/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCells()
    }
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func registerCells() {
        let nib = UINib(nibName: SongTableViewCell.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: SongTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: SongTableViewCell.identifier, for: indexPath) as? SongTableViewCell else { return UITableViewCell() }
        
        let song = songs[indexPath.row]
        
        cell.configure(with: song)
        
        return cell
    }
    
    
}
