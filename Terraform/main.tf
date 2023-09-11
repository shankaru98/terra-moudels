module "create_ec2" {
  source = "github.com/shankaru98/new-terrafrom.git//create_ec2"
  ec2_type = var.root_ec2_type
  ec2_pem = module.create_pem.ec2_pem
  ec2_sg_id = module.create_sg.sg_id

}