resource "null_resource" "scalegrid_login" {
    provisioner "local-exec" {
        command = "curl -k https://console.scalegrid.io/login -c cookiejar.txt -d '{'username': '${var.scalegrid_username}', 'password': '${var.scalegrid_password}'}'"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "scalegrid_deploy_cluster" {
    depends_on = [null_resource.scalegrid_login]
    
    provisioner "local-exec" {
        command = "touch input.json && echo '{'clusterName': '${var.cluster_name}', 'version': '${var.redis_version}', 'serverCount': ${var.server_count}, 'shardCount': ${var.shard_count}, 'size': '${var.size}', 'backupIntervalInHours': ${var.backup_interval}, 'machinePoolIDList': ['${var.machine_pool_list}'], 'cidrList': ['${var.cidr_list}'], 'encryptDisk': true }' > input.json"
        interpreter = [ "/bin/bash","-c"]
    }

    provisioner "local-exec" {
        command = "curl -i https://console.scalegrid.io/RedisClusters/create -b cookiejar.txt -d input.json"
        interpreter = [ "/bin/bash","-c"]
    }
}