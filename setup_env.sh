Root=/home/user/EvoCodeBench
Data_Path=$Root/data.jsonl
Source_Code_Root=$Root/Source_Code



echo "------------------------PYTHON VERSION BEFORE----------------------------" 

python --version
source activate EvoCodeBench
python --version

echo "------------------------PYTHON VERSION AFTER----------------------------" 

apt-get update
apt-get install -y libgl1-mesa-glx

echo "-------------------START--------------------"

# Setup the execution environment for contrastors
cd $Root/Source_Code/contrastors
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir torch torchvision torchaudio
pip install --no-cache-dir wheel packaging ninja setuptools
pip install --no-cache-dir --no-cache-dir flash-attn --no-build-isolation git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/rotary git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/layer_norm git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/fused_dense_lib git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/xentropy
# pip install --no-cache-dir -e . 
pip install --no-cache-dir pytest pytest-runner

deactivate

echo "-------------------CONTRASTORS DONE--------------------"

# Setup the execution environment for EasyVolcap
cd $Root/Source_Code/EasyVolcap
python -m venv myenv && source myenv/bin/activate

cat requirements.txt | sed -e '/^\s*#.*$/d' -e '/^\s*$/d' | xargs -n 1 pip install --no-cache-dir
pip install --no-cache-dir -e . --no-build-isolation --no-deps

pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir opencv-python-headless
deactivate

echo "-------------------EASYVOLCAP DONE--------------------"

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
# Setup the execution environment for gaussian-splatting-lightning
cd $Root/Source_Code/gaussian-splatting-lightning
python -m venv myenv && source myenv/bin/activate

pip install --no-cache-dir torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
git config --global --add safe.directory /home/user/EvoCodeBench/Source_Code/gaussian-splatting-lightning
git submodule sync --recursive
git submodule update --init --recursive --force

pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
pip install --no-cache-dir ./submodules/tiny-cuda-nn-fp32/bindings/torch

deactivate

echo "-------------------gaussian splatting DONE--------------------"

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
# Setup the execution environment for scepter
cd $Root/Source_Code/scepter
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
pip install --no-cache-dir -r requirements/framework.txt
pip install --no-cache-dir -r requirements/tests.txt
pip install --no-cache-dir -r requirements/recommended.txt
pip install --no-cache-dir -r requirements/scepter_studio.txt
pip install --no-cache-dir scepter
pip install --no-cache-dir opencv-python-headless
deactivate


echo "-------------------scepter DONE--------------------"
# Setup the execution environment for microsearch
cd $Root/Source_Code/microsearch
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
deactivate


echo "-------------------microsearhc DONE--------------------"
# Setup the execution environment for UHGEval
cd $Root/Source_Code/UHGEval
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir eval-suite
pip install --no-cache-dir -r requirements.txt
deactivate


echo "-------------------uhgeval DONE--------------------"
# Setup the execution environment for Test-Agent
cd $Root/Source_Code/Test-Agent
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
deactivate


echo "-------------------test-agent DONE--------------------"
# Setup the execution environment for Generalizable-BEV
cd $Root/Source_Code/Generalizable-BEV
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements/readthedocs.txt
pip install --no-cache-dir -r requirements/build.txt
pip install --no-cache-dir -r requirements/tests.txt
pip install --no-cache-dir -r requirements/docs.txt
pip install --no-cache-dir -r requirements/optional.txt
pip install --no-cache-dir -r requirements/runtime.txt
pip install --no-cache-dir -r requirements/mminstall.txt
deactivate


echo "-------------------bev DONE--------------------"
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
# Setup the execution environment for stable-fast
cd $Root/Source_Code/stable-fast
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir wheel 'torch>=2.1.0' 'xformers>=0.0.22' 'triton>=2.1.0' 'diffusers>=0.19.3'
pip install --no-cache-dir ninja
pip install --no-cache-dir -v -U git+https://github.com/chengzeyi/stable-fast.git@main#egg=stable-fast
deactivate


echo "-------------------stable-fast DONE--------------------"
# Setup the execution environment for AutoRAG
cd $Root/Source_Code/AutoRAG
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -e .
deactivate


echo "-------------------auto-rag DONE--------------------"
# Setup the execution environment for stable-diffusion-webui-forge
# TODO: 7z 18g + .bat inside, wtf
cd $Root/Source_Code/stable-diffusion-webui-forge
python -m venv myenv && source myenv/bin/activate
pip install --no-cache-dir pytest pytest-runner
pip install --no-cache-dir -r requirements.txt
deactivate


echo "-------------------webui forge DONE--------------------"
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
