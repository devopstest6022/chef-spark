cookbook_file '/etc/init.d/spark-uspto' do
  source 'spark-uspto'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

_service_chkconfig_exec="Check config for #{node['spark']['service_name']} service"
execute 'service_chkconfig_exec' do
    command "/sbin/chkconfig --add #{node['spark']['service_name']}"
    not_if  "/sbin/chkconfig --list #{node['spark']['service_name']}"
    user    'root'
end

service 'spark-uspto' do
  service_name node['spark']['service_name']
  supports [:start, :restart, :reload, :status]
  action [:enable, :start]
  subscribes :reload, 'template[["/opt/Spark/#{spark_version}/conf/slaves"], ["/opt/#{spark_version}/conf/spark-env.sh"], ["/opt/#{spark_version}/conf/spark-defaults.conf"]]', :immediately
end

