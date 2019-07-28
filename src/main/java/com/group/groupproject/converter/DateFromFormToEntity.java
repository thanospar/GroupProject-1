
package com.group.groupproject.converter;

import java.time.LocalDate;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class DateFromFormToEntity implements Converter<Object, LocalDate> {

    @Override
    public LocalDate convert(Object s) {
        LocalDate ld = LocalDate.parse((String) s);
        return ld;
    }

}
