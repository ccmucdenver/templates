import tensorflow as tf
print("TensorFlow version:", tf.__version__)

gpus = tf.config.list_physical_devices('GPU')
if not gpus:
    print("No GPU found.")
else:
    print(f"GPUs found: {len(gpus)}")
    for gpu in gpus:
        print(" -", gpu.name)
        tf.config.experimental.set_memory_growth(gpu, True)

    # Simple matrix multiplication
    import numpy as np
    a = tf.constant(np.random.rand(1024, 1024), dtype=tf.float32)
    b = tf.constant(np.random.rand(1024, 1024), dtype=tf.float32)

    with tf.device('/GPU:0'):
        c = tf.matmul(a, b)

    print("Matrix multiplication completed.")

