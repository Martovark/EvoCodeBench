Root=/home/user/EvoCodeBench
Data_Path=$Root/data.jsonl
Source_Code_Root=$Root/Source_Code

apt-get update
apt-get install -y libgl1-mesa-glx

# Setup the execution environment for contrastors
cd $Root/Source_Code/contrastors
python3.10 -m venv myenv && source myenv/bin/activate
pip3 install torch torchvision torchaudio
pip install wheel packaging ninja setuptools
pip install --no-cache-dir flash-attn --no-build-isolation git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/rotary git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/layer_norm git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/fused_dense_lib git+https://github.com/HazyResearch/flash-attention.git#subdirectory=csrc/xentropy
pip install -e . 
pip install pytest pytest-runner

deactivate


# Setup the execution environment for EasyVolcap
cd $Root/Source_Code/EasyVolcap
python3.10 -m venv myenv && source myenv/bin/activate

cat requirements.txt | sed -e '/^\s*#.*$/d' -e '/^\s*$/d' | xargs -n 1 pip install
pip install -e . --no-build-isolation --no-deps

pip install pytest pytest-runner
pip install opencv-python-headless
deactivate


# Setup the execution environment for microagents
cd $Root/Source_Code/microagents
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt
deactivate


# Setup the execution environment for XAgent
cd $Root/Source_Code/XAgent # TODO: None of tests work.
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt
deactivate


# Setup the execution environment for litdata
cd $Root/Source_Code/litdata
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner

pip install litdata
pip install -r requirements.txt
pip install -r requirements/test.txt
pip uninstall --yes numpy
pip install numpy==1.24.0
deactivate


# Setup the execution environment for gaussian-splatting-lightning
cd $Root/Source_Code/gaussian-splatting-lightning
python3.10 -m venv myenv && source myenv/bin/activate

pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
git config --global --add safe.directory /home/user/EvoCodeBench/Source_Code/gaussian-splatting-lightning
git submodule sync --recursive
git submodule update --init --recursive --force

pip install pytest pytest-runner
pip install -r requirements.txt
pip install ./submodules/tiny-cuda-nn-fp32/bindings/torch

deactivate


# Setup the execution environment for open-iris
cd $Root/Source_Code/open-iris
python3.10 -m venv myenv && source myenv/bin/activate
pip install open-iris
pip install pytest pytest-runner
pip install -r requirements/base.txt
pip install -r requirements/dev.txt
pip install -r requirements/server.txt
pip install opencv-python-headless
deactivate


# Setup the execution environment for tanuki_py
cd $Root/Source_Code/tanuki_py
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
pip install -r requirements.txt
deactivate


# Setup the execution environment for skfolio
cd $Root/Source_Code/skfolio
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
deactivate


# Setup the execution environment for UniRef
cd $Root/Source_Code/UniRef
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt

pip install -e .
pip uninstall --yes Pillow
pip install Pillow==9.5.0
pip install opencv-python-headless
deactivate


# Setup the execution environment for scepter
cd $Root/Source_Code/scepter
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt
pip install -r requirements/framework.txt
pip install -r requirements/tests.txt
pip install -r requirements/recommended.txt
pip install -r requirements/scepter_studio.txt
pip install scepter
pip install opencv-python-headless
deactivate


# Setup the execution environment for microsearch
cd $Root/Source_Code/microsearch
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
deactivate


# Setup the execution environment for UHGEval
cd $Root/Source_Code/UHGEval
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install eval-suite
pip install -r requirements.txt
deactivate


# Setup the execution environment for Test-Agent
cd $Root/Source_Code/Test-Agent
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt
deactivate


# Setup the execution environment for Generalizable-BEV
cd $Root/Source_Code/Generalizable-BEV
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements/readthedocs.txt
pip install -r requirements/build.txt
pip install -r requirements/tests.txt
pip install -r requirements/docs.txt
pip install -r requirements/optional.txt
pip install -r requirements/runtime.txt
pip install -r requirements/mminstall.txt
deactivate


# Setup the execution environment for ollama-python
cd $Root/Source_Code/ollama-python
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
pip install pytest-httpserver
pip install Pillow==9.5.0
pip install -r requirements.txt
deactivate


# Setup the execution environment for Python-Type-Challenges
cd $Root/Source_Code/Python-Type-Challenges
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt
deactivate


# Setup the execution environment for stable-fast
cd $Root/Source_Code/stable-fast
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip3 install wheel 'torch>=2.1.0' 'xformers>=0.0.22' 'triton>=2.1.0' 'diffusers>=0.19.3'
pip3 install ninja
pip3 install -v -U git+https://github.com/chengzeyi/stable-fast.git@main#egg=stable-fast
deactivate


# Setup the execution environment for AutoRAG
cd $Root/Source_Code/AutoRAG
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
deactivate


# Setup the execution environment for stable-diffusion-webui-forge
# TODO: 7z 18g + .bat inside, wtf
cd $Root/Source_Code/stable-diffusion-webui-forge
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt
deactivate


# Setup the execution environment for openlogprobs
cd $Root/Source_Code/openlogprobs
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
pip install transformers
deactivate


# Setup the execution environment for camp_zipnerf
cd $Root/Source_Code/camp_zipnerf
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -r requirements.txt
git clone https://github.com/rmbrualla/pycolmap.git ./internal/pycolmap
pip uninstall --yes scipy
pip install scipy==1.10.0
deactivate


# Setup the execution environment for nlm-ingestor
cd $Root/Source_Code/nlm-ingestor
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install nlm_ingestor==0.1.7
python -c "import nltk; nltk.download('punkt')"
deactivate


# Setup the execution environment for searcharray
cd $Root/Source_Code/searcharray
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
deactivate


# Setup the execution environment for deluder
cd $Root/Source_Code/deluder
python3.10 -m venv myenv && source myenv/bin/activate
pip install pytest pytest-runner
pip install -e .
deactivate


cd $Root
python update_test_path.py \
    --data_path $Data_Path \
    --source_code_root $Source_Code_Root
