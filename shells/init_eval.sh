# run under the webarena repo root
export SHOPPING="http://coffee.cs.columbia.edu:55777"
export SHOPPING_ADMIN="http://coffee.cs.columbia.edu:55988/admin"
export REDDIT="http://coffee.cs.columbia.edu:55999"
export GITLAB="http://coffee.cs.columbia.edu:58023"
export MAP="http://ec2-3-131-244-37.us-east-2.compute.amazonaws.com:3000"
export WIKIPEDIA="http://coffee.cs.columbia.edu:55888/wikipedia_en_all_maxi_2022-05/A/User:The_other_Kiwix_guy/Landing"
# this is a placeholder
export HOMEPAGE="<your_homepage_domain>:4399"

rm -rf .auth
mkdir -p .auth
python browser_env/auto_login.py