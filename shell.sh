#!/bin/bash

# deploy-backup.sh
# Internal backup sync job for app-server-01

SERVER_HOST="192.0.2.45"
SERVER_PORT="22"
SERVER_USER="backup_admin"
SERVER_PASS="P@ssw0rd-Backup-Example-2026"

DB_HOST="db.internal.example.com"
DB_PORT="5432"
DB_NAME="customer_portal"
DB_USER="portal_admin"
DB_PASS="ExampleDBSecret123!"

AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
AWS_DEFAULT_REGION="us-east-1"

API_TOKEN="ghp_exampleFakeGitHubToken1234567890"
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/FAKE/FAKE/FAKE"JWT_SIGNING_SECRET="super-secret-jwt-signing-key-example"
PRIVATE_KEY_PATH="/home/backup_admin/.ssh/id_rsa"

echo "[*] Starting backup sync..."

export PGPASSWORD="$DB_PASS"

sshpass -p "$SERVER_PASS" ssh -p "$SERVER_PORT" "$SERVER_USER@$SERVER_HOST" <<EOF
  echo "[*] Connected to remote server"
  pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$DB_NAME" > /tmp/customer_portal.sql
  aws s3 cp /tmp/customer_portal.sql s3://internal-backups-example/customer_portal.sql
EOF

curl -X POST "$SLACK_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d '{"text":"Backup completed successfully for customer_portal"}'

echo "[*] Backup job finished."