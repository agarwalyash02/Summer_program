import pandas as pd
import joblib
from sklearn.linear_model import LinearRegression

data = pd.read_csv("Salary.csv")
x = data["YearsExperience"]
y = data["Salary"]   
x = x.values
#Converting 1D array into 2D
x = x.reshape(x.shape[0],1)

model = LinearRegression()
model.fit(x,y)

#Dumping the model in the present directory
joblib.dump(model,"model.pk1")
