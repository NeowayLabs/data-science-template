from os import path

import model_name

base_path = path.dirname(path.dirname(model_name.__file__))
workspace_path = path.join(base_path, 'workspace')
data_path = path.join(workspace_path, 'data')
models_path = path.join(workspace_path, 'models')
