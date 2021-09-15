import json
class ResponseModel(object):
    def __init__(self, data='', message='success', code=200):
        self.data = data
        self.message = message
        self.code = code

    def to_json(self):
        return json.dumps({'data': self.data, 'message': self.message, 'code': self.code}, ensure_ascii=False)
