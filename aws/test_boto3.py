from sre_parse import State
import boto3, re, json, sys, yaml

# s3 = boto3.resource('s3')
ec2 = boto3.resource('ec2')
ec2client = boto3.client('ec2')
cw = boto3.client('cloudwatch')

ec2_metrics = cw.list_metrics(Namespace = "AWS/EC2")
ec2_addresses = ec2client.describe_addresses()
alarms = cw.describe_alarms()

# print(json.dumps(alarms, indent = 4, sort_keys=True, default=str))
# print(yaml.dump(cw.list_dashboards()))
# for instance in ec2.instances.all():
#     paginator = cw.get_paginator('list_metrics')
#     for response in paginator.paginate():
#         print(json.dumps(response['Metrics'], indent = 4))

# for bucket in s3.buckets.all():
#     print("Bucket name:", bucket.name)

# for id in sys.argv[1:]:
#     print(id)
#     instance = ec2.Instance(id)
#     print(instance)
#     if re.search(r'webserver2|prodserver2|prodserver3', tag['Value']):
#         print(tag['Value'])    

# class terminate_instances:
#     def terminate_ec_instances(self, instanceid):
#         response = ec2client.terminate_instances(InstanceIds=[instanceid])
#         return

# cw.put_metric_alarm(
#     AlarmName = 'Demo_Web_Server_CPU_Utilization', 
#     ComparisonOperator = 'GreaterThanThreshold', 
#     EvaluationPeriods = 1, 
#     MetricName = 'CPUUtilization', 
#     Namespace = 'AWS/EC2', 
#     Period = 60, 
#     Statistic = 'Average', 
#     Threshold = 70.0, 
#     ActionsEnabled = False, 
#     AlarmDescription = 'Alarm when server CPU exceeds 70%', 
#     Dimensions = [{'Name': 'webserver1', 'Value': 'i-0de38718d84a25062'}], 
#     Unit = 'Seconds'
# )

# for alarm in cw.describe_alarms()['MetricAlarms']:
#     print(alarm['AlarmName'])

# cw.delete_alarms(AlarmNames=['Demo_Web_Server_CPU_Utilization'])

for instance in ec2.instances.all():
    # if instance.state['Name'] == "running":
    #     instance.stop()
        # print(instance)
        # print(instance.state['Name'])
    for tag in instance.tags:
        if re.search(r'devops', tag['Value']):
            if instance.state['Name'] == "running":
                instance.stop()
                # print(instance.id)
                # print(instance.instance_id)
                # print(tag['Value'])
                # print(instance.state['Name'])
                # boto3.client('ec2').terminate_instances(InstanceIds = list(instance.instance_id))
                

# from datetime import datetime
# from time import time

# print("Hello {} world at {}".format(str(input()), str(datetime.now())))