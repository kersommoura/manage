#!/usr/bin/env python
# -*- coding: utf-8 -*-
from setuptools import setup

with open("README.rst") as readme_file:
    readme = readme_file.read()

with open("HISTORY.rst") as history_file:
    history = history_file.read()

setup(
    name="manage",
    version="0.1.13",
    description=(
        "Command Line Manager + Interactive Shell for Python Projects"
    ),
    long_description=readme + "\n\n" + history,
    author="Bruno Rocha",
    author_email="rochacbruno@gmail.com",
    url="https://github.com/python-manage/manage",
    packages=["manage"],
    package_dir={"manage": "manage"},
    entry_points={"console_scripts": ["manage=manage.cli:main"]},
    include_package_data=True,
    install_requires=["Click>=7.0", "PyYAML>=3.11"],
    extras_require={
        "dev": [
            # For `make test-coverage`
            "coveralls",
            # For `make auto-format-code`
            "pre-commit",
            # For `make docs-html` and `make docs-clean`
            "sphinx",
            # For `make package`
            "wheel",
            # For `make publish`
            "twine",
            "tox",
            # TODO evaluate coverage
        ]
    },
    license="ISC license",
    zip_safe=False,
    keywords="manage",
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: ISC License (ISCL)",
        "Natural Language :: English",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
    ],
    test_suite="tests",
    tests_require=["pytest>=2.9.2", "pytest-xdist>=1.14"],
)
