# Test SQS 
import boto3 

# Pretty print 
import pprint 

pp = pprint.PrettyPrinter(indent=2) 

# Create queue
sqs = boto3.resource('sqs')

# Get existing queue
queue = sqs.get_queue_by_name(QueueName='AxnetLabTest1')

#print(queue.url) 

# Get all queues. 

#for queue in sqs.queues.all():
#    print(queue) 

###publish some temps

response = queue.send_message(MessageBody='temperature', MessageAttributes={'temp':{'StringValue':'69', 'DataType': 'String'}})
pp.pprint(response)
