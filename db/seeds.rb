# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

Place.create(name: 'YIH')
Place.create(name: 'AS8')

('08:00'.to_time.to_i..'09:30'.to_time.to_i).step(30.minutes).each do |time|
  start = Time.zone.at(time)
  TimeRange.create(start: start, end: start + 30.minutes)
end
('10:00'.to_time.to_i..'20:00'.to_time.to_i).step(1.hour).each do |time|
  start = Time.zone.at(time)
  TimeRange.create(start: start, end: start + 1.hour)
end

User.create(username: 'admin', name: 'admin', email: 'admin@gmail.com',
            matric_number: 'admin', phone_number: '88888888',
            cell: 'Presidential', position: 'Adminstrator')

# Timeslots in YIH
Date::DAYNAMES.each do |day|
  TimeRange.all.each do |tr|
    mc = nil

    if day == 'Sunday'
      next if tr.start < '09:30'.to_time || tr.end > '15:00'.to_time
      mc = (tr.start == '09:30'.to_time || tr.end == '15:00'.to_time)

    elsif day == 'Saturday'
      next if tr.start < '08:30'.to_time || tr.end > '17:00'.to_time
      mc = (tr.start == '08:30'.to_time || tr.end == '17:00'.to_time)

    else
      next if tr.start < '08:30'.to_time || tr.end > '21:00'.to_time
      mc = (tr.start == '08:30'.to_time || tr.end == '21:00'.to_time)
    end

    Timeslot.create(mc_only: mc, day: day, default_user: User.take,
                    time_range: tr, place: Place.find_by(name: 'YIH'))
  end
end

# Timeslots in AS8
Date::DAYNAMES.each do |day|
  TimeRange.all.each do |tr|
    mc = nil

    if day == 'Sunday'
      next

    elsif day == 'Saturday'
      next if tr.start < '08:00'.to_time || tr.end > '17:00'.to_time
      mc = (tr.start == '08:00'.to_time || tr.end == '17:00'.to_time)

    else
      next if tr.start < '08:00'.to_time || tr.end > '21:00'.to_time
      mc = (tr.start == '08:00'.to_time || tr.end == '21:00'.to_time)
    end

    Timeslot.create(mc_only: mc, day: day, default_user: User.take,
                    time_range: tr, place: Place.find_by(name: 'AS8'))
  end
end
