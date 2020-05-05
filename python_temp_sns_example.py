# Test SNS 
import boto3 

# Create sns client resource
client = boto3.client('sns')

# Get topic info 
resource = client.get_topic_attributes(TopicArn='arn:aws:sns:us-east-1:921688455380:axnet-temp')

#returns in JSON format, which Python treats as a dictionary
print(resource)

response = client.publish(
    TopicArn='arn:aws:sns:us-east-1:921688455380:axnet-temp',
    Message='Hello World')

