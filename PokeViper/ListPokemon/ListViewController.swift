//
//  ListViewController.swift
//  PokeViper
//
//  Created by Rodrigo Adauto Ortiz on 30/11/22.
//

import UIKit

typealias ListViewProtocols = ListViewAccess & ListPresenterToView

protocol ListViewAccess {
    var presenter: ListPresenterProtocols? { get set }
}

protocol ListPresenterToView: AnyObject {
    func showErrorPokemon(_ errorMessage: String)
    func showPokemons()
}

class ListViewController: UIViewController, ListViewAccess {
    
    @IBOutlet weak var listPokemon: UITableView!
    
    var presenter: ListPresenterProtocols?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchPokemon()
        listPokemon.dataSource = self
        listPokemon.register(UINib(nibName: "PokemonTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "PokemonTableViewCell")
    }
    
    fileprivate func viperConfigure() {
        var view: ListViewProtocols = self
        var presenter: ListPresenterProtocols = ListPresenter()
        var interactor: ListInteractorProcols = ListInteractor()
        var router: ListRouterProtocols = ListRouter()
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.view = self
        view.presenter = presenter
    }

}

extension ListViewController: ListPresenterToView {
    func showErrorPokemon(_ errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: "UPS Aparecio un error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showPokemons() {
        DispatchQueue.main.async {
            [weak self] in self?.listPokemon.reloadData()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as? PokemonTableViewCell else {return UITableViewCell()}
        cell.name = "HOLA MUNDO"
        
        return cell
    }
    
    
}
