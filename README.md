# mlenv

A personal `VSCode` server hosted in the Cloud, backed with optional GPUs.

## Use Case

You are a data scientist that wants to train/fine tune a complex Neural
Network. Your hardware is not powerful enough and whilst you've heard great
things about GPUs, there's simply no way you can cash out on a monster GPU.

`mlenv` solves this issue by running an instance of the popular VSCode IDE on
VMs hosted in the cloud. Now you have the power to attach and unattach GPUs at
will for a fraction of the cost when compared to buying one outright.

### How Does It Work?

VSCode introduced a feature that allows you to access VSCode [instances running
on remote servers][vscode-remote-tunnel]. This repository uses this feature by
creating a VM on Google Cloud Platform that you can connect to. The VM itself
has the necessary software pre-installed for you to focus on completing
Data Science tasks such as [EDA][eda] and training models.

### How Do I Use It?

1. [Build the VM][build-vm].
2. [Run the VM][run-vm].
3. Access the instance via https://vscode.dev/tunnel/mlenv.

[vscode-remote-tunnel]: https://code.visualstudio.com/docs/remote/tunnels
[eda]: https://en.wikipedia.org/wiki/Exploratory_data_analysis
[build-vm]: ./docs/how-to/build-the-vm.md
[run-vm]: ./docs/how-to/run-the-vm.md
