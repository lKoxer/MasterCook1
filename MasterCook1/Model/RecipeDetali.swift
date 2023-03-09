//
//  RecipeDetali.swift
//  MasterCook1
//
import Foundation

// Создаем структуру для модели данных рецепта
struct RecipeDetali {
    
    // Создаем функцию для получения ингредиентов по ID
    func fetchRecipe(id: Int) {
        
        // Формируем строку запроса
        let urlString = "https://api.spoonacular.com/recipes/\(String(id))/ingredientWidget.json?apiKey=ad2e5ac75263468e8ccf6afe844c3033"
        
        // Вызываем функцию для выполнения запроса
        perform(urlString)
    }
    
    // Функция для выполнения запроса
    func perform(_ urlString: String) {
        
        // Проверяем, что URL существует
        if let url = URL(string: urlString) {
            
            // Создаем сессию URLSession
            let session = URLSession(configuration: .default)
            
            // Создаем задачу URLSessionDataTask для выполнения запроса
            let task = session.dataTask(with: url) { data, response, error in
                
                // Проверяем на наличие ошибок в ответе
                if error != nil {
                    print(error!)
                    return
                }
                
                // Проверяем, что есть данные
                if let safeData = data {
                    
                    // Парсим полученные данные
                    self.parse(data: safeData)
                }
            }
            // Запускаем задачу
            task.resume()
        }
    }
    
    // Функция для парсинга данных
    func parse(data: Data) {
        // Используем JSONDecoder для декодирования данных
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(RecipeDetailModel.self, from: data)
            // Выводим название первого ингредиента в списке
            print(decodeData.ingredients[0].name)
            
        } catch {
            // Если произошла ошибка при парсинге, выводим ее в консоль
            print(error)
        }
    }
}

