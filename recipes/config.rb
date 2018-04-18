template "/opt/Spark/#{node['spark']['version']}/conf/slaves" do
  source 'slaves.erb'
  variables(
    :worker_nodes => node['spark']['worker_nodes']
  )
  action :create
end

template "/opt/Spark/#{node['spark']['version']}/conf/spark-env.sh" do
  source 'spark-env.sh.erb'
  variables(
    :SPARK_MASTER_HOST        => node['spark']['MASTER_HOST'],
    :SPARK_MASTER_PORT        => node['spark']['MASTER_PORT'],
    :SPARK_WORKER_MEMORY      => node['spark']['WORKER_MEMORY'],
    :SPARK_WORKER_INSTANCES   => node['spark']['WORKER_INSTANCES'],
    :SPARK_EXECUTOR_INSTANCES => node['spark']['EXECUTOR_INSTANCES'],
    :SPARK_WORKER_CORES       => node['spark']['WORKER_CORES'],
    :SPARK_DRIVER_CORES       => node['spark']['DRIVER_CORES'],
    :SPARK_DRIVER_MEMORY      => node['spark']['DRIVER_MEMORY']
  )
  action :create
end

template "/opt/Spark/#{node['spark']['version']}/conf/spark-defaults.conf" do
  source 'spark-defaults.conf.erb'
  variables(
    :SPARK_MASTER_HOST          => node['spark']['MASTER_HOST'],
    :SPARK_MASTER_PORT          => node['spark']['MASTER_PORT'],
    :spark_master_rest_port     => node['spark']['master_rest_port'],
    :spark_cores_max            => node['spark']['cores_max'],
    :spark_deploy_defaultCores  => node['spark']['deploy_defaultCores'],
    #:ingester_spark_work_folder => node['spark']['ingester_spark_work_folder'],
    :local_dir                  => node['spark']['local_dir'],
    :spark_driver_memory        => node['spark']['driver_memory']
  )
  action :create
end

