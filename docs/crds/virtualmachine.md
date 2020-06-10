# VirtualMachines

VirtualMachine 代表 OneCloud 中的虚拟机实例。

创建一个 VirtualMachine 就会在 OneCloud 中创建一个符合 VirtualMachine 的 Spec 描述的虚拟机实例。

对 VirtualMachine 执行的更新或者删除操作，也会应用到 OneCloud 中对应的虚拟机实例上。

## Creating a VirtualMachine

下面是一个创建 VirtualMahine 的例子, 它将会创建一个2C4G，系统盘大小40G，系统镜像为`CentOS-7.6.1810-20190430.qcow2`，数据盘大小为20G，属于`Default`域`lizexi`项目的，名字为`vm-example`的 kvm 虚拟机。

```yaml
apiVersion: onecloud.yunion.io/v1
kind: VirtualMachine
metadata:
  name: vm-example
spec:
  description: k8s create
  vmConfig:
    hypervisor: kvm
    vcpuCount: 2
    vmemSizeGB: 4
    rootDisk:
      image: CentOS-7.6.1810-20190430.qcow2
      sizeGB: 40
    dataDisks:
      - sizeGB: 20
  projectConfig:
    project: lizexi
    projectDomain: Default
```
`spec`还支持更多的属性，比如`NewEip`（自动创建并绑定EIP），`secgroup`（安全组）。

详细情况请参考 [VirtualMachine](../api/docs.md#onecloud.yunion.io/v1.VirtualMachine)

