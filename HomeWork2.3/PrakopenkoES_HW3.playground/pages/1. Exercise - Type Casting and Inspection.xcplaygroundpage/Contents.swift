/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let items: [Any] = [1.11, 4.44, 7.77, 2, 3, 8, "dog", "swift", "owl", 2 + 3 == 5, "android" == "ios", true]

for item in items {
    print(item)
}

print("\n")
/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
for item in items {
    
    switch item {
    case is Int:
        print("\(item) is Integer")
    case is Double:
        print("\(item) is Double")
    case is String:
        print("\(item) is String")
    case is Bool:
        print("\(item) is Bool")
    default:
        print("Неизвестное значение: \(item)")
    }
    
}

print("\n")

for item in items {
    if let item = item as? Int {
        print("\(item) is Integer")
    } else if let item = item as? String {
        print("\(item) is String")
    } else if let item = item as? Bool {
        print("\(item) is Bool")
    } else if let item = item as? Double {
        print("\(item) is Double")
    }
}

print("\n")
/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */
let myBMW: [String: Any] = [
    "Model": "BMW E39",
    "Body": "2",
    "Year": 1990,
    "Wheels": 4,
    "overclockTo100km": 8.1,
    "Engine": 1.8,
    "secondHands": true,
    "crash": false
]

for (key, value) in myBMW {
    print("Key: \(key), Value: \(value)")
}

print("\n")

for item in myBMW {
    print("Key: \(item.key), Value: \(item.value)")
}

print("\n")
/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total = 0.0

for (_, value) in myBMW {
    if let value = value as? Int {
        total += Double(value)
    } else if let value = value as? Double {
        total += value
    } else if value is String {
        total += 1
    } else if let value = value as? Bool {
        total += value ? 2 : -3
    }
}

print(total)

print("\n")

total = 0

for (_, value) in myBMW {
    
    switch value {
    case let integer as Int:
        total += Double(integer)
    case let double as Double:
        total += double
    case let _ as String:
        total += 1
    case let bool as Bool:
        total += bool ? 2 : -3
    default:
        break
    }
    
}

print("\n")
/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0

for (_, value) in myBMW {
    
    if let value = value as? Int {
        total += Double(value)
    } else if let value = value as? Double {
        total += value
    } else if let value = value as? String {
        if let number = Double(value) {
            total += number
        }
    }
}

print(total)
//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
