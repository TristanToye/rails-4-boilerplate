Rake::Task['assets:clean'].enhance do
  Rake::Task['db:migrate'].invoke
end