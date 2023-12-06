//
//  PlayerViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 28.11.2023.
//

import UIKit
import YouTubePlayer
import SnapKit
class PlayerViewController: UIViewController {
    var viedo_link = ""
    var player = {
        let gg = YouTubePlayerView()
        return gg
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        player.loadVideoID(viedo_link)
        view.backgroundColor = .black

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }
    func setup() {
        view.addSubview(player)
        player.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
