import os
from uuid import uuid4


# File upload to
class FileUpload():
    def __init__(self, path, prefix):
        self.path = path
        self.prefix = prefix

    def upload_to(self, instance, filename):
        filename, exe = os.path.splitext(filename)
        return f'{self.path}/{self.prefix}/{uuid4()}{exe}'
