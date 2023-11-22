#!/bin/bash

cd /src
python -m pip install --prefix=$(python -m site --user-base) -e /src/neuro_data
python -m pip uninstall featurevis -y
python -m pip install git+https://github.com/Zhiweid/featurevis.git
python -m pip install --prefix=$(python -m site --user-base) -e /src/static-networks

git config --global --add safe.directory '*'
git config --global user.name "Zhuokun Ding"
git config --global user.email "zkding@outlook.com"
cd /notebooks || {
	echo "cd failed"
	exit
}
jupyter lab --ip=0.0.0.0 --allow-root --NotebookApp.token="${JUPYTER_PASSWORD:-}" --no-browser
