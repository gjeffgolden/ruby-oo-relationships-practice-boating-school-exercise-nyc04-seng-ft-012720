class Student
    attr_accessor :first_name
    
    @@all = []

    def initialize first_name
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_tests 
        BoatingTest.all.filter {|boating_tests| boating_tests.student == self}
    end

    def add_boating_test test_name, test_status, instructor
        BoatingTest.new self, test_name, test_status, instructor
    end

    def all_instructors
        all_tests.map {|boating_test| boating_test.instructor}.uniq
    end

    def self.find_student first_name
        all.find {|students| students.first_name == first_name}
    end

    def grade_percentage
        passed_tests = all_tests.filter {|test| test.test_status == "passed"}
        (passed_tests.count.to_f / all_tests.count.to_f) * 100
    end


end
