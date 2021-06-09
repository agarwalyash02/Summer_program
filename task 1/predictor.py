import joblib

model = joblib.load('model.pk1')
x = float(input("Enter Years of Experience: "))
pred = int(model.predict([[x]]))
print("According to experience salary will be :",  pred)

