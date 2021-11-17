# cool-windows-ami-sharing #

[![GitHub Build Status](https://github.com/cisagov/cool-windows-ami-sharing/workflows/build/badge.svg)](https://github.com/cisagov/cool-windows-ami-sharing/actions)

This project provides access to the latest Windows AMI to all `env` accounts
and any extra accounts specified. It duplicates the functionality seen in
[our Packer projects](https://github.com/cisagov/skeleton-packer/tree/develop/terraform-post-packer).

## Usage ##

```console
terraform workspace select ENVIRONMENT_TYPE
terraform init -upgrade=true
terraform apply
```

## Requirements ##

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| aws | ~> 3.38 |

## Providers ##

| Name | Version |
|------|---------|
| aws | ~> 3.38 |
| aws.master | ~> 3.38 |

## Modules ##

| Name | Source | Version |
|------|--------|---------|
| ami\_launch\_permission | github.com/cisagov/ami-launch-permission-tf-module | n/a |

## Resources ##

| Name | Type |
|------|------|
| [aws_ami_ids.historical_amis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami_ids) | data source |
| [aws_caller_identity.images](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_organizations_organization.cool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| extraorg\_account\_ids | A list of AWS account IDs corresponding to "extra" accounts with which you want to share this AMI (e.g. ["123456789012"]).  Normally this variable is used to share an AMI with accounts that are not a member of the same AWS Organization as the account that owns the AMI. | `list(string)` | `[]` | no |
| recent\_ami\_count | The number of most-recent AMIs for which to grant launch permission (e.g. "3").  If this variable is set to three, for example, then accounts will be granted permission to launch the three most recent AMIs (or all most recent AMIs, if there are only one or two of them in existence). | `number` | `12` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| launch\_permissions | The cisagov/ami-launch-permission-tf-module for each AMI to which launch permission is being granted. |

## Notes ##

Running `pre-commit` requires running `terraform init` in every directory that
contains Terraform code. In this repository, this is only the main directory.

## Contributing ##

We welcome contributions!  Please see [`CONTRIBUTING.md`](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
