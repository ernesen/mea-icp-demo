sudo -i

mkdir -p /opt/data

chmod 777 /opt/data

echo "/opt/data 10.245.1.2/24(rw,sync,no_root_squash,no_all_squash)"  >> /etc/exports

c

systemctl enable --now nfs-server

systemctl start rpcbind

systemctl start nfs-server

mkdir -p /opt/data/vol/0

mkdir -p /opt/data/vol/1

mkdir -p /opt/data/vol/2

mkdir -p /opt/data/content