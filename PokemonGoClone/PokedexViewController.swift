import UIKit

class PokedexViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var caughtPokemon : [Pokemon] = []
    var uncaughtPokemon : [Pokemon] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        caughtPokemon = getPokemon(caught: true)
        uncaughtPokemon = getPokemon(caught: false)
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Caught"
        }
        else{
            return "Uncaught"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return caughtPokemon.count
        }
        else{
            return uncaughtPokemon.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var pokemon : Pokemon
        if indexPath.section == 0{
            pokemon = caughtPokemon[indexPath.row]
        }
        else{
            pokemon = uncaughtPokemon[indexPath.row]
        }
        cell.textLabel?.text = pokemon.name
        if let imageName = pokemon.imageName{
            cell.imageView?.image = UIImage(named: imageName )
        }
        return cell
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
