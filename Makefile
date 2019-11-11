.PHONY: clean clean-test clean-pyc clean-build docs help

help:
	@echo "  install-dev       to install in editable mode with development dependencies"
	@echo "  setup-pre-commit  to setup pre-commit to run every commit."

clean: clean-build clean-pyc clean-test ## remove all build, test, coverage and Python artifacts

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test: ## remove test and coverage artifacts
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/

test: ## run tests quickly with the default Python
	py.test -v --boxed

test-all: ## run tests on every Python version with tox
	tox

coverage: ## check code coverage quickly with the default Python
	coverage run --source manage py.test

		coverage report -m
		coverage html
		$(BROWSER) htmlcov/index.html

docs: ## generate Sphinx HTML documentation, including API docs
	rm -f docs/manage.rst
	rm -f docs/modules.rst
	sphinx-apidoc -o docs/ manage
	$(MAKE) -C docs clean
	$(MAKE) -C docs html
	$(BROWSER) docs/_build/html/index.html

install-dev:
	pip install --upgrade pip
	pip install -e .[dev]
	make setup-pre-commit

setup-pre-commit:
	pre-commit install
	pre-commit install-hooks
