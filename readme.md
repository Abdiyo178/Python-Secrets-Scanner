# Python Secret Scanner

A modular Python tool that scans files and directories for hardcoded credentials and secrets.

## What it detects
- API keys
- Passwords
- Tokens
- Secrets

## Usage
Clone the repo and run:
```
python3 scanner.py
```

## Project Files
| File | Purpose |
|------|---------|
| `scanner.py` | Main script — scans files and directories for secret patterns |
| `patterns.py` | Holds the list of secret patterns to scan for (coming soon) |
| `report.py` | Writes scan findings to an output report (coming soon) |

## Test Files
| File | Purpose |
|------|---------|
| `test.txt` | Contains fake credentials to test if the scanner detects secrets |
| `clean.txt` | Contains no secrets — tests that the scanner doesn't false alarm |
| `secrets.env` | Simulates a real .env file with hardcoded API keys and tokens |
| `config.json` | Simulates a config file with nested secrets |
| `clean_code.py` | A clean Python file — no secrets |

## Why I built this
Learning Python fundamentals through a real security engineering use case.
Inspired by tools like truffleHog and detect-secrets.

## Roadmap
- [ ] Regex pattern matching
- [ ] File type filtering
- [ ] Report output
- [ ] CLI arguments