import os
import sys
import argparse


class ha_template:
    @staticmethod
    def main(input_file_path: str,
             output_file_path: str,
             dict_parameters: dict):

        print('Input template file: {}'.format(input_file_path))

        assert len(input_file_path) > 0

        with open(input_file_path, 'r') as f1:
            text = f1.read()

        for k in dict_parameters:
            text = text.replace('{{' + k + '}}', dict_parameters[k])

        if output_file_path == '':
            sys.stdout.write(text)
        else:
            print('Generating file: {}'.format(output_file_path))
            with open(output_file_path, 'w') as f2:
                f2.write(text)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Batch job ...')
    parser.add_argument('--infile', type=str, help='template file path', default='')
    parser.add_argument('--outfile', type=str, help='output', default='')
    parser.add_argument('--TEMPLATE_SERVER_ID', type=str, help='MySql server-id. Required.', default='0')
    parser.add_argument('--TEMPLATE_BIND_ADDRESS', type=str, help='MySql bind-address. Required.', default='127.0.0.1')
    parser.add_argument('--TEMPLATE_BIND_ADDRESS_MASTER', type=str, help='MySql bind-address. Required.', default='127.0.0.1')
    parser.add_argument('--TEMPLATE_BINLOG_FILE_MASTER', type=str, help='MySql binlog file. Optional.', default='')
    parser.add_argument('--TEMPLATE_BINLOG_POSITION_MASTER', type=str, help='MySql binlog position. Optional.', default='')

    args = parser.parse_args()

    infile = getattr(args, 'infile')
    outfile = getattr(args, 'outfile')

    keys = dir(args)
    keys = list(filter(lambda x: x.startswith('TEMPLATE_'), keys))

    dict_parameters = dict()
    for key in keys:
        dict_parameters[key] = getattr(args, key)

    ha_template.main(input_file_path=infile,
                     output_file_path=outfile,
                     dict_parameters=dict_parameters)
