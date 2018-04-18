directory '/opt/Spark' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/log/ingester_spark_work_folder' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/log/ingester_spark_work_folder/local_dir' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

#Download the Apache Spark
execute 'spark_download' do
  command  node['spark']['download']
  cwd     '/opt/Spark'
  creates "/opt/Spark/#{node['spark']['version']}.tgz"
  #not_if  '[ -d /opt/Spark/spark-* ]'
end

#Extract the Apache Spark
  execute 'spark-install' do
  command "tar -xzf #{node.default['spark']['version']}.tgz"
  cwd     '/opt/Spark'
  creates "/opt/Spark/#{node.default['spark']['version']}"
  #not_if  "[ -d /opt/Spark/#{node.default['spark']['version']}"
end

