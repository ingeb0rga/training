# def elapsed_time_in_minutes(layer,time):
#     # return preparation_time_in_minutes(layer) + bake_time_remaining(baking)
#     return (layer * 2) + (40 - time)

# print(elapsed_time_in_minutes(1, 3))

# print("Hello world")
# import boto3, os

# def lambda_handler(event, context):
#     # TODO implement
# myS3 = boto3.client('s3')
# response = myS3.list_buckets()
# output = response['Buckets'][0]['Name']
# print(output)
# return myS3.list_buckets()

import random

a = [random.randrange(1, 20) for i in range(10)]
print(a)