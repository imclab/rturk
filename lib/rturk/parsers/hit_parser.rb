#   <HIT>
#     <HITId>ZZRZPTY4ERDZWJ868JCZ</HITId>
#     <HITTypeId>NYVZTQ1QVKJZXCYZCZVZ</HITTypeId>
#     <CreationTime>2009-07-07T00:56:40Z</CreationTime>
#     <Title>Location</Title>
#     <Description>Select the image that best represents</Description>
#     <HITStatus>Assignable</HITStatus>
#     <MaxAssignments>1</MaxAssignments>
#     <Reward>
#       <Amount>5.00</Amount>
#       <CurrencyCode>USD</CurrencyCode>
#       <FormattedPrice>$5.00</FormattedPrice>
#     </Reward>
#     <AutoApprovalDelayInSeconds>2592000</AutoApprovalDelayInSeconds>
#     <Expiration>2009-07-14T00:56:40Z</Expiration>
#     <AssignmentDurationInSeconds>30</AssignmentDurationInSeconds>
#     <NumberOfAssignmentsPending>0</NumberOfAssignmentsPending>
#     <NumberOfAssignmentsAvailable>1</NumberOfAssignmentsAvailable>
#     <NumberOfAssignmentsCompleted>0</NumberOfAssignmentsCompleted>
#   </HIT>

module RTurk
  
  class HITParser
    include XmlUtilities
    
    def initialize(hit_xml)
      @xml_obj = hit_xml
      map_content(@xml_obj,
                  :hit_id => 'HITId',
                  :type_id => 'HITTypeId',
                  :status => 'HITStatus',
                  :title => 'Title',
                  :created_at => 'CreationTime',
                  :expires_at => 'Expiration',
                  :assignments_duration => 'AssignmentDurationInSeconds',
                  :reward_amount => 'Reward/Amount',
                  :max_assignments => 'MaxAssignments',
                  :pending_assignments => 'NumberOfAssignmentsPending',
                  :available_assignments => 'NumberOfAssignmentsAvailable',
                  :completed_assignments => 'NumberOfAssignmentsCompleted',
                  :auto_approval_delay => 'AutoApprovalDelayInSeconds')
    end
    
    def method_missing(method)
      if @attributes && @attributes.include?(method)
        @attributes[method]
      end
    end
    
    def respond_to?(method)
      if @attributes
        @attributes.include?(method)
      end
    end

  end
  
end