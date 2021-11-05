//
//  Channel.swift
//  YoutubeApp
//
//  Created by kato junichi on 2021/11/05.
//

import Foundation

class Channel: Decodable {
    let items: [ChannelItem]
}

class ChannelItem: Decodable {
    let snippet: ChannelSnippet
}

class ChannelSnippet: Decodable {
    let thumbnails: Thumbnail
}
