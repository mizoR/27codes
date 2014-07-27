import UIKit


class SearchViewController: UITableViewController, UISearchDisplayDelegate, UISearchBarDelegate {
    @IBOutlet var searchBar : UISearchBar!
    var keywords = ["aaa", "bbb", "ccc"]
    var filteredKeywords : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            return self.filteredKeywords.count
        } else {
            return self.keywords.count
        }
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        if (tableView == self.searchDisplayController.searchResultsTableView) {
            cell.textLabel.text = self.filteredKeywords[indexPath.row];
        } else {
            cell.textLabel.text = self.keywords[indexPath.row];
        }

        return cell;
    }
    
    func filterContentForSearchText(searchText : String) {
        self.filteredKeywords.removeAll(keepCapacity: false)
        for keyword in self.keywords {
            if (keyword as NSString).localizedCaseInsensitiveContainsString("\(searchText)") {
                self.filteredKeywords.append(keyword)
            }
        }
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
}