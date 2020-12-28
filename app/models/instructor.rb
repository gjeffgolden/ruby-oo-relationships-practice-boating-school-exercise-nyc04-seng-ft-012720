class Instructor
    attr_accessor :name
    
    @@all = []

    def initialize name 
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def all_tests
        BoatingTest.all.select do |tests|
            tests.instructor == self
        end
    end

    def all_students 
        all_tests.map {|test| test.student}
    end

    def passed_students 
        all_tests.select do |test| 
            if test.test_status == "passed"
                return test.student
            end
        end
    end

    def pass_student student, test_name
        BoatingTest.all.map do |tests| 
            if tests.student == student && tests.test_name = test_name
                tests.test_status = "passed"
                return tests
            else
                BoatingTest.new student, test_name, "passed", self
            end
        end
    end

    def fail_student student, test_name 
        BoatingTest.all.map do |tests|
            if tests.student == student && tests.test_name = test_name
                tests.test_status = "failed"
                return tests
            else 
                BoatingTest.new student, test_name, "failed", self
            end
        end
    end

end
