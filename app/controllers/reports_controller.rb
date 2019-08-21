class ReportsController < ApplicationController
  def index
    authorize! :index, current_user

    @ventas_money_data = get_money_data(:venta)
    @ventas_money_data_js = chart_data(@ventas_money_data.keys, @ventas_money_data.values,'Total Ventas en Peso Colombiano') # { labels: @ventas_money_data.keys, datasets: [label: 'Total Ventas en Peso Colombiano', data: @ventas_money_data.values]}
    @ventas_count_data = get_count_data(:venta)
    @ventas_count_data_js = chart_data(@ventas_count_data.keys, @ventas_count_data.values, 'Total Ventas hechas') # { labels: @ventas_count_data.keys, datasets: [label: 'Total Ventas hechas', data: @ventas_count_data.values]}
    
    @compras_money_data = get_money_data(:compra)
    @compras_money_data_js = chart_data(@compras_money_data.keys, @compras_money_data.values, 'Total Compras en Peso Colombiano') # { labels: @compras_money_data.keys, datasets: [label: 'Total Compras en Peso Colombiano', data: @compras_money_data.values]}
    @compras_count_data = get_count_data(:compra)
    @compras_count_data_js = chart_data(@compras_count_data.keys, @compras_count_data.values, 'Total Compras hechas') # { labels: @compras_count_data.keys, datasets: [label: 'Total Compras hechas', data: @compras_count_data.values]}
  end

  private

  def get_money_data(type)
    user_hash = {}
    daily_movements.where(action: type).group_by(&:user_id).each do |user_id, dms|
      user_email = User.find(user_id).email
      user_hash[user_email] = dms.pluck(:value_colombia).compact.reduce(:+)
    end

    user_hash
  end

  def get_count_data(type)
    user_hash = {}
    daily_movements.where(action: type).group_by(&:user_id).each do |user_id, dms|
      user_email = User.find(user_id).email
      user_hash[user_email] = dms.count
    end
    user_hash
  end

  def daily_movements
    @daily_movements ||= DailyMovement.where('created_at BETWEEN ? AND ?', start_date, end_date)
  end

  def start_date
    @start_date = if params[:start_date]
                    Date.parse(params[:start_date]).beginning_of_day 
                  else
                    7.days.ago.beginning_of_day
                  end
  end

  def end_date
    @end_date = if params[:end_date]
                  Date.parse(params[:end_date]).end_of_day
                else
                  Time.zone.now.end_of_day
                end
  end

  def random_color
    letters = '0123456789ABCDEF'.split('')
    color = '#'
    6.times do
      color += letters[rand(16)]
    end

    color
  end

  def chart_data(x_axis_data, y_axis_data, legend_name)
    color = chart_colors
    data  = { labels: x_axis_data, datasets: [
      data: y_axis_data,
      label: legend_name,
      backgroundColor: chart_colors.first(y_axis_data.count)
    ] }
  end

  def chart_colors
    [
      '#B576AD', # 1. Violete
      '#FD505A', # 2. Red
      '#E2CB5A', # 3. Gold
      '#50BB70', # 4. Light Green
      '#47A7D4', # 5. Teal
      '#FB79AD', # 6. Pink
      '#7B241C', # 7. Brown
      '#FF9E51', # 8. Orange
      '#0B5345', # 9. Dark Green
      '#154360', # 10. Navy Blue
      # Colors repeat
      '#B576AD','#FD505A','#E2CB5A','#50BB70','#47A7D4','#FB79AD','#7B241C','#FF9E51','#0B5345','#154360',
      '#B576AD','#FD505A','#E2CB5A','#50BB70','#47A7D4','#FB79AD','#7B241C','#FF9E51','#0B5345','#154360',
      '#B576AD','#FD505A','#E2CB5A','#50BB70','#47A7D4','#FB79AD','#7B241C','#FF9E51','#0B5345','#154360',
      ]
  end

  def chart_options(symptoms_size)
    options = {
        scales: {
            xAxes: [{
                gridLines: {
                    drawOnChartArea:false
                },
                ticks: {
                    maxRotation: 0,
                    minRotation: 0
                }
            }],
            yAxes: [{
                gridLines: {
                    drawOnChartArea:false
                },
                ticks: {
                    min: 0,
                    max: 4 ,
                    stepSize: 1
                }
            }]
        }
    }
  end
end
