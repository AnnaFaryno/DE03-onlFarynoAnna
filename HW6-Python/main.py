
# Задача 4 

from users import register_user
register_user(20, "Anna")

# Задача 5

from stats import calculate_stats

user_input = input("Введите числа через пробел:")
numbers = [int(num) for num in user_input.split()]
calculate_stats(numbers)



