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
        print("Целое число: \(item)")
    case is Double:
        print("Вещественное число: \(item)")
    case is String:
        print("Строка: \(item)")
    case is Bool:
        print(item)
    default:
        print("Неизвестный элемент коллекции \(item)")
    }
    
}

print("\n")
/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */
let myBMW: [String: Any] = ["Model": "BMW E39",
                            "Body": "2",
                            "Year": 1990,
                            "Wheels": 4,
                            "overclockTo100km": 8.1,
                            "Engine": 1.8,
                            "secondHands": true,
                            "crash": false]

for (key, value) in myBMW {
    print("\(key): \(value)")
}

print("\n")
/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total: Double = 0

for (_, value) in myBMW {

    if let string = value as? String {
        total += 1
    } else if let bool = value as? Bool {
        total = bool ? total + 2.0 : total - 3.0
    } else if let intValue = value as? Int {
        total += Double(intValue)
    } else if let doubleValue = value as? Double {
        total += doubleValue
    }
}

print(total)

print("\n")
/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0

for (_, value) in myBMW {
    
    if let intValue = value as? Int {
        total += Double(intValue)
    } else if let doubleValue = value as? Double {
        total += doubleValue
    } else if let stringValue = value as? String {
        let new = Double(stringValue) ?? 0
        total += new
    }
}

print(total)
//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
