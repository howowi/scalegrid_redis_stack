output scalegrid_redis_url {
  value = "https://console.scalegrid.io/application/redisclusters"
}

output cluster_name {
  value = var.cluster_name
}

output size {
  value = var.size
}

output machine_pool_list {
  value = var.machine_pool_list
}

output cluster_id {
  value = "https://console.scalegrid.io/application/${data.local_file.cluster_id.content}"
}