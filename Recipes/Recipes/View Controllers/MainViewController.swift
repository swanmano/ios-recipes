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
    var allRecipes: [Recipe] = []
    var recipesTableViewController: RecipesTableViewController?
    var filteredRecipes: [Recipe] = []
    
    // MARK: Outlets
    @IBOutlet weak var recipeTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchRecipes { recipes, error in
            if let error = error {
                    print("Error loading recipes: \(error)")
                return
            }
            
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
        if let recipeSearch = recipeTextField.text,
            recipeTextField.text != "" {
//            recipeTextField.text.
        } else {
            filteredRecipes = allRecipes
            
        }
            
    }

}
