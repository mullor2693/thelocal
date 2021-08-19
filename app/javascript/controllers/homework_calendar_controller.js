import { Controller } from "stimulus"
import Rails from "@rails/ujs"
import Calendar from "tui-calendar";
import "tui-calendar/dist/tui-calendar.css";
// import 'tui-date-picker/dist/tui-date-picker.css';
// import 'tui-time-picker/dist/tui-time-picker.css';

export default class extends Controller {
  // config_month_data = { daynames: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'], startDayOfWeek: 1, narrowWeekend: false }
  calendar = new Calendar(document.getElementById('homework-calendar'), {
    defaultView: 'month',
    milestone: true,    // Can be also ['milestone', 'task']
    scheduleView: true,  // Can be also ['allday', 'time']
    useCreationPopup: false,
    useDetailPopup: true,
    template: {
      milestone: function(schedule) {
          return '<span style="color:red;"><i class="bi bi-skip-forward-circle"></i> ' + schedule.title + '</span>';
      },
      milestoneTitle: function() {
          return 'Milestone';
      },
      task: function(schedule) {
          return '&nbsp;&nbsp;#' + schedule.title;
      },
      taskTitle: function() {
          return '<label><input type="checkbox" />Task</label>';
      },
      allday: function(schedule) {
          return schedule.title + ' <i class="bi bi-clock"></i>';
      },
      alldayTitle: function() {
          return 'Día Completo';
      },
      time: function(schedule) {
          return schedule.title; // + ' <i class="bi bi-skip-forward-circle"></i>' + schedule.start;
      }
    },
    month: { daynames: ['D', 'L', 'M', 'X', 'J', 'V', 'S'], startDayOfWeek: 1, narrowWeekend: false }, // config_month_data,
    week: { daynames: ['D', 'L', 'M', 'X', 'J', 'V', 'S'], startDayOfWeek: 1, narrowWeekend: false } // config_month_data
  });
  getCalendardata(){
    var schedules = JSON.parse(document.querySelector("#homework-calendar").dataset.schedules);
    window.schedules = schedules;
    schedules.forEach(schedule => {
      this.calendar.createSchedules([{
        id: schedule.id,
        calendarId: schedule.eventable_id,
        title: schedule.name,
        category: 'time',
        // dueDateClass: schedule.dueDateClass,
        // location: schedule.location,
        start: schedule.start_date,
        end: (schedule.end_date || schedule.start_date)
      }])
    });
  }
  createCalendarSchedule(){
    let calendar = this.calendar;
    calendar.on('beforeCreateSchedule', function(event) {
    var triggerEventName = event.triggerEventName;
    var schedule =  {
      id: 1,
      calendarId: event.calendarId,
      // category: 'time',
      start: event.start,
      end: event.end
    }
    if (triggerEventName === 'click') {
        // open writing simple schedule popup
        // schedule = {...};
    } else if (triggerEventName === 'dblclick') {
        // open writing detail schedule popup
        // schedule = {...};
    }
  
    calendar.createSchedules([schedule]);
    let formData = new FormData()
    formData.append('start', schedule.start._date);
    formData.append('end', schedule.end._date);
  
    // Rails.ajax({
    //   type: "POST",
    //   url: '/events',
    //   data: formData
    // })
    
  });
  } 
  updatedCalendarSchedule(){
    let calendar = this.calendar;
    calendar.on('beforeUpdateSchedule', function(event) {
      var schedule = event.schedule;
      var changes = event.changes;
      var formUpdate = new FormData()    
      // if (changes.end) {
      // formUpdate.append("end", changes.end._date)    
      // }
      // if (changes.start) {
      // formUpdate.append("start", changes.start._date)    
      // }
      calendar.updateSchedule(schedule.id, schedule.calendarId, changes);
      Rails.fire(event.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.querySelector('button'), 'click');
      Rails.ajax({
        type: "get",
        dataType: 'stream',
        url: '/admin/homeworks/' + schedule.calendarId + '/events/' + schedule.id + "/edit",
        // data: formUpdate
      })
    });
  }
  deleteCalendarSchedule(){
    let calendar = this.calendar
    calendar.on('beforeDeleteSchedule', function(event) {
      var schedule = event.schedule;
      calendar.deleteSchedule(schedule.id, schedule.calendarId)
      Rails.ajax({
        type: "DELETE",
        dataType: 'stream',
        url: '/admin/homeworks/' + schedule.calendarId + '/events/' + schedule.id,
      })
    });
  }

  connect() {
    this.deleteCalendarSchedule();
    this.createCalendarSchedule();
    this.updatedCalendarSchedule();
    this.getCalendardata();
  }
}