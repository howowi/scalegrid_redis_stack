resource "null_resource" "scalegrid_login" {
    provisioner "local-exec" {
        command = "curl -k https://console.scalegrid.io/login -c cookiejar.txt -d '{'username': '${var.scalegrid_username}', 'password': '${var.scalegrid_password}'}'"
        interpreter = [ "/bin/bash","-c"]
    }
}

resource "null_resource" "scalegrid_list_cloud" {
    depends_on = [null_resource.scalegrid_login]
    provisioner "local-exec" {
        command = "curl -i https://console.scalegrid.io/clouds/list -b cookiejar.txt"
        interpreter = [ "/bin/bash","-c"]
    }
}