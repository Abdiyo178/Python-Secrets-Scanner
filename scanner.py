import os
from patterns import PATTERNS

SKIP_EXTENSIONS = [".py", ".md"]

def scan_file(filepath):
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            contents = f.read()
    except UnicodeDecodeError:
        return
    
    for pattern in PATTERNS:
        if pattern in contents:
            print(f"Warning: found '{pattern}' in {filepath}")

def scan_directory(path):
    for root, dirs, files in os.walk(path):
        for file in files:
            filepath = os.path.join(root, file)
            if any(file.endswith(ext) for ext in SKIP_EXTENSIONS) or ".git" in filepath:
                continue
            scan_file(filepath)

if __name__ == "__main__":
    scan_directory(".")
