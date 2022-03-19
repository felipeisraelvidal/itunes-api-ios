//
//  SongDetailsViewController.swift
//  desafioAPI
//
//  Created by SP12442 on 19/03/22.
//

import UIKit

class SongDetailsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var artworkImageView: UIImageView!
    
    var song: Song?
    
    var sections: [(title: String?, items: [SongDetailRow])] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let song = song {
            configure(with: song)
        }
        
        delegates()
        registerCells()
        configureArtworkImageView()
    }
    
    // MARK: - Private methods
    
    private func configureArtworkImageView() {
        
        artworkImageView.layer.cornerRadius = 12
        artworkImageView.clipsToBounds = true
        
    }
    
    private func configure(with model: Song) {
        artworkImageView?.downloaded(from: URL(string: model.artwork)!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: model.releaseDate)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateStyle = .long
        dateFormatter2.timeStyle = .none

        sections = [
            (
                title: nil,
                items: [
                    .init(
                        title: "Música",
                        description: model.trackName
                    ),
                    .init(
                        title: "Álbum",
                        description: model.collectionName
                    ),
                    .init(
                        title: "Gênero",
                        description: model.primaryGenreName
                    ),
                    .init(
                        title: "Duração",
                        description: model.minutesAndSeconds
                    )
                ]
            ),
            (
                title: nil,
                items: [
                    .init(
                        title: "Preço",
                        description: "\(model.currency) \(model.trackPrice)"
                    )
                ]
            ),
            (
                title: "Artista",
                items: [
                    .init(
                        title: "ID",
                        description: "\(model.artistId)"
                    ),
                    .init(
                        title: "Nome",
                        description: model.artistName
                    )
                ]
            ),
            (
                title: "Lançamento",
                items: [
                    .init(
                        title: "Data",
                        description: dateFormatter2.string(from: date!)
                    )
                ]
            )
        ]
    }
    
    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells() {
        let nib = UINib(nibName: TitleDescriptionTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TitleDescriptionTableViewCell.identifier)
    }

}

extension SongDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleDescriptionTableViewCell.identifier, for: indexPath) as? TitleDescriptionTableViewCell else {
            return UITableViewCell()
        }
        
        let detailRow = sections[indexPath.section].items[indexPath.row]
        cell.configure(with: detailRow)
        
        return cell
    }
    
}
