#  Задание 1. Откройте файл example.txt и выведите его содержимое на экран.

with open(r"HW5-Python\example.txt", "r") as file:
    content = file.read()
    print(content)

# Задание 2. Создайте файл output.txt и запишите в него строку "Hello, World!"

with open(r"HW5-Python\output.txt", "r+") as file:
    file.write("Hello, world")
    file.seek(0)
    content = file.read()
    print(content)



# Задание 3.  Напишите программу, которая считает количество строк, слов и 
# символов в заданном текстовом файле и выводит результаты.

with open(r"HW5-Python\example.txt", "r") as file:
    lines = file.readlines()

    line_count = len(lines)
    word_count = 0
    char_count = 0

    for line in lines:
        word_count += len(line.split())
        char_count += len(line)                  
    

    print("Кол-во строк", line_count)
    print("Кол-во слов", word_count)
    print("Кол-во символов", char_count)





   