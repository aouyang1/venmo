#!/bin/bash

docker run -it \
  -v $(pwd):/root/venmo-monster \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e S3_BUCKET=$VENMO_S3_BUCKET \
  -w /root/venmo-monster \
  venmo-monster \
  /bin/bash
