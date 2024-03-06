//
//  ListRouter.swift
//  PokeViper
//
//  Created by Rodrigo Adauto Ortiz on 30/11/22.
//

import UIKit

typealias ListRouterProtocols = ListRouterAccess & ListPresenterToRouter

protocol ListRouterAccess {
    var view: ListViewController? {get set}
}

protocol ListPresenterToRouter: AnyObject {
    func routeToDetail(withPokemon pokemon: ListEntity.Pokemon)
}

class ListRouter: ListRouterAccess {
    var view: ListViewController?
}

extension ListRouter: ListPresenterToRouter {
    func routeToDetail(withPokemon pokemon: ListEntity.Pokemon) {
         
    }
}
