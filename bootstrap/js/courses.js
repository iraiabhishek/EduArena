// Courses
var cou_arr = new Array("B.Tech.","B.Sc.");

// Departments
var dep_arr = new Array();
dep_arr[0]="";
dep_arr[1]="Mechanical Engineering|Computer Science Engineering|Electronics and Communication Engineering|Civil Engineering|Electrical Engineering";
dep_arr[2]="Mathematics(Hons.)|Physics(Hons.)|Chemistry(Hons.)|Computer Science(Hons.)";

function populateDepartments( CourseElementId, departmentElementId ){

        var selectedCourseIndex = document.getElementById( CourseElementId ).selectedIndex;

        var departmentElement = document.getElementById( departmentElementId );

        departmentElement.length=0;	// Fixed by Julian Woods
        departmentElement.options[0] = new Option('Select Department','');
        departmentElement.selectedIndex = 0;

        var department_arr = dep_arr[selectedCourseIndex].split("|");

        for (var i=0; i<department_arr.length; i++) {
                departmentElement.options[departmentElement.length] = new Option(department_arr[i],department_arr[i]);
        }
}

function populateCourses(CourseElementId, departmentElementId){
        // given the id of the <select> tag as function argument, it inserts <option> tags
        var CourseElement = document.getElementById(CourseElementId);
        CourseElement.length=0;
        CourseElement.options[0] = new Option('Select Course','-1');
        CourseElement.selectedIndex = 0;
        for (var i=0; i<cou_arr.length; i++) {
                CourseElement.options[CourseElement.length] = new Option(cou_arr[i],cou_arr[i]);
        }

        // Assigned all countries. Now assign event listener for the states.

        if( departmentElementId ){
                CourseElement.onchange = function(){
                        populateDepartments( CourseElementId, departmentElementId );
                };
        }
}