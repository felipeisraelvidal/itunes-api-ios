//
//  ViewController.swift
//  desafioAPI
//
//  Created by Rogério Tavares on 19/03/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var tableview: UITableView!
    
    private var songs = [Song]() {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        registerCells()
        fetchSongs()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSongDetails" {
            if let destinationViewController = segue.destination as? SongDetailsViewController, let song = sender as? Song {
                destinationViewController.song = song
            }
        }
    }
    
    // MARK: - Private methods
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func registerCells() {
        let nib = UINib(nibName: SongTableViewCell.identifier, bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: SongTableViewCell.identifier)
    }
    
    private func fetchSongs() {
        let service = FetchSongsService()
        service.fetchAll { result in
            switch result {
            case .success(let songs):
                self.songs = songs
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: SongTableViewCell.identifier, for: indexPath) as? SongTableViewCell else { return UITableViewCell() }
        
        let song = songs[indexPath.row]
        
        cell.configure(with: song)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        performSegue(withIdentifier: "showSongDetails", sender: song)
    }
    
}
