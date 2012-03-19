/*
 * Localized default methods for the jQuery validation plugin.
 * Locale: PT_BR
 */
jQuery.extend(jQuery.validator.methods,{date:function(a,b){return this.optional(b)||/^\d\d?\/\d\d?\/\d\d\d?\d?$/.test(a)}});