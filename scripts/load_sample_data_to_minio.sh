#!/bin/bash
AWS_ACCESS_KEY_ID=sparkaccesskey AWS_SECRET_ACCESS_KEY=sparksupersecretkey aws --endpoint-url http://localhost:9000 s3 cp ./data/appl_stock.csv s3://appl_stock.csv
