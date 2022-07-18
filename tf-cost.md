Project: jeroen-nijssen/HavingFunWithLambda_101/.

 Name                                                 Monthly Qty  Unit                        Monthly Cost 
                                                                                                            
 aws_cloudwatch_log_group.buienradar                                                                        
 ├─ Data ingested                             Monthly cost depends on usage: $0.57 per GB                   
 ├─ Archival Storage                          Monthly cost depends on usage: $0.03 per GB                   
 └─ Insights queries data scanned             Monthly cost depends on usage: $0.0057 per GB                 
                                                                                                            
 aws_lambda_function.buienradar                                                                             
 ├─ Requests                                  Monthly cost depends on usage: $0.20 per 1M requests          
 └─ Duration                                  Monthly cost depends on usage: $0.0000166667 per GB-seconds   
                                                                                                            
 aws_sns_topic.buienradar                                                                                   
 ├─ API requests (over 1M)                    Monthly cost depends on usage: $0.50 per 1M requests          
 ├─ HTTP/HTTPS notifications (over 100k)      Monthly cost depends on usage: $0.06 per 100k notifications   
 ├─ Email/Email-JSON notifications (over 1k)  Monthly cost depends on usage: $2.00 per 100k notifications   
 ├─ Kinesis Firehose notifications            Monthly cost depends on usage: $0.19 per 1M notifications     
 ├─ Mobile Push notifications                 Monthly cost depends on usage: $0.50 per 1M notifications     
 ├─ MacOS notifications                       Monthly cost depends on usage: $0.50 per 1M notifications     
 └─ SMS notifications (over 100)              Monthly cost depends on usage: $0.75 per 100 notifications    
                                                                                                            
 OVERALL TOTAL                                                                                        $0.00 
──────────────────────────────────
9 cloud resources were detected:
∙ 3 were estimated, all of which include usage-based costs, see https://infracost.io/usage-file
∙ 6 were free:
  ∙ 1 x aws_cloudwatch_event_rule
  ∙ 1 x aws_cloudwatch_event_target
  ∙ 1 x aws_iam_role
  ∙ 1 x aws_iam_role_policy
  ∙ 1 x aws_iam_role_policy_attachment
  ∙ 1 x aws_lambda_permission