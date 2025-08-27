#  Задача 1. Создайте список fruits с элементами "apple", "banana", "cherry". Выведите первый элемент списка.

fruits = ["apple", "banana", "cherry"]
print(fruits [0])


#  Задача 2. Создайте словарь student с ключами name, age и grade и соответствующими значениями. 
# Выведите значение по ключу name.

student_dct = [

    {"name":"Anna", "age:"33", "grade":"middle"},
    {"name":"Valeria", "age:"39", "grade":"senior"},
    {"name":"Petr", "age:"27", "grade":"junior"},
     
    ]

print(student_dct[0].get("name"))


#  Задача 3. Напишите программу, которая создает множество уникальных
#  слов из введенной пользователем строки. 
# Программа должна учитывать только уникальные слова и игнорировать регистр.


words = input()

new_words = words.lower().split()
unique_words = set(new_words)

print("Уникальные слова:", unique_words)


# Доп.задача 1 . Напишите программу, которая создает 
# список студентов, их возрастов и оценок. Используйте списки, кортежи и словари для хранения данных. 
#  Программа должна выводить всех студентов, их возраста и оценки, а также производить операции над этими данными.

students_dct = [
    {"name": "Hanna", "age": "33", "marks": "8"},
    {"name": "Petr", "age": "41", "marks": "9"},
    {"name": "Radoslaw", "age": "24", "marks": "10"},
    {"name": "Dorota", "age": "24", "marks": "67"},
]

for student in student_dct
    print(f"name:{student['name']}", "age:{student['age'], "marks:{student['marks'])
          
age_list = [student["age"]] for student in student_dct
marks_tuple = tuple(student["marks"] for student in student_dct)
average_age = sum(age_list) / len(age_list)
max_age = max(age_list)
min_ age = min(age_list)
unique_age = set(age_list)

print("Средний возраст:", average_age)
print("Самому старшему студенту:", max_age, "лет")
print("Самому младшему студенту:", min_age, "лет")
print("Только уникальные возраста: ", unique_age)


# Доп.задача 2. Создайте два списка: [1, 2, 3] и [4, 5, 6]. Напишите 
# программу, которая объединяет эти списки в один и выводит результат.

list_1 = [1, 2, 3]
list_2 = [4, 5, 6]

list_3 = list_1 + list_2 

print("Объединенный список:", list_3)


#  Доп.задача 3. Напишите программу, которая удаляет все 
# дубликаты из списка [1, 2, 2, 3, 4, 4, 5] с помощью 
# преобразования в множество и выводит результат

list = [1, 2, 2, 3, 4, 4, 5]
unique_numbers = set(list)

print(unique_numbers)