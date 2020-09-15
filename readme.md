## 报告
我只使用SE CERT进行了分析了部分代码
见目录html_reporter，每一个子目录对应鸿蒙2.0源码的一个目录。目录xml是报告的xml格式。 点击 index.html使用浏览器查看

如果你想自己分析按照下面步骤，
## Install Tools
### 下载开源工具cppcheck源码和鸿蒙源码

`chmod a+x donwload.sh &&  ./download.sh`
运行完后，你的目录下会看到静态代码检测的目录cppcheck-2.1和harmonyos2.0源码目录

## Compile and Install cppcheck
`chmod a+x install_cppcheck.sh && ./install_cppcheck.sh`
安装完成后你可以使用, `cppcheck -h`,来查看选项
- 工具网址， http://cppcheck.sourceforge.net/
- 在线文档， http://cppcheck.sourceforge.net/#unique
- 在线教程， http://cppcheck.sourceforge.net/manual.pdf
- check list, https://sourceforge.net/p/cppcheck/wiki/ListOfChecks/


## 如何使用
举例， 使用安全编程标准， [SEI CERT](https://www.sei.cmu.edu/research-capabilities/all-work/display.cfm?customel_datapageid_4050=21274).
例子脚本check_cert.sh
```bash
#!/bin/bash
# Use the code guideline, https://www.sei.cmu.edu/research-capabilities/all-work/display.cfm?customel_datapageid_4050=21274  to check 
# arguments is the list of folder you want to check.
# base domains drivers foundation kernel/liteos_a kernel/liteos_m utils vendor
for dir in $@
do
	name=$( basename $dir )
	cppcheck --addon=cert.py --xml  --bug-hunting --enable=all --max-ctu-depth=6  --output-file=${name}_report.xml -I . --config-exclude=third_party/ ${dir}
	echo $dir >> analysis.log
done
```
使用check_cert.sh检查鸿蒙源码,复制check_cert.sh到鸿蒙源码根目录
`chmod a+x check_cert.sh && cp  harmonyos2.0 && cd harmonyos2.0`
运行check_cert.sh,检查如下目录

`./check_cert.sh base domains drivers foundation kernel/liteos_a kernel/liteos_m utils`
vendor太大了，如果你的计算资源足够，可以检查它。
脚本check_cert.sh运行完后，你会看到对应每个目录的输出结果xml文件


cppcheck提供了把xml文件转换为html报告的Python脚本,具体见 http://cppcheck.sourceforge.net/manual.pdf ，最后一章
在cppcheck-2.1目录下，有一个目录 htmlreport
帮助信息， `htmlreport/cppcheck-htmlreport -h`

## 报告
见目录html_reporter，每一个子目录对应鸿蒙2.0源码的一个目录。目录xml是报告的xml格式。
点击 index.html使用浏览器查看
