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
  TimeRange.create(start_time: start, end_time: start + 30.minutes)
end
('10:00'.to_time.to_i..'20:00'.to_time.to_i).step(1.hour.to_i).each do |time|
  start = Time.zone.at(time)
  TimeRange.create(start_time: start, end_time: start + 1.hour)
end

User.create(username: 'admin', name: 'Elferia Valkyrie',
            email: 'admin@gmail.com', matric_number: 'A0000000A',
            phone_number: '88888888', cell: 'Presidential',
            position: 'Adminstrator')

# Timeslots in YIH
Date::DAYNAMES.each do |day|
  TimeRange.all.each do |tr|
    mc = nil
    open = tr.start_time.in_time_zone.strftime('%H%M')
    close = tr.end_time.in_time_zone.strftime('%H%M')

    if day == 'Sunday'
      next if open < '0930' || close > '1500'
      mc = (open == '0930' || close == '1500')
    elsif day == 'Saturday'
      next if open < '0830' || close > '1700'
      mc = (open == '0830' || close == '1700')
    else
      next if open < '0830' || close > '2100'
      mc = (open == '0830' || close == '2100')
    end

    Timeslot.create(mc_only: mc, day: day, default_user: User.take,
                    time_range: tr, place: Place.find_by(name: 'YIH'))
  end
end

# Timeslots in AS8
Date::DAYNAMES.each do |day|
  TimeRange.all.each do |tr|
    mc = false
    open = tr.start_time.in_time_zone.strftime('%H%M')
    close = tr.end_time.in_time_zone.strftime('%H%M')

    next if day == 'Sunday'
    next if (day == 'Saturday') && (open < '0800' || close > '1700')
    next if open < '0800' || close > '2100'

    Timeslot.create(mc_only: mc, day: day, default_user: User.take,
                    time_range: tr, place: Place.find_by(name: 'AS8'))
  end
end
