# run under /workspace/generalized_tree_search/webarena
source /workspace/generalized_tree_search/.keys
export DATASET=visualwebarena
# export DATASET=webarena

export CLASSIFIEDS="http://coffee.cs.columbia.edu:57981"
export CLASSIFIEDS_RESET_TOKEN="4b61655535e7ed388f0d40a93600254c"  # Default reset token for classifieds site, change if you edited its docker-compose.yml
export SHOPPING="http://coffee.cs.columbia.edu:55777"
export REDDIT="http://coffee.cs.columbia.edu:55999"
export WIKIPEDIA="http://coffee.cs.columbia.edu:55888"
export SHOPPING_ADMIN="http://coffee.cs.columbia.edu:55988/admin"
export GITLAB="http://coffee.cs.columbia.edu:58023"
export MAP="http://ec2-3-131-244-37.us-east-2.compute.amazonaws.com:3000"
export HOMEPAGE="http://coffee.cs.columbia.edu:55399"

# ### reset login cookies
# rm -rf ./.auth
# mkdir -p ./.auth
# python browser_env/auto_login.py

# ### reset test environment
# ./shells/reset_all.sh

# to view the outputs:
# 1. view trace video: npx playwright show-trace outputs/gpt-3.5-turbo/traces/0.zip
# 2. view trace html: visit http://coffee.cs.columbia.edu:55588/

# EVAL_GPU_IDX=0
# OPEN_AI_MODEL_NAME=gpt-3.5-turbo-1106

# rm -rf outputs/${OPEN_AI_MODEL_NAME}
# CUDA_VISIBLE_DEVICES=${EVAL_GPU_IDX} python run.py \
# --instruction_path agent/prompts/jsons/p_cot_id_actree_3s.json \
# --test_start_idx 0 \
# --test_end_idx 2 \
# --test_config_base_dir=config_files/vwa/test_classifieds \
# --observation_type accessibility_tree_with_captioner \
# --model ${OPEN_AI_MODEL_NAME} \
# --result_dir outputs/${DATASET}/${OPEN_AI_MODEL_NAME} \
# --save_trace_enabled


#### with local model
export OPENAI_API_BASE="http://127.0.0.1:30000/v1"  # sglang hosting ${HF_MODEL_NAME}
HF_MODEL_NAME="meta-llama/Meta-Llama-3-70B-Instruct"
MODEL_ID="llama-3-70b-it"

rm -rf outputs/${MODEL_ID}
python run.py \
--instruction_path agent/prompts/jsons/p_cot_id_actree_3s.json \
--test_start_idx 0 \
--test_end_idx 2 \
--test_config_base_dir=config_files/vwa/test_classifieds \
--observation_type accessibility_tree_with_captioner \
--model ${HF_MODEL_NAME} \
--provider sglang \
--result_dir outputs/${DATASET}/${MODEL_ID} \
--save_trace_enabled