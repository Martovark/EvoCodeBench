Root=/home/user/EvoCodeBench
Data_Path=$Root/data.jsonl
Source_Code_Root=$Root/Source_Code


echo "------------------------PYTHON VERSION BEFORE----------------------------" 

python --version
source activate EvoCodeBench


echo "------------------------PYTHON VERSION AFTER----------------------------" 
python --version


apt-get update
apt-get install -y libgl1-mesa-glx

echo "-------------------START--------------------"

# Setup the execution environment for microagents
cd $Root/Source_Code/microagents
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
deactivate
echo "-------------------microagents DONE--------------------"

# Setup the execution environment for XAgent
cd $Root/Source_Code/XAgent # TODO: None of tests work.
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
deactivate
echo "-------------------xagent DONE--------------------"

# Setup the execution environment for litdata
cd $Root/Source_Code/litdata
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir litdata
pip install --no-cache-dir -r requirements.txt
pip install --no-cache-dir -r requirements/test.txt
pip uninstall --yes numpy
pip install --no-cache-dir numpy==1.24.0
deactivate
echo "-------------------litdata DONE--------------------"

# Setup the execution environment for open-iris
cd $Root/Source_Code/open-iris
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir open-iris
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements/base.txt
pip install --no-cache-dir -r requirements/dev.txt
pip install --no-cache-dir -r requirements/server.txt
pip install --no-cache-dir opencv-python-headless
deactivate
echo "-------------------open iris DONE--------------------"

# Setup the execution environment for tanuki_py
cd $Root/Source_Code/tanuki_py
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
pip install --no-cache-dir -r requirements.txt
deactivate
echo "-------------------tanuki DONE--------------------"

# Setup the execution environment for skfolio
cd $Root/Source_Code/skfolio
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
deactivate
echo "-------------------skfolio DONE--------------------"

# Setup the execution environment for UniRef
cd $Root/Source_Code/UniRef
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
pip install --no-cache-dir -e .
pip uninstall --yes Pillow
pip install --no-cache-dir Pillow==9.5.0
pip install --no-cache-dir opencv-python-headless
deactivate
echo "-------------------uniref DONE--------------------"


# Setup the execution environment for microsearch
cd $Root/Source_Code/microsearch
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
deactivate
echo "-------------------microsearhc DONE--------------------"

# Setup the execution environment for ollama-python
cd $Root/Source_Code/ollama-python
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
pip install --no-cache-dir pytest-httpserver
pip install --no-cache-dir Pillow==9.5.0
pip install --no-cache-dir -r requirements.txt
deactivate
echo "-------------------ollama DONE--------------------"

# Setup the execution environment for Python-Type-Challenges
cd $Root/Source_Code/Python-Type-Challenges
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
deactivate
echo "-------------------type DONE--------------------"

# Setup the execution environment for AutoRAG
cd $Root/Source_Code/AutoRAG
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
deactivate
echo "-------------------autorag DONE--------------------"

# Setup the execution environment for openlogprobs
cd $Root/Source_Code/openlogprobs
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
pip install --no-cache-dir transformers
deactivate
echo "-------------------openlog DONE--------------------"

# Setup the execution environment for camp_zipnerf
cd $Root/Source_Code/camp_zipnerf
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
git clone https://github.com/rmbrualla/pycolmap.git ./internal/pycolmap
pip uninstall --yes scipy
pip install --no-cache-dir scipy==1.10.0
deactivate
echo "-------------------zipnerf DONE--------------------"

# Setup the execution environment for nlm-ingestor
cd $Root/Source_Code/nlm-ingestor
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir nlm_ingestor==0.1.7
python -c "import nltk; nltk.download('punkt')"
deactivate
echo "-------------------ingestor DONE--------------------"

# Setup the execution environment for searcharray
cd $Root/Source_Code/searcharray
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
deactivate
echo "-------------------searcharray DONE--------------------"

# Setup the execution environment for deluder
cd $Root/Source_Code/deluder
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
deactivate
echo "-------------------deluder DONE--------------------"


cd $Root
python update_test_path.py \
    --data_path $Data_Path \
    --source_code_root $Source_Code_Root
