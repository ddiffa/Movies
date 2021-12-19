//
//  VideoPlayerHelper.swift
//  MovieDB
//
//  Created by Diffa Desyawan on 20/12/21.
//

import Foundation
import AVKit

class VideoPlayerHelper {
    static let shared = VideoPlayerHelper()
    private let audioSession = AVAudioSession.sharedInstance()
    
    func playVideo(url: URL, present: @escaping(AVPlayerViewController) -> Void) {
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller)
    }
    
    func startSession() {
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        } catch {
            print(error)
        }
    }
}
