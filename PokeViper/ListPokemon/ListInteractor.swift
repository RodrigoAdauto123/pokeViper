//
//  ListInteractor.swift
//  PokeViper
//
//  Created by Rodrigo Adauto Ortiz on 30/11/22.
//

import UIKit

typealias ListInteractorProcols = ListInteractorAccess & ListPresenterToInteractor

protocol ListInteractorAccess {
    var presenter: ListInteractorToPresenter? {get set}
}

protocol ListPresenterToInteractor: AnyObject {
    func getPokemon()
}

class ListInteractor: ListInteractorAccess {
    var api: PokemonAPI?
    weak var presenter: ListInteractorToPresenter?
}

extension ListInteractor: ListPresenterToInteractor {
    func getPokemon() {
        let request = ListEntity.PokemonRequest(limit: 100)
        api?.PokemonInfo(request: request, completion: {[weak self] result in
            switch result {
            case .success(let pokemons):
                self?.presenter?.successPokemon(pokemon: pokemons.result)
                break;
            case .failure(let error):
                self?.presenter?.errorPokemon(error.localizedDescription)
                break;
            }
        })
    }
}
