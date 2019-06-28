
try:
    from PIL import Image
except ImportError:
    import Image
import pytesseract
import requests 
from io import StringIO
import tempfile

import io

r = requests.get('https://219.135.157.158/exam/rand.action', verify=False, allow_redirects=False, stream = True) 

buffer = tempfile.SpooledTemporaryFile(max_size=1e9)

if r.status_code == 200:
    downloaded = 0
    for chunk in r.iter_content():
        downloaded += len(chunk)
        buffer.write(chunk)
    buffer.seek(0)
    i = Image.open(io.BytesIO(buffer.read()))
    print(pytesseract.image_to_string(i))
buffer.close()


