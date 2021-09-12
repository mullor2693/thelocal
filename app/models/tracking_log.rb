class TrackingLog < ApplicationRecord

    belongs_to :trackeable, polymorphic: true
    belongs_to :user, optional: true
  
    scope :from_object, ->(obj) { where(trackeable_id: obj.id, trackeable_type: obj.class.name).order(created_at: :desc) }
  
    MAX_KEY_LIMIT = 4
  
    def self.track(event_type, object, metadata, ip_address=nil, user=nil)
      TrackingLog.create({ event_type: event_type,
                           trackeable_id: object.id,
                           trackeable_type: object.class.name,
                           user_id: user.present? ? user.id : nil,
                           ip_address: ip_address,
                           metadata: metadata })
    end
  
    def user_html
      User.html_from_track_info(metadata["user"])
    end
  
    # def employee_role_html(info = nil)
    #   EmployeeRole.html_from_track_info(info.present? ? info : metadata["employee_role"])
    # end
  
    # def company_resource_html
    #   CompanyResource.html_from_track_info(metadata["company_resource"])
    # end
  
    # def document_html
    #   Document.html_from_track_info(metadata["document"])
    # end
  
    # def training_html
    #   Training.html_from_track_info(metadata["training"])
    # end
  
    # def task_html
    #   Task.html_from_track_info(metadata["task"])
    # end
  
    # def flow_html
    #   Flow.html_from_track_info(metadata["flow"])
    # end
  
    # def flow_instance_html
    #   FlowInstance.html_from_track_info(metadata["flow_instance"])
    # end
  
    # def flow_instance_step_html
    #   FlowInstanceStep.html_from_track_info(metadata["flow_instance_step"])
    # end
  
    # def flow_instance_step_comment_html
    #   FlowInstanceStepComment.html_from_track_info(metadata["flow_instance_step_comment"])
    # end
  
    # def flow_instance_step_attachment_html
    #   FlowInstanceStepAttachment.html_from_track_info(metadata["flow_instance_step_attachment"])
    # end
  
    # def message

    #   case event_type
  
  
    #   # Flow messages
  
    #   when "flow.create"
    #     "<span>Created</span> #{Flow.html_from_update_info(metadata)}"
  
    #   when "flow.update"
    #     "<span>Updated</span> #{Flow.html_from_update_info(metadata)}"
  
    #   when "flow.start_flow_instance"
    #     "Flow instance started #{flow_instance_html}"
  
  
    #   # Flow Instance messages
  
    #   when "flow_instance.create"
    #     "<span>Flow instance created</span> #{FlowInstance.html_from_update_info(metadata)}"
  
    #   when "flow_instance.final_start"
    #     "Flow instance started"
  
    #   when "flow_instance.step_update"
    #     "Update Step #{flow_instance_step_html}"
  
    #   when "flow_instance.step_update_status"
    #     "Update Step #{flow_instance_step_html} Status to #{metadata["status"]}"
  
    #   when "flow_instance.step_update_assignee"
    #     "Update Step #{flow_instance_step_html} Assignee to #{user_html}"
  
    #   when "flow_instance.step_comment"
    #     "Add Comment #{flow_instance_step_comment_html} to Step #{flow_instance_step_html}"
  
    #   when "flow_instance.step_attachment"
    #     "Add Attachment #{flow_instance_step_attachment_html} to Step #{flow_instance_step_html}"
  
  
    #   # Team messages
  
    #   when "team.create"
    #     "<span>Created</span> #{Team.html_from_update_info(metadata)}"
  
    #   when "team.update"
    #     "<span>Updated</span> #{Team.html_from_update_info(metadata)}"
  
    #   when "team.draft"
    #     "Draft mode"
  
    #   when "team.publish"
    #     "Published"
  
    #   when "team.add_role"
    #     "Add Role #{employee_role_html}"
  
    #   when "team.remove_role"
    #     "Remove Role #{employee_role_html}"
  
    #   when "team.add_resource"
    #     "Add Resource #{company_resource_html}"
  
    #   when "team.remove_resource"
    #     "Remove Resource #{company_resource_html}"
  
    #   when "team.add_document"
    #     "Add Document #{document_html}"
  
    #   when "team.remove_document"
    #     "Remove Document #{document_html}"
  
    #   when "team.add_task"
    #     "Add Task #{task_html}"
  
    #   when "team.remove_task"
    #     "Remove Task #{task_html}"
  
    #   when "team.add_training"
    #     "Add Training #{training_html}"
  
    #   when "team.remove_training"
    #     "Remove Training #{training_html}"
  
    #   when "team.add_flow"
    #     "Add Flow #{flow_html}"
  
    #   when "team.remove_flow"
    #     "Remove Flow #{flow_html}"
  
    #   when "team.add_resource_to_role"
    #     "Add Resource #{company_resource_html} to Role #{employee_role_html}"
  
    #   when "team.remove_resource_from_role"
    #     "Remove Resource #{company_resource_html} from Role #{employee_role_html}"
  
    #   when "team.add_document_to_role"
    #     "Add Document #{document_html} to Role #{employee_role_html}"
  
    #   when "team.remove_document_from_role"
    #     "Remove Document #{document_html} from Role #{employee_role_html}"
  
    #   when "team.add_training_to_role"
    #     "Add Training #{training_html} to Role #{employee_role_html}"
  
    #   when "team.remove_training_from_role"
    #     "Remove Training #{training_html} from Role #{employee_role_html}"
  
    #   when "team.add_task_to_role"
    #     "Add Task #{task_html} to Role #{employee_role_html}"
  
    #   when "team.remove_task_from_role"
    #     "Remove Task #{task_html} from Role #{employee_role_html}"
  
    #   when "team.add_flow_to_role"
    #     "Add Flow #{flow_html} to Role #{employee_role_html}"
  
    #   when "team.remove_flow_from_role"
    #     "Remove Flow #{flow_html} from Role #{employee_role_html}"
  
    #   when "team.add_user_to_role"
    #     "Add #{user_html} to Role #{employee_role_html}"
  
    #   when "team.remove_user_from_role"
    #     "Remove #{user_html} from Role #{employee_role_html}"
  
    #   when "team.change_user_role"
    #     "Move #{user_html} from Role #{employee_role_html(metadata["from_employee_role"])} to Role #{employee_role_html(metadata["to_employee_role"])}"
  
  
    #   # CompanyAsset messages
  
    #   when "company_asset.assign"
    #     "Assigned to #{user_html}"
  
    #   when "company_asset.unassign"
    #     "Unassigned from #{user_html}"
  
    #   when "company_asset.retired"
    #     "Retired"
  
    #   when "company_asset.unretired"
    #     "Unretired"
  
    #   when "company_asset.update"
    #     "<p>Updated</p> #{CompanyAsset.html_from_update_info(metadata)}"
  
    #   when "company_asset.signed_agreement"
    #     "Document Agreement assigned to #{user_html}"
  
    #   when "company_asset.create"
    #     "<p>Created</p> #{CompanyAsset.html_from_update_info(metadata)}"
  
    #   else
    #     throw "Unsupported event_type for TrackingLog"
    #   end
    # end
  end
  