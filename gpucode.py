print('gpus available to tensorflow:')
from tensorflow.python.client import device_lib
print(device_lib.list_local_devices())
print("done")
