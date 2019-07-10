resource "aws_instance" "Jenkins" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  count           = "1"
  security_groups = ["${aws_security_group.jenkins.id}"]
  key_name        = "master"
  subnet_id       = "${element(data.aws_subnet_ids.all.ids, count.index)}"

  tags = {
    Name = "Jenkins"
  }
}
