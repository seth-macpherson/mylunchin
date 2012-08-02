/*
 * Localized default methods for the jQuery validation plugin.
 * Locale: DE
 */
jQuery.extend(jQuery.validator.methods,{date:function(e,t){return this.optional(t)||/^\d\d?\.\d\d?\.\d\d\d?\d?$/.test(e)},number:function(e,t){return this.optional(t)||/^-?(?:\d+|\d{1,3}(?:\.\d{3})+)(?:,\d+)?$/.test(e)}});