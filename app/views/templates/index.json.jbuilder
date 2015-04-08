json.array!(@templates) do |template|
  json.extract! template, :id, :taskName, :taskDescription, :passportName, :name, :procNum, :maxTime, :historyenabled, :description, :stopcode, :resultcode, :dir, :nfs, :checkpoint, :logPath, :logNfs, :logEpk, :logCluster, :logNode, :portionCluster, :portionNode, :portionProgram, :parameters, :parametersDescription, :profiles, :profilesDescription, :otherParams, :userId
  json.url template_url(template, format: :json)
end
