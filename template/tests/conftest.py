import pytest


@pytest.fixture(scope='session')
def fixture_example():
    return 42
