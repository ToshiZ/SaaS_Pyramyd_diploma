json.array!(@task_templates) do |task_template|
  json.extract! task_template, :id, :name, :historyenabled, :description, :stopcode, :resultcode, :dir, :nfs, :checkpoint, :logPath, :logNfs, :logEpk, :logCluster, :logNode, :portionCluster, :portionNode, :portionProgram, :parameters, :parametersDescription, :profiles, :profilesDescription, :passportName, :procNum, :maxTime, :taskName, :userId
  json.url task_template_url(task_template, format: :json)
end
