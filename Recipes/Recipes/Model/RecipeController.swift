//
//  File.swift
//  Recipes
//
//  Created by Craig Swanson on 10/30/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import Foundation

class RecipeController {
    
    private var recipes: [Recipe] = []
    
    func filterRecipes(with searchString: String, inArray recipies: [Recipe]) -> [Recipe] {
        var updatedRecipes: [Recipe]
        
        updatedRecipes = recipies.filter { $0.name.lowercased().contains(searchString.lowercased()) || $0.instructions.lowercased().contains(searchString.lowercased()) }
        
        
        return updatedRecipes
    }
}
