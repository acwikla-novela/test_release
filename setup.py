from os import environ

from setuptools import setup, find_packages
setup(
    name='test_release',
    version={{ environ['VERSION'] }},
    author='Aleksander Cwikla',
    url="https://github.com/acwikla-novela/test_release",
    packages=find_packages(),
    description='Testing auto-release',
    platforms='Posix; MacOS X; Windows',
    python_requires='==3.7.4',
)
