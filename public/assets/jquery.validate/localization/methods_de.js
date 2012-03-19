/*
 * Localized default methods for the jQuery validation plugin.
 * Locale: DE
 */
jQuery.extend(jQuery.validator.methods,{date:function(a,b){return this.optional(b)||/^\d\d?\.\d\d?\.\d\d\d?\d?$/.test(a)},number:function(a,b){return this.optional(b)||/^-?(?:\d+|\d{1,3}(?:\.\d{3})+)(?:,\d+)?$/.test(a)}});