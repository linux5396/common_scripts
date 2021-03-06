#!/bin/usr/python2.7
# coding=utf-8


import sys
import socket


def check_server(address, port):
    s = socket.socket()
    print 'Attempting to connect to %s on port %s' % (address, port)
    try:
        s.connect((address, port))
        print 'Connected to %s on port %s' % (address, port)
        return 0
    except socket.error as e:
        print 'Connection to %s on port %s failed: %s' % (address, port, e)
        return 1


if __name__ == '__main__':
    from argparse import ArgumentParser

    parser = ArgumentParser(description=u'TCP端口检测')
    parser.add_argument(
        '-a',
        '--address',
        dest='address',
        default='localhost',
        help='address for the server')
    parser.add_argument(
        '-p',
        '--port',
        dest="port",
        default=80,
        type=int,
        help='port for the server')
    args = parser.parse_args()
    check = check_server(args.address, args.port)
    print 'check_server returned %s' % check
    # 进程退出码，链接成功则为0
    sys.exit(check)
