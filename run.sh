aws --endpoint-url=http://localhost:4566 dynamodb create-table --table-name Music \
    --attribute-definitions AttributeName=Artist,AttributeType=S AttributeName=SongTitle,AttributeType=S \
    --key-schema AttributeName=Artist,KeyType=HASH AttributeName=SongTitle,KeyType=RANGE \
    --provisioned-throughput ReadCapacityUnits=10,WriteCapacityUnits=5

aws --endpoint-url=http://localhost:4566 dynamodb describe-table --table-name Music | grep TableStatus

aws --endpoint-url=http://localhost:4566 dynamodb put-item --table-name Music --item \
  '{"Artist": {"S": "No One You Know"}, "SongTitle": {"S": "Call Me Today"}, "AlbumTitle": {"S": "Somewhat Famous"}, "Awards": {"N": "1"}}'

aws --endpoint-url=http://localhost:4566 dynamodb scan --table-name Music
