from model import model
import input

response = model.generate_content(input.inputs)
token = model.count_tokens(response.text)
print(response.text)
print(token)