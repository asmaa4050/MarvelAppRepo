// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ResponseModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataObject
}

// MARK: - DataClass
struct DataObject: Codable {
    let offset: Int?
    let limit : Int?
    let count: Int?
    let results: [CharDetails]
   
    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct CharDetails: Codable {
    var id: Int?
    let name, description: String?
    let thumbnail: Thumbnail?
    let title: String?
 
}

struct ChardetailsUiModel {
    let title: String
    let thumbnail: Thumbnail
    
    init(title :String , thumbnail : Thumbnail) {
        self.title = title
        self.thumbnail = thumbnail
    }
    
}

struct Charitem :Codable {
    let items: [Item]
    let returned: Int
}
struct Item :Codable{
    let resourceURI: String?
    let name: String
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
    case pinup = "pinup"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    func getImagePath () -> String{
        return "\(path).\(thumbnailExtension)"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
