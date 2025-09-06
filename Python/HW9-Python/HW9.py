import requests
import pandas as pd



response = requests.get("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
data = response.json()


df = pd.DataFrame([data])

df_cleaned = df.dropna()


df_cleaned['date'] = pd.to_datetime(df_cleaned['date'])
df_cleaned['title'] = df_cleaned['title'].astype(str)
df_cleaned['explanation'] = df_cleaned['explanation'].astype(str)


df_cleaned.to_csv("nasa_apod_cleaned.csv", index=False, encoding='utf-8')
print("Данные сохранены в файл nasa_apod_cleaned.csv")