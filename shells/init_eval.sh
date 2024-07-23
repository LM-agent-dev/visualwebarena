# run under the visualwebarena repo root
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

rm -rf .auth
mkdir -p .auth
python browser_env/auto_login.py

python scripts/generate_test_data.py