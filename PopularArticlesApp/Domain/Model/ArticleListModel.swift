//
//  ArticleListModel.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import Foundation

struct ArticleListModel: BaseModel {
    let status, copyright: String
    let numResults: Int
    let results: [Article?]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

struct Article: Codable {
    let uri: String?
    let url: String?
    let id, assetId: Int?
    let source: Source?
    let publishedDate, updated, section, subsection: String?
    let nytdsection: String?
    let byline: String?
    let type: ResultType?
    let title, abstract: String?
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetId = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case byline, type, title, abstract
        case media
    }
    
    var thumbImage: String? {
        media?.first?.thumbnailImage
    }
}

struct Media: Codable {
    let type: MediaType?
    let subType: SubType?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?
    
    enum CodingKeys: String, CodingKey {
        case type, subType, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    
    var thumbnailImage: String? {
        mediaMetadata?.first(where: { $0.format == .standardThumbnail })?.url
    }
}

struct MediaMetadatum: Codable {
    let url: String?
    let format: Format?
    let height, width: Int?
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum SubType: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
}
