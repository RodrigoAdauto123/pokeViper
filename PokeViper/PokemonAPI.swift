//
//  PokemonAPI.swift
//  PokeViper
//
//  Created by Rodrigo Adauto Ortiz on 14/12/22.
//

import UIKit
import Alamofire

class PokemonAPI {
    func PokemonInfo(request: ListEntity.PokemonRequest, completion: @escaping (Result<ListEntity.PokemonResponse, Error>) -> ()) {
        AF.request("https://pokeapi.co/api/v2/pokemon?limit=\(request.limit)").responseDecodable(of: ListEntity.PokemonResponse.self) { response in
            switch response.result {
            case .success(let pokemons):
                completion(.success(pokemons))
                break;
            case .failure(let error):
                completion(.failure(error))
                break;
            }
        }
    }
}
