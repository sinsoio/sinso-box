import sqlite3
import os


class SqlitDB(object):

    def __init__(self):
        # 创建数据库连接
        self.conn = sqlite3.connect(os.path.join(os.path.dirname(__file__), 'db.sqlite3'))
        # 创建字典型游标(返回的数据是字典类型)
        self.cur = self.conn.cursor()

    # __enter__() 和 __exit__() 是with关键字调用的必须方法
    # with本质上就是调用对象的enter和exit方法
    def __enter__(self):
        # 返回游标
        return self.cur

    def __exit__(self, exc_type, exc_value, exc_trace):
        # 提交事务
        self.conn.commit()
        # 关闭游标
        self.cur.close()
        # 关闭数据库连接
        self.conn.close()
