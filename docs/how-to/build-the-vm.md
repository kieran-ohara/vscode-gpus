# Build the VM

## Prerequisites

Before starting, I assume that you have already configured Google Cloud
Platform (GCP) as follows:

- You have a [GCP][gcp] account
- You have created a [service account][serviceaccount] that has permissions to
  create a VM Instance.
- You have downloaded the service account's [auth JSON][serviceaccountkey]
  file.

I assume you have installed the following software:

- [Packer][packer].
- [Python 3][python3].

## Steps

1. Copy the file `./vm/build.pkrvars.hcl` to `./vm/build.auto.pkrvars.hcl`.
   Modify the variables in the new file appropriately.
2. Make the path of your service account JSON visible to Packer by running `$
   export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service.json`.
3. Run `$ make vm` in your terminal.

[gcp]: https://cloud.google.com/
[serviceaccount]: https://cloud.google.com/iam/docs/service-accounts
[serviceaccountkey]: https://cloud.google.com/iam/docs/creating-managing-service-account-keys#iam-service-account-keys-create-console
[packer]: https://www.packer.io/
[python3]: https://www.python.org/
