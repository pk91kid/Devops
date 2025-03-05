import os
import sys
import time
import jenkins

def get_jenkins_server(jenkins_url, auth):
    return jenkins.Jenkins(jenkins_url, auth[0], auth[1])

def trigger_jenkins_job(server, job_name, parameters=None):
    try:
        queue_item = server.build_job(job_name, parameters)
        print(f"Job '{job_name}' triggered successfully!")
        return queue_item
    except jenkins.JenkinsException as e:
        print(f"Failed to trigger job '{job_name}': {e}")
        return None

def check_job_status(server, job_name, build_number):
    try:
        status = server.get_build_info(job_name, build_number)
        return status['result'], status['inProgress']
    except jenkins.JenkinsException as e:
        print(f"An error occurred while checking job status: {e}")
        return None, False

def wait_for_build_completion(server, queue_item, job_name, timeout=900):
    start_time = time.time()

    while time.time() - start_time < timeout:
        try:
            queue_info = server.get_queue_item(queue_item)
            if 'executable' in queue_info and 'number' in queue_info['executable']:
                build_number = queue_info['executable']['number']
                result, in_progress = check_job_status(server, job_name, build_number)
                if in_progress:
                    print("Job in Progress")
                else:
                    return result if result else "UNKNOWN"
            else:
                print("Waiting for Job to Enter Queue")
            time.sleep(10)  # Poll every 10 seconds

        except jenkins.JenkinsException as e:
            print(f"An error occurred while checking job status: {e}")
        time.sleep(10)  # Poll every 10 seconds

    print(f"Timeout reached ({timeout} seconds) while waiting for job to complete.")
    return "TIMEOUT"

if __name__ == "__main__":
    jenkins_url = os.environ.get("JENKINS_URL", "https://jenkins")
    job_name = sys.argv[1]
    username = os.environ.get("JENKINS_USERNAME")
    api_token = os.environ.get("JENKINS_PASSWORD")
    auth = (username, api_token)

    parameters_arg = sys.argv[2]
    parameters = dict(param.split('=') for param in parameters_arg.split(',')) if parameters_arg else None
    timeout = float(sys.argv[3])

    server = get_jenkins_server(jenkins_url, auth)
    queue_item = trigger_jenkins_job(server, job_name, parameters)
    
    if queue_item:
        build_result = wait_for_build_completion(server, queue_item, job_name, timeout)
        print(build_result)
        if build_result == "SUCCESS":
            print(build_result)
        elif build_result == "TIMEOUT":
            exit(1)
        else:
            exit(1)
