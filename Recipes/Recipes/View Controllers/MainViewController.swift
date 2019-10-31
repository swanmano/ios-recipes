//
//  MainViewController.swift
//  Recipes
//
//  Created by Craig Swanson on 10/30/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: Properties
    let networkClient = RecipesNetworkClient()
    
    // The recipeController contains the code to filter the array based on the search
    private var recipeController = RecipeController()
    
    // allRecipes is initially set by the saved file brought in by the network client
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
            self.recipesTableViewController!.recipes = filteredRecipes
        }
    }
    
    // filteredRecipes is the array returned after the user enters their search text
    var filteredRecipes: [Recipe] = [] {
        didSet {
            recipesTableViewController!.recipes = self.filteredRecipes
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var recipeTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchRecipes { recipes, error in
            if let error = error {
                    print("Error loading recipes: \(error)")
                return
            }
            
            // if recipes exist, they are set to the allRecipes variable above
            DispatchQueue.main.async {
                if let recipes = recipes {
                    self.allRecipes = recipes
                }
            }
        }
    }
    
    // MARK: Actions
    @IBAction func searchRecipes(_ sender: UITextField) {
        recipeTextField.resignFirstResponder()
        filterRecipes()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeTableViewSegue" {
            recipesTableViewController = segue.destination as? RecipesTableViewController
        }
    }
    
    // MARK: Methods
    func filterRecipes() {
        guard let recipeSearch = recipeTextField.text,
            recipeTextField.text != "" else { return filteredRecipes = allRecipes }
            filteredRecipes = recipeController.filterRecipes(with: recipeSearch, inArray: allRecipes)
    }

}
