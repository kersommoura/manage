.PHONY: clean clean-test clean-pyc clean-build docs help

help:
	@echo "  clean             to remove all arficats - build, test, coverage."
	@echo "  clean-build       to remove build arficats."
	@echo "  clean-pyc         to remove Python file arficats."
	@echo "  clean-test        to remove test arficats."
	@echo "  coverage          to check code coverage."
	@echo "  docs              to generate documentation."
	@echo "  install-dev       to install in editable mode with development dependencies"
	@echo "  install-dev       to install in editable mode with development dependencies"
	@echo "  setup-pre-commit  to setup pre-commit to run every commit."
	@echo "  test              to run test quickly with the default Python."
	@echo "  test-all          to run test on Python versions with tox."

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
	py.test -sv --cov=manage -l

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
