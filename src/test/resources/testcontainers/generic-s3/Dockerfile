FROM chrislusf/seaweedfs:latest

ENV AWS_ACCESS_KEY_ID=admin
ENV AWS_SECRET_ACCESS_KEY=secret
ENV S3_BUCKET=mybucket

EXPOSE 8333

ENTRYPOINT ["/usr/bin/weed"]
CMD ["mini", "-dir=/data", "-s3.port=8333"]
