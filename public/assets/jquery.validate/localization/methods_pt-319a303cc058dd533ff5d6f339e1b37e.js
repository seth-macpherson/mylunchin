/*
 * Localized default methods for the jQuery validation plugin.
 * Locale: PT_BR
 */
jQuery.extend(jQuery.validator.methods,{date:function(e,t){return this.optional(t)||/^\d\d?\/\d\d?\/\d\d\d?\d?$/.test(e)}});