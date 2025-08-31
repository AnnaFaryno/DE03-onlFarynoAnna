
def calculate_stats(numbers):
    
    n_min = min(numbers)
    n_max = max(numbers)
    summa = sum(numbers)
    
    print("Минимальное число:",n_min)
    print("Максимальное число:",n_max)
    print("Сумма:",summa)
    if summa > 100:
        print("Большая сумма")
   
