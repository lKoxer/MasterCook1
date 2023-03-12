//
//  RecipeData.swift
//  MasterCook1
//
//  Created by Batman 👀 on 09.03.2023.
//

import UIKit

struct RecipeDetailModel: Codable {
    let ingredients: [Ingredient]
}

struct Ingredient: Codable {
    let name: String
    let image: String
    let amount: Amount
}

struct Amount: Codable {
    let metric: Metric
    let us: Metric
}

struct Metric: Codable {
    let value: Double
    let unit: String
}

