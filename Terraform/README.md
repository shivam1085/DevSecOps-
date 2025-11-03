# Terraform to EKS Mapping

Our Terraform creates an EKS cluster with:
- `vpc.tf`: Network isolation with public/private subnets
- `subnet.tf`: Multi-AZ subnet configuration
- `cluster.tf`: EKS control plane and worker nodes in private subnets

Note: Run `terraform init` to download provider files locally.



## Network Architecture

```
                                     │
                                     ▼
                               Internet Gateway
                                     │
                         ┌──────────┴──────────┐
                         │                     │
                    Public Subnet        Public Subnet
                    (Zone A)            (Zone B)
                         │                     │
                         │                     │
                    NAT Gateway          NAT Gateway
                         │                     │
                         │                     │
                   Private Subnet       Private Subnet
                   (Worker Nodes)      (Worker Nodes)
                         │                     │
                         └──────────┬──────────┘
                                   │
                              EKS Cluster
```

## Security Considerations

1. **Network Security**
   - VPC isolation
   - Security group configurations
   - Private subnets for worker nodes
   - Controlled internet access through NAT gateways

2. **Access Control**
   - IAM roles for service accounts
   - RBAC configuration
   - Security group rules
   - Network policies

3. **Data Security**
   - Encryption at rest
   - Encryption in transit
   - KMS integration
   - Secrets management

## Resource Management

The configuration creates the following AWS resources:
- 1 VPC
- 2+ Subnets (Public and Private)
- 1 Internet Gateway
- 2+ NAT Gateways
- 1 EKS Cluster
- 1+ Node Groups
- Multiple Security Groups
- Various IAM Roles and Policies



## Scaling Considerations

The infrastructure is designed to scale based on:
- Node group auto-scaling configurations
- Multi-AZ deployment for high availability
- Configurable instance types for different workloads
- Separate node groups for different application requirements

## Best Practices Implemented

1. **High Availability**
   - Multi-AZ deployment
   - Redundant NAT gateways
   - Auto-scaling configurations

2. **Security**
   - Private subnets for worker nodes
   - Security group restrictions
   - IAM least privilege principle

3. **Networking**
   - VPC design best practices
   - Subnet CIDR planning
   - Route table configurations

## Maintenance and Updates

For maintaining this infrastructure:
1. Use `terraform plan` to review changes
2. Implement changes in staging environment first
3. Keep track of AWS provider versions
4. Regularly update EKS versions
5. Monitor CloudWatch metrics
6. Review security group rules periodically