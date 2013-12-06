# coding: utf-8
class HardWorker
    include Sidekiq::Worker

    def perform(name, count)
        count.times do 
            puts "Doing something#{name}\n"
        end
    end
end
