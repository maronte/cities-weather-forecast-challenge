##
# ForecastTypes
# Enum class for forecast types to be used in the application
##
class ForecastTypes
  CURRENT = 'current'.freeze
  MINUTELY = 'minutely'.freeze
  HOURLY = 'hourly'.freeze
  DAILY = 'daily'.freeze
  ALERTS = 'alerts'.freeze
end

ForecastTypes.freeze
