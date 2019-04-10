class CashierCurrencyValueValidator < ActiveModel::Validator
  def validate(record)
    if record.compra?
      if (record.cashier.value_colombia - record.value_colombia).negative?
        record.errors[:base] << 'Valor en Caja de peso colombiano no puede quedar menor que 0'
      end
    else
      if (record.cashier.total_money_for(record.currency) - record.value_foreign).negative?
        record.errors[:base] << 'Valor en Caja de divisa no puede quedar menor que 0'
      end
    end
  end
end
