import boto3, os

def lambda_handler():
    myS3 = boto3.resource('s3')
    # try:
    # buckets = myS3.list_buckets()
    buckets = myS3.buckets.all()
    # print(buckets)
    out = ""
    for bucket in buckets:
        # print(bucket.name)
        out = out + "\n" + bucket.name
    print(out)
    # except:
    #     print("Error")

lambda_handler()