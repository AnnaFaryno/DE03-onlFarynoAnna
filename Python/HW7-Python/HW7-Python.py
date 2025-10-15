# Задание 1 Напишите функцию, которая принимает список чисел и 
# возвращает их среднее значение. Обработайте исключения, 
# связанные с пустым списком и некорректными типами данных.

def avg_list(lst):
    try:
         average = sum(lst) / len(lst)
         print("Среднее значение:", average)
    except ZeroDivisionError:
        print("Список пуст. На ноль делить нельзя")

try:
    user_input = input("Введите числа через пробел: ")
    numbers = [int(x) for x in user_input.split()]
    avg_list(numbers)
except TypeError:
    print("Некорректный тип данных")
except ZeroDivisionError:
 print("На ноль делить нельзя.Список пуст")



# Задание 2 Создайте программу,
#  которая считывает список чисел из файла, проверяет каждое число на чётность 
# и записывает результаты (чётное или нечётное) в другой файл. Используйте обработку
#  исключений для возможных ошибок ввода-вывода.

def numbers(input_file, output_file):
    try:
        with open(r'Python\HW8-Python\HW7-Python\HW8-Python\file.txt', 'r', encoding='utf-8') as file:
            lines = file.readlines()

        results = []
        for line in lines:
            try:
                number = int(line.strip())
                if number % 2 == 0:
                    results.append(f"{number} — чётное")
                else:
                    results.append(f"{number} — нечётное")
            except ValueError:
                results.append(f"{line.strip()} — не является целым числом")
                    

        with open(r"Python\HW8-Python\HW7-Python\HW8-Python\file2.txt", 'w', encoding='utf-8') as file2:
            for result in results:
                    file2.write(result + '\n')

        print(f"Результаты записаны в файл: {output_file}")

    except FileNotFoundError:
        print(f"Ошибка: файл '{input_file}' не найден")
    except Exception as e:
        print(f"Произошла непредвиденная ошибка: {e}")
    
numbers(
    r"Python\HW8-Python\HW7-Python\HW8-Python\file.txt",
    r"Python\HW8-Python\HW7-Python\HW8-Python\file2.txt"
)  
  

