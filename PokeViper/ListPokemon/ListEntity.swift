//
//  ListEntity.swift
//  PokeViper
//
//  Created by Rodrigo Adauto Ortiz on 30/11/22.
//

import UIKit

struct ListEntity {

    struct PokemonRequest {
        let limit: Int
    }
    struct PokemonResponse: Decodable {
        let result: [Pokemon]
    }
    struct Pokemon: Decodable {
        let name: String
        let url: String
        var id: Int? {
            return Int(url.split(separator: "/").last?.description ?? "0")
        }
        var imageUrl: URL? {
            var idString: String?
            switch String(id ?? 0).count {
            case 1:
                idString = "00\(String(describing: id))"
                break
                
            case 2:
                idString = "0\(String(describing: id))"
                break
                
            default:
                idString = String(id ?? 0)
                break
            }
            return URL(string: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/\(idString).png")
        }
    }
}

