package com.bysy.hospital.Utils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.FatalBeanException;
import org.springframework.util.Assert;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;

public class BeanUtilsEx extends BeanUtils {

    public static void copyProperties(Object source, Object target) throws BeansException {
        copyProperties(source, target, null, null);
    }

    private static void copyProperties(Object source, Object target, Class<?> editable, String[] ignoreProperties) {

        Assert.notNull(source, "Source must not be null");
        Assert.notNull(target, "Target must not be null");

        Class<?> actualEditable = target.getClass();
        if (editable != null) {
            if (!editable.isInstance(target)) {
                throw new IllegalArgumentException("Target class ["
                        + target.getClass().getName()
                        + "] not assignable to Editable class ["
                        + editable.getName() + "]");
            }
            actualEditable = editable;
        }
        PropertyDescriptor[] targetPds = getPropertyDescriptors(actualEditable);
        List<String> ignoreList = (ignoreProperties != null) ? Arrays.asList(ignoreProperties) : null;

        for (PropertyDescriptor targetPd : targetPds) {
            if (targetPd.getWriteMethod() != null
                    && (ignoreProperties == null || (!ignoreList.contains(targetPd.getName())))) {
                PropertyDescriptor sourcePd = getPropertyDescriptor(source.getClass(), targetPd.getName());
                if (sourcePd != null && sourcePd.getReadMethod() != null) {
                    assignValue(source, target, targetPd, sourcePd);
                }
            }
        }
    }

    private static void assignValue(Object source, Object target, PropertyDescriptor targetPd, PropertyDescriptor sourcePd) {
        try {
            Method readMethod = sourcePd.getReadMethod();
            if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
                readMethod.setAccessible(true);
            }
            Object value = readMethod.invoke(source);
            if (null != value) { //null值不复制
                Method writeMethod = targetPd.getWriteMethod();
                if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
                    writeMethod.setAccessible(true);
                }
                writeMethod.invoke(target, value);
            }
        } catch (Throwable ex) {
            throw new FatalBeanException("Could not copy properties from source to target", ex);
        }
    }
}
