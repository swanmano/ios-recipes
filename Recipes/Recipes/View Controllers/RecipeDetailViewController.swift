//
//  RecipeDetailViewController.swift
//  Recipes
//
//  Created by Craig Swanson on 10/30/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    // MARK: Properties
    var recipe: Recipe? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeDetailTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    // MARK: Methods
    func updateViews() {
        guard let recipe = recipe,
            isViewLoaded else { return }
        recipeNameLabel.text = recipe.name
        recipeDetailTextView.text = recipe.instructions
    }

}
