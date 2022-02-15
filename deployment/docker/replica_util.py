import os
import sys
import argparse
import mysql.connector
import pandas as pd


class replicate_util:
    @staticmethod
    def query(task: str, server: str, port: int, user: str, password: str):
        database = 'mysql'
        conn = mysql.connector.connect(host=server, port=port, user=user, password=${PASSWORD}, database=database)

        cursor = conn.cursor()
        cursor.execute("SHOW MASTER STATUS")

        rows = cursor.fetchall()
        df = pd.DataFrame(data=rows, columns=cursor.column_names)

        cursor.close()
        conn.close()

        binlog_file = df['File'][0]
        binlog_position = df['Position'][0]
        res = {'binlog_file': binlog_file, 'binlog_position': binlog_position}
        if task == 'binlog_file':
            res = res['binlog_file']
        elif task == 'binlog_position':
            res = res['binlog_position']
        else:
            res = ''

        print(res)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Batch job ...')
    parser.add_argument('--task', type=str,
                        help='Task: one of binlog_file, binlog_position. binlog_file: MySQL binlog file. binlog_position: MySQL binlog position.', default='')
    parser.add_argument('--server', type=str, help='MySQL server', default='')
    parser.add_argument('--port', type=str, help='MySQL port', default='')
    parser.add_argument('--user', type=str, help='MySQL user', default='')
    parser.add_argument('--password', type=str, help='MySQL password', default='')

    args = parser.parse_args()

    task = getattr(args, 'task')
    server = getattr(args, 'server')
    port = int(getattr(args, 'port'))

    user = getattr(args, 'user')
    password = getattr(args, 'password')

    replicate_util.query(task=task, server=server, port=port, user=user, password=${PASSWORD})
