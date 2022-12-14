resource "null_resource" "scalegrid_login" {
    provisioner "local-exec" {
        command = "curl -k https://console.scalegrid.io/login -c cookiejar.txt -H 'Content-Type: application/json' --data-raw '{'username': '${var.scalegrid_username}', 'password': '${var.scalegrid_password}'}'"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "scalegrid_deploy_cluster" {
    depends_on = [null_resource.scalegrid_login]

    provisioner "local-exec" {
        command = <<EOT
            CLUSTER_ID=$(curl -k https://console.scalegrid.io/RedisClusters/create \
            -b cookiejar.txt \
            -H 'Content-Type: application/json' \
            --data-raw '{"clusterName": "${var.cluster_name}", "version": "${var.redis_version_map[var.redis_version]}", "serverCount": ${var.server_count}, "shardCount": ${var.shard_count}, "size": "${var.size_map[var.size]}", "backupIntervalInHours": ${var.backup_interval}, "machinePoolIDList": [${var.machine_pool_map[var.machine_pool_list]}], "cidrList": ["${var.cidr_list}"], "encryptDisk": true }' \
            | jq -r '.clusterID') && echo -n $CLUSTER_ID > cluster_id.txt
        EOT
        interpreter = [ "/bin/bash","-c"]
    }
}

data "local_file" "cluster_id" {
    depends_on = [null_resource.scalegrid_deploy_cluster]
    filename = "cluster_id.txt" 
}