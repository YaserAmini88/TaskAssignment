import requests

def send_requests(url, num_requests):
    for _ in range(num_requests):
        response = requests.get(url)
        print(f"Response status code: {response.status_code}")

url = "http://demo.local.domain"
num_requests = 2000

send_requests(url, num_requests)