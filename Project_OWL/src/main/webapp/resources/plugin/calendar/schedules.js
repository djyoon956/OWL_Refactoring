'use strict';

/*eslint-disable*/

var ScheduleList = [];

var SCHEDULE_CATEGORY = [
    'milestone',
    'task'
];

function ScheduleInfo() {
    this.id = null;
    this.calendarId = null;

    this.title = null;
    this.body = null;
    this.isAllday = false;
    this.start = null;
    this.end = null;
    this.category = '';
    this.dueDateClass = '';

    this.color = null;
    this.bgColor = null;
    this.dragBgColor = null;
    this.borderColor = null;
    this.customStyle = '';

    this.isFocused = false;
    this.isPending = false;
    this.isVisible = true;
    this.isReadOnly = false;
    this.goingDuration = 0;
    this.comingDuration = 0;
    this.recurrenceRule = '';
    this.state = '';

    this.raw = {
        memo: '',
        hasToOrCc: false,
        hasRecurrenceRule: false,
        location: null,
        class: 'public', // or 'private'
        creator: {
            name: '',
            avatar: '',
            company: '',
            email: '',
            phone: ''
        }
    };
}

function generateTime(schedule, renderStart, renderEnd) {
    var startDate = moment(renderStart.getTime())
    var endDate = moment(renderEnd.getTime());
    var diffDate = endDate.diff(startDate, 'days');

    schedule.isAllday = chance.bool({likelihood: 30});
    if (schedule.isAllday) {
        schedule.category = 'allday';
    } else if (chance.bool({likelihood: 30})) {
        schedule.category = SCHEDULE_CATEGORY[chance.integer({min: 0, max: 1})];
        if (schedule.category === SCHEDULE_CATEGORY[1]) {
            schedule.dueDateClass = 'morning';
        }
    } else {
        schedule.category = 'time';
    }

    startDate.add(chance.integer({min: 0, max: diffDate}), 'days');
    startDate.hours(chance.integer({min: 0, max: 23}))
    startDate.minutes(chance.bool() ? 0 : 30);
    schedule.start = startDate.toDate();

    endDate = moment(startDate);
    if (schedule.isAllday) {
        endDate.add(chance.integer({min: 0, max: 3}), 'days');
    }

    schedule.end = endDate
        .add(chance.integer({min: 1, max: 4}), 'hour')
        .toDate();

    if (!schedule.isAllday && chance.bool({likelihood: 20})) {
        schedule.goingDuration = chance.integer({min: 30, max: 120});
        schedule.comingDuration = chance.integer({min: 30, max: 120});;

        if (chance.bool({likelihood: 50})) {
            schedule.end = schedule.start;
        }
    }
}

function generateNames() {
    var names = [];
    var i = 0;
    var length = chance.integer({min: 1, max: 10});

    for (; i < length; i += 1) {
        names.push(chance.name());
    }

    return names;
}

function generateSchedule(viewName, renderStart, renderEnd) {         
    var i = 0, length = 10;
    if (viewName === 'month') {
        length = 3;
    } else if (viewName === 'day') {
        length = 4;
    }
	$.ajax({
		url:"getMyAllCalendars.do",
		dataType:"json",
		async: false,
		success:function(data){
	    	ScheduleList = [];

	    	
			$.each(data, function(index, element){
		    	let calendar;
		    	let schedule = new ScheduleInfo();
		    	console.log("element.projectIdx : "+element.projectIdx);
				$.each(CalendarList, function(index, obj){
					console.log("obj.id :"+obj.id);
					console.log(obj.id == element.projectIdx);
		    		if(obj.id == element.projectIdx){
		    			console.log(obj.id);
		    			calendar = obj;
		    			return false;
		    		}
		    	})
	
		    	if(calendar == null)
		    		return;
				
				console.log("get calendar");
		        let renderStart;
		        let renderEnd;   
		        
	    		renderStart = new Date(element.startDate);
	    		renderEnd = new Date(element.endDate);			
	    	
	    	    schedule.id = String(element.calIdx);
	    	    schedule.calendarId = String(element.projectIdx);
	    	    schedule.title = element.title;  	
	    	    
	    	    generateTime(schedule, renderStart, renderEnd);
	    	    schedule.location = element.content;
	    	    schedule.color = calendar.color;
	    	    schedule.bgColor = calendar.bgColor;
	    	    schedule.dragBgColor = calendar.dragBgColor;
	    	    schedule.borderColor = calendar.borderColor;
	    	
	    	    if (schedule.category === 'milestone') {
	    	        schedule.color = schedule.bgColor;
	    	        schedule.bgColor = 'transparent';
	    	        schedule.dragBgColor = 'transparent';
	    	        schedule.borderColor = 'transparent';
	    	    }
	    	   	
	    	    if (chance.bool({ likelihood: 20 })) {
	    	        var travelTime = chance.minute();
	    	        schedule.goingDuration = travelTime;
	    	        schedule.comingDuration = travelTime;
	    	    	}   
	    	    ScheduleList.push(schedule);
	    	        	    
			});
	
		    console.log(ScheduleList);
	    }

    });
	console.log("done");
	console.log(ScheduleList);
	console.log("done1");
}
