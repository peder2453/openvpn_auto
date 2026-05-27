# openvpn_auto

## 登陆openvpn脚本，安装依赖并初始化
1. 准备环境和脚本
brew install openvpn expect oath-toolkit

2. 安装和初始化 hammerspoon
brew install --cask hammerspoon
指定hammerspoon的配置文件默认位置，需要在openvpn_auto根目录执行
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$PWD/init.lua"

3. 更新个人账号密码和认证信息
1) 替换证书(找到你本地的证书，替换)
f=$(find ~/Library/Application\ Support/OpenVPN\ Connect/profiles -type f | head -n 1)
sed -n '/<ca>/,/<\/tls-crypt-v2>/p' "$f" >> .openvpn_script/config.ovpn
2) 替换auth.txt内容，内容为你的openvpn用户名密码
3) 替换锁屏密码和opt密钥，位置在vpn-auto.exp的前几行

4. 启动 hammerspoon

5. 按下 option+command+O 连接vpn

6. 查看openvpn运行日志
sudo tail -f .openvpn_script/openvpn.log

7. 查看vpn-auto.exp脚本操作日志
tail -f .openvpn_script/exec_openvpn.log
