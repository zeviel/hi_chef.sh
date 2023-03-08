#!/bin/bash

api="https://hi-chef.ru"
sign=null
vk_user_id=null
vk_ts=null
vk_ref=null
access_token=null

function authenticate() {
	# 1 - sign: (string): <sign>
	# 2 - vk_user_id: (integer): <vk_user_id>
	# 3 - vk_ts: (integer): <vk_ts>
	# 4 - vk_ref: (string): <vk_ref>
	# 5 - access_token_settings: (string): <access_token_settings - default: >
	# 6 - are_notifications_enabled: (integer): <are_notifications_enabled: default: 0>
	# 7 - is_app_user: (integer): <is_app_user - default: 0>
	# 8 - is_favorite: (integer): <is_favorite - default: 0>
	# 9 - language: (string): <language - default: ru>
	# 10 - platform: (string): <platform - default: desktop_web>
	sign=$1
	vk_user_id=$2
	vk_ts=$3
	vk_ref=$4
	params="vk_access_token_settings=${5:-}&vk_app_id=7354467&vk_are_notifications_enabled=${6:-0}&vk_is_app_user=${7:-0}&vk_is_favorite=${8:-0}&vk_language=${9:-ru}&vk_platform=${10:-desktop_web}&vk_ref=$vk_ref&vk_ts=$vk_ts&vk_user_id=$vk_user_id&sign=$sign"
}

function get_feed() {
	curl --request GET \
		--url "$api/?platform=vk" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function get_articles() {
	curl --request GET \
		--url "$api/article/?platform=vk" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function get_profile() {
	curl --request GET \
		--url "$api/profile/?platform=vk" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function get_bookmarks() {
	curl --request GET \
		--url "$api/love/?platform=vk" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function get_recipes() {
	# 1 - order: (string): <order - default: rating>
	# 2 - category: (string): <category>
	curl --request GET \
		--url "$api/api/recipes/?order=${1:-rating}&category=$2" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function get_manifest() {
	curl --request GET \
		--url "$api/manifest.json" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function search_prediction() {
	# 1 - query: (string): <query>
	curl --request GET \
		--url "$api/api/search/prediction/?q=$1" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function search() {
	# 1 - query: (string): <query>
	curl --request GET \
		--url "$api/search/?q=$1&platform=vk" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function get_recipe_info() {
	# 1 - recipe_name: (string): <recipe_name>
	curl --request GET \
		--url "$api/recipe/$1/?platform=vk" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}

function get_recipe_metro_cart() {
	# 1 - recipe_id: (integer): <recipe_id>
	curl --request GET \
		--url "$api/api/recipes/$1/metro_cart/" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}


function bookmark_recipe() {
	# 1 - recipe_id: (integer): <recipe_id>
	curl --request POST \
		--url "$api/api/bookmarks/$1/" \
		--user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36" \
		--header "content-type: application/json" \
		--header "referer: https://hi-chef.ru/?$params"
}
