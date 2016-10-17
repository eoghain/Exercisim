//
//  LeapTest.swift
//  Leap
//
//  Created by Booth, Robert on 1/21/16.
//  Copyright © 2016 Booth, Robert. All rights reserved.
//

import Foundation

class Year
{
    var isLeapYear: Bool = true
    
    init(calendarYear: Int)
    {
        if (calendarYear % 4) != 0
        {
            isLeapYear = false
        }
        else
        {
            isLeapYear = true
            
            if (calendarYear % 100) == 0
            {
                isLeapYear = false
                if (calendarYear % 400) == 0
                {
                    isLeapYear = true
                }
            }
        }
    }
}