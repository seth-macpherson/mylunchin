Calculator::Engraving.class_eval do

  def compute(product_customization,variant)
    return 0 unless valid_configuration? product_customization

    # expecting only one CustomizedProductOption
    opt = product_customization.customized_product_options.detect {|cpo| cpo.customizable_product_option.name == "inscription" } rescue ''
    opt.value.length * preferred_price_per_letter
  end

end
