{
  lib,
  buildPythonPackage,
  fetchPypi,
  boltons,
  pytestCheckHook,
  pythonOlder,
  setuptools,
}:

buildPythonPackage rec {
  pname = "face";
  version = "22.0.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1daS+QvI9Zh7Y25H42OEubvaSZqvCneqCwu+g0x2kj0=";
  };

  build-system = [ setuptools ];

  dependencies = [ boltons ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "face" ];

  disabledTests = [
    # Assertion error as we take the Python release into account
    "test_search_prs_basic"
  ];

  meta = with lib; {
    description = "Command-line interface parser and framework";
    longDescription = ''
      A command-line interface parser and framework, friendly for
      users, full-featured for developers.
    '';
    homepage = "https://github.com/mahmoud/face";
    license = licenses.bsd3;
    maintainers = with maintainers; [ twey ];
  };
}
