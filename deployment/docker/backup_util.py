import os
import sys
import re
import argparse
import mysql.connector
import pandas as pd


class replicate_util:
    @staticmethod
    def query(task: str, file_path: str, server: str, port: int, user: str, password: str):
        binlog_file = ''
        binlog_position = ''

        with open(file_path) as file:
            for line in file:
                if 'LOG_FILE' in line or 'LOG_POS' in line:
                    binlog_file = re.split(',|;|=|\'', line)[2]
                    binlog_position = re.split(',|;|=|\'', line)[5]
                    break

        res = {
            'binlog_file': binlog_file,
            'binlog_position': binlog_position,
        }
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
    port = getattr(args, 'port')
    user = getattr(args, 'user')
    password = getattr(args, 'password')

    file_path = '/tmp/backup_all.sql'

    replicate_util.query(task=task, file_path=file_path, server=server, port=port, user=user, password=${PASSWORD})