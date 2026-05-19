import pandas as pd
from statsmodels.tsa.holtwinters import ExponentialSmoothing

def forecast_sales(data_path):
    df = pd.read_csv(data_path)
    df['Date'] = pd.to_datetime(df['Date'])
    df.set_index('Date', inplace=True)
    
    model = ExponentialSmoothing(df['Sales'], trend='add', seasonal='add', seasonal_periods=12).fit()
    forecast = model.forecast(12)
    return forecast

if __name__ == "__main__":
    print("Generating sales forecast...")
