import os

PATTERNS = ["api_key", "password", "secret", "token"]

def scan_file(filepath):
    with open(filepath, 'r') as f:
        contents = f.read()
    
    for pattern in PATTERNS:
        if pattern in contents:
            print(f"Warning: found '{pattern}' in {filepath}")

def scan_directory(path):
    for root, dirs, files in os.walk(path):
       for file in files:
            if file.endswith(".py"):
                continue
            filepath = os.path.join(root, file)
            scan_file(filepath)

if __name__ == "__main__":
    scan_directory(".")