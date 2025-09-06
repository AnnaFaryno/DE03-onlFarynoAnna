import pandas as pd
import numpy as np

df = pd.read_csv(r'Python\HW8-Python\customers.csv')
print(df) 

age = [13,34,35,60,20,23,24,54,65,32,19,23,28,30,41,42,58,34,51,50]
df ['age'] = age
print(df)

country = ["Беларусь", "Чехия","Эстония","Латвия","Польша","Литва" ,"США","Аргентина","Германия","Испания","Испания","Франция",
           "ЮАР","Беларусь","Беларусь","Германия","Италия","Италия","Мексика","Словения"]
df ['country'] = country
print(df)

numbers_of_orders = [20,17,1,4,153,78,10,90,112,32,19,3,78,30,4,4,21,1,23,105]
df ['numbers_of_orders'] = numbers_of_orders
print(df)

age_more18 = df[df['age'] > 18]
print("Клиенты старше 18 лет:", age_more18)

min_age = df['age'].min()
print("Самому младшему клиенту:", min_age)


max_age_country = df.groupby('country')['age'].max()
print("Самому старшему клиенту по странам:", max_age_country)

sorted = df.sort_values(by = 'numbers_of_orders', ascending = False)
print(sorted)

total_orders = df['numbers_of_orders'].sum()
print("Общее количество заказов: ", total_orders)

avg_total_orders = np.mean(df['numbers_of_orders'])
print("Среднее кол-во заказов:", avg_total_orders)

value = np.median(df['numbers_of_orders'])
print("Медиана количества заказов:", value )
