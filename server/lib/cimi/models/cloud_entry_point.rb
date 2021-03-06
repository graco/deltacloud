# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.

class CIMI::Model::CloudEntryPoint < CIMI::Model::Base

  text :driver, :required => true
  text :provider, :required => true

  # All possible CIMI collections, in the order in which they should appear
  # in the CEP
  COLLECTIONS = [ "resourceMetadata", "systems", "systemTemplates",
            "machines" , "machineTemplates", "machineConfigs",
            "machineImages", "credentials", "credentialTemplates",
            "volumes", "volumeTemplates", "volumeConfigs", "volumeImages",
            "networks", "networkTemplates", "networkConfigs", "networkPorts",
            "networkPortTemplates", "networkPortConfigs",
            "addresses", "addressTemplates", "forwardingGroups",
            "forwardingGroupTemplates",
            "jobs", "meters", "meterTemplates", "meterConfigs",
            "eventLogs", "eventLogTemplates" ]

  text  :base_uri, :xml_name => "baseURI", :json_name => "baseURI"

  COLLECTIONS.each do |coll|
    href coll.underscore
  end

  private

  def self.href_defined?(resource)
    true if schema.attribute_names.include? resource.underscore
  end

end
