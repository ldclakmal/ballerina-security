import json
import os
import re
import sys
import urllib.request

import networkx as nx
from retry import retry

HTTP_REQUEST_RETRIES = 3
HTTP_REQUEST_DELAY_IN_SECONDS = 2
HTTP_REQUEST_DELAY_MULTIPLIER = 2

BALLERINA_ORG_NAME = "ballerina-platform"
BALLERINA_ORG_URL = "https://github.com/ballerina-platform/"
GITHUB_BADGE_URL = "https://img.shields.io/github/"

BALLERINA_STANDARD_LIBRARY_REPO_NAME = "ballerina-standard-library"
BALLERINA_STANDARD_LIBRARY_REPO_API_URL = "https://api.github.com/repos/ballerina-platform/ballerina-standard-library/"

bot_token = os.environ["packagePAT"]

def main():
    print('Started to update dashboard.')
    module_details_json = get_module_names_list()
    update_dashboard(module_details_json)
    print('Successfully updated the dashboard.')


def get_module_names_list():
    try:
        with open('./issues/resources/module_list.json') as f:
            name_list = json.load(f)
    except:
        print('Failed to read module_list.json')
        sys.exit()
    module_details_json = {'modules': []}
    for module in name_list['modules']:
        module_details_json['modules'].append({'name': module['name']})
    return module_details_json


# Returns the file in the given URL
# Retry decorator will retry the function 3 times, doubling the backoff delay if URLError is raised
@retry(
    urllib.error.URLError,
    tries=HTTP_REQUEST_RETRIES,
    delay=HTTP_REQUEST_DELAY_IN_SECONDS,
    backoff=HTTP_REQUEST_DELAY_MULTIPLIER
)
def url_open_with_retry(url):
    request = urllib.request.Request(url)
    request.add_header('Accept', 'application/vnd.github.v3+json')
    request.add_header('Authorization', 'Bearer ' + bot_token)
    return urllib.request.urlopen(request)

def update_dashboard(module_details_json):
    try:
        readme_file = url_open_with_retry(
            "https://raw.githubusercontent.com/ldclakmal/ballerina-security/master/issues/README.md")
    except:
        print('Failed to read README.md file')
        sys.exit()
    updated_readme_file = ''
    for line in readme_file:
        processed_line = line.decode("utf-8")
        updated_readme_file += processed_line
        if "### Dashboard" in processed_line:
            updated_readme_file += "\n"
            updated_readme_file += "[![Total Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-standard-library/area/security?label=Total%20Security%20Issues)](https://github.com/ballerina-platform/ballerina-standard-library/issues?q=is%3Aopen+is%3Aissue+label%3Aarea%2Fsecurity)\n"
            updated_readme_file += "[![Total Bugs](" + GITHUB_BADGE_URL + "issues-search/" + BALLERINA_ORG_NAME + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "?"
            + get_query_for_all_issues_by_type("Bug") + ")](" + get_link_for_all_issues_by_type("Bug") + ")\n"
            updated_readme_file += "| Module | Issues | Bugs | Improvements | New Features | Tasks |\n"
            updated_readme_file += "|:---|:---:|:---:|:---:|:---:|:---:|\n"
            break
    # A single row in the table is created for each module in the module list
    for module in module_details_json['modules']:
        row = ("|[" + module['name'].split('-')[-1] + "](" + BALLERINA_ORG_URL + module['name'] + ")| " +
               "[![Issues](" + GITHUB_BADGE_URL + "issues-search/" + BALLERINA_ORG_NAME + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "?"
               + get_all_issue_query(module) + ")](" + get_all_issue_link(module) + ")| " +
               "[![Bugs](" + GITHUB_BADGE_URL + "issues-search/" + BALLERINA_ORG_NAME + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "?"
               + get_query(module, "Bug") + ")](" + get_link(module, "Bug") + ")| " +
               "[![Improvements](" + GITHUB_BADGE_URL + "issues-search/" + BALLERINA_ORG_NAME + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "?"
               + get_query(module, "Improvement") + ")](" + get_link(module, "Improvement") + ")| " +
               "[![NewFeatures](" + GITHUB_BADGE_URL + "issues-search/" + BALLERINA_ORG_NAME + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "?"
               + get_query(module, "NewFeature") + ")](" + get_link(module, "NewFeature") + ")| " +
               "[![Tasks](" + GITHUB_BADGE_URL + "issues-search/" + BALLERINA_ORG_NAME + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "?"
               + get_query(module, "Task") + ")](" + get_link(module, "Task") + ")|\n")
        updated_readme_file += row
    try:
        with open('./issues/README.md', 'w') as README:
            README.seek(0)
            README.write(updated_readme_file)
            README.truncate()
    except:
        print('Failed to write to README.md')
        sys.exit()


def get_all_issue_query(module):
    module_name = module['name']
    try:
        data = url_open_with_retry(BALLERINA_STANDARD_LIBRARY_REPO_API_URL + "issues?state=open&labels=area/security,module/" + get_module_short_name(module_name))
        json_data = json.load(data)
        issue_count = len(json_data)
    except Exception as e:
        print('Failed to get issue details for ' + module_name + ": " + str(e))
        issue_count = 1
    if issue_count == 0:
        label_colour = "brightgreen"
    else:
        label_colour = "yellow"
    return "query=is%3Aopen+label%3Aarea%2Fsecurity+label%3Amodule%2F" + get_module_short_name(module_name) + "&label=&color=" + label_colour + "&logo=github"


def get_query(module, type):
    module_name = module['name']
    try:
        data = url_open_with_retry(BALLERINA_STANDARD_LIBRARY_REPO_API_URL + "issues?state=open&labels=area/security,Type/" + type + ",module/" + get_module_short_name(module_name))
        json_data = json.load(data)
        issue_count = len(json_data)
    except Exception as e:
        print('Failed to get issue details for ' + module_name + ": " + str(e))
        issue_count = 1
    if issue_count == 0:
        label_colour = "brightgreen"
    else:
        label_colour = "yellow"
    return "query=is%3Aopen+label%3Aarea%2Fsecurity+label%3AType%2F" + type + "+label%3Amodule%2F" + get_module_short_name(module_name) + "&label=&color=" + label_colour + "&logo=github"

def get_query_for_all_issues_by_type(type):
    try:
        data = url_open_with_retry(BALLERINA_STANDARD_LIBRARY_REPO_API_URL + "issues?state=open&labels=area/security,Type/" + type)
        json_data = json.load(data)
        issue_count = len(json_data)
    except Exception as e:
        print('Failed to get all issue details: ' + str(e))
        issue_count = 1
    if issue_count == 0:
        label_colour = "brightgreen"
    else:
        label_colour = "yellow"
    return "query=is%3Aopen+label%3Aarea%2Fsecurity+label%3AType%2F" + type + "&label=&color=" + label_colour + "&logo=github"


def get_all_issue_link(module):
    return BALLERINA_ORG_URL + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "/issues?q=is%3Aopen+label%3Aarea%2Fsecurity+label%3Amodule%2F" + get_module_short_name(module['name'])

def get_link(module, type):
    return BALLERINA_ORG_URL + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "/issues?q=is%3Aopen+label%3Aarea%2Fsecurity+label%3AType%2F" + type + "+label%3Amodule%2F" + get_module_short_name(module['name'])

def get_link_for_all_issues_by_type(type):
    return BALLERINA_ORG_URL + "/" + BALLERINA_STANDARD_LIBRARY_REPO_NAME + "/issues?q=is%3Aopen+label%3Aarea%2Fsecurity+label%3AType%2F" + type

def get_module_short_name(module_name):
    return module_name.split("-")[-1]

main()
