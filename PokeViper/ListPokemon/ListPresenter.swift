//
//  ListPresenter.swift
//  PokeViper
//
//  Created by Rodrigo Adauto Ortiz on 30/11/22.
//

import UIKit

typealias ListPresenterProtocols = ListPresenterAccess & ListViewToPresenter & ListInteractorToPresenter

protocol ListPresenterAccess {
    var view: ListPresenterToView? {get set}
    var interactor: ListPresenterToInteractor? {get set}
    var router: ListPresenterToRouter? {get set}
}

protocol ListViewToPresenter {
    func fetchPokemon()
}

protocol ListInteractorToPresenter: AnyObject {
    func successPokemon(pokemon: [ListEntity.Pokemon])
    func errorPokemon(_ message: String)
}

class ListPresenter: ListPresenterAccess {
    weak var view: ListPresenterToView?
    var interactor: ListPresenterToInteractor?
    var router: ListPresenterToRouter?
    var pokemons: [ListEntity.Pokemon] = []
    
    
}

extension ListPresenter: ListViewToPresenter {
    func fetchPokemon() {
        self.interactor?.getPokemon()
    }    
}

extension ListPresenter: ListInteractorToPresenter {
    func successPokemon(pokemon: [ListEntity.Pokemon]) {
        self.pokemons = pokemon
        self.view?.showPokemons()
    }
    
    func errorPokemon(_ message: String) {
        self.view?.showErrorPokemon(message)
    }
    
}
