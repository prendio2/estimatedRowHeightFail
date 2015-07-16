# estimatedRowHeightFail
Example project for Radar [21859811](rdar://21859811) ([openradar](http://openradar.me/21859811))

### `scrollToRowAtIndexPath:atScrollPosition:animated:` scrolls past the content when using `estimatedRowHeight`, `UITableViewAutomaticDimension` and `animated:YES`

Summary:

If a tableView uses estimatedRowHeight and UITableViewAutomaticDimension, scrollToRowAtIndexPath:atScrollPosition:animated will 
not always scroll to the correct location in the tableview.

Steps to Reproduce:

1. Begin in portrait orientation
2. Create a table with lots of cells. 
3. Provide an `estimatedRowHeight` and set `rowHeight` to `UITableViewAutomaticDimension`
4. Call `scrollToRowAtIndexPath:atScrollPosition:animated` to go to the last cell
5. Rotate to landscape
6. Call `scrollToRowAtIndexPath:atScrollPosition:animated` to go to the first cell

Expected Results:

This should be the same as tapping the status bar, you should be at the top of the table.

Actual Results:

If the total for all estimated heights is > actual heights, we zoom past the beginning and get a blank screen. 
    
If `animated` is NO, it behaves as expected.
