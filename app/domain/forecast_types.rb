# frozen_string_literal: true

##
# ForecastTypes
# Enum class for forecast types to be used in the application
##
class ForecastTypes
  CURRENT = 'current'
  MINUTELY = 'minutely'
  HOURLY = 'hourly'
  DAILY = 'daily'
  ALERTS = 'alerts'
end

ForecastTypes.freeze
