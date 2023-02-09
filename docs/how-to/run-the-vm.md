# Run the VM

## Prerequisites

I assume you have installed the following software:

- [Terraform][terraform].

## Steps

1. Copy the file `./deployment/run.tfvars` to `./deployment/run.auto.tfvars`.
   Modify the variables in the new file appropriately.
2. Make the path of your service account JSON visible to Packer by running `$
   export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service.json`.
3. Run `$ make deployment` in your terminal.
4. Register the VM with VSCode. To do this SSH into your new instance using the
   IP address that was output in the previous step.
5. Run `$ systemctl status vscode` to get your device number.
6. Register this device number with [GitHub][github-device].
7. You can now access your environment at: https://vscode.dev/tunnel/mlenv.

[terraform]: https://www.terraform.io/
[github-device]: https://github.com/login/device
