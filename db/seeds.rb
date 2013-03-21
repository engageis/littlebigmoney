# coding: utf-8

[
  { pt: 'Agricultura', en: 'Agricultura' },
  { pt: 'Têxtil', en: 'Clothing' },
  { pt: 'Alimentos', en: 'Food' },
  { pt: 'Manufatura', en: 'Manufactoring' },
  { pt: 'Varejo', en: 'Retail' }
].each do |name|
   category = Category.find_or_initialize_by_name_pt name[:pt]
   category.update_attributes({
     name_en: name[:en]
   })
 end

[
  'confirm_backer','payment_slip','project_success','backer_project_successful',
  'backer_project_unsuccessful','project_received','updates','project_unsuccessful',
  'project_visible','processing_payment','new_draft_project', 'project_rejected', 'pending_backer_project_unsuccessful'
].each do |name|
  NotificationType.find_or_create_by_name name
end

{
  company_name: 'Little Big Money',
  host: 'littlebigmoney.org',
  base_url: "http://littlebigmoney.org",
  blog_url: "http://littlebigmoney.blogspot.com.br",
  email_contact: 'contact@littlebigmoney.org',
  email_payments: 'finances@littlebigmoney.org',
  email_projects: 'support@littlebigmoney.org',
  email_system: 'system@littlebigmoney.org',
  email_no_reply: 'no-reply@littlebigmoney.org',
  facebook_url: "http://facebook.com/littlebigmoney",
  facebook_app_id: '173747042661491',
  twitter_username: "LBigMoney",
  mailchimp_url: "http://catarse.us5.list-manage.com/subscribe/post?u=ebfcd0d16dbb0001a0bea3639&amp;id=149c39709e",
  catarse_fee: '0.13',
  support_forum: 'http://suporte.catarse.me/'
}.each do |name, value|
  Configuration.find_or_create_by_name name, value: value
end
