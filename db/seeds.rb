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

(Time.zone.parse('08:00').to_i..Time.zone.parse('09:30').to_i).step(30.minutes.to_i).each do |time|
  start = Time.zone.at(time)
  TimeRange.create(start: start, end: start + 30.minutes)
end
(Time.zone.parse('10:00').to_i..Time.zone.parse('20:00').to_i).step(1.hour.to_i).each do |time|
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
    open = tr.start.in_time_zone('Singapore')
    close = tr.end.in_time_zone('Singapore')

    if day == 'Sunday'
      next if open < Time.zone.parse('09:30') || close > Time.zone.parse('15:00')
      mc = (open == Time.zone.parse('09:30') || close == Time.zone.parse('15:00'))

    elsif day == 'Saturday'
      next if open < Time.zone.parse('08:30') || close > Time.zone.parse('17:00')
      mc = (open == Time.zone.parse('08:30') || close == Time.zone.parse('17:00'))

    else
      next if open < Time.zone.parse('08:30') || close > Time.zone.parse('21:00')
      mc = (open == Time.zone.parse('08:30') || close == Time.zone.parse('21:00'))
    end

    Timeslot.create(mc_only: mc, day: day, default_user: User.take,
                    time_range: tr, place: Place.find_by(name: 'YIH'))
  end
end

# Timeslots in AS8
Date::DAYNAMES.each do |day|
  TimeRange.all.each do |tr|
    mc = nil
    open = tr.start.in_time_zone('Singapore')
    close = tr.end.in_time_zone('Singapore')

    if day == 'Sunday'
      next

    elsif day == 'Saturday'
      next if open < Time.zone.parse('08:00') || close > Time.zone.parse('17:00')
      mc = (open == Time.zone.parse('08:00') || close == Time.zone.parse('17:00'))

    else
      next if open < Time.zone.parse('08:00') || close > Time.zone.parse('21:00')
      mc = (open == Time.zone.parse('08:00') || close == Time.zone.parse('21:00'))
    end

    Timeslot.create(mc_only: mc, day: day, default_user: User.take,
                    time_range: tr, place: Place.find_by(name: 'AS8'))
  end
end
