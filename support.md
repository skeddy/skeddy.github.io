---
layout: page
permalink: /support
title: support
sidebar_link:  true
feature_text: | 
    ## Support
feature_image: "/assets/header_image.jpg"
---

##  If you've found this... you got a problem

One of the main issues I've seen in recent years, has been where Windows Updates are not getting installed correctly. 

Windows then gets confused and can't recall what it should or shouldn't install, and ends up looping through the same update over and over. 

So there's a coupple of things you can do here right off the bat.

## 1. Clear the windows event log

Purge the whole thing, once you've had a look and determined that there's no other sort of issue.

To run the command below, open the Command Prompt as an administrator and type:

`for /F "tokens=*" %1 in ('wevtutil.exe el') DO wevtutil.exe cl "%1"`

## 2. Run the system file checker

The System File Checker (SFC) is a utility in Windows that scans for and repairs corrupted or missing system files. 

To run it, open the Command Prompt as an administrator and type:

`sfc /scannow`

Wait for the scan to complete, the process may take some time.

SFC will display a message indicating whether any issues were found and if repairs were made. 

If SFC is unable to repair all corrupted files, you may need to use the Deployment Image Servicing and Management (DISM) tool. DISM can repair the Windows component store, which SFC relies on. 

To run the command below, open the Command Prompt as an administrator and type:

`DISM.exe /Online /Cleanup-image /Restorehealth`

After DISM completes, run sfc again:

`sfc /scannow`

## 3.Run system file check on boot

This takes a while, but is a great way to check for issues and try and fix them before Windows event boots.

*Run a system check at boot (Accept and reboot)*
*Note: Needs Admin CMD and on reboot Can take 4 hours+*

`chkdsk /x /f /r`

(You might want to chuck this on on the background for a bit....)

{% include video.html id="k1g4Ohe_Hs8" %}

## If I've helped...

I'll honestly let you know if my time has been more hands on than hands off, and not take the proverbial for any payment.

And if you do want to bung me a few quid here or there, then I'll point you in the direction of the three wonderful charties below:

### Ferring Country Centre

[https://ferringcountrycentre.org/](https://ferringcountrycentre.org/)

*At Ferring Country Centre, their 32-acre site offers a blend of visitor attractions and specialised day services. As you explore, you’ll find a garden centre, café, soft play area, and our farm. But it’s not just about the attractions; your visit directly supports our mission as a charity to provide life-changing experiences.*

*Established in 1986, their day services offer a safe and supportive environment for people with learning disabilities to develop new skills, which includes everything from woodwork and gardening to riding therapy and cooking classes.*

### Samaritans

[https://www.samaritans.org](https://www.samaritans.org)

*Samaritans is a registered charity aimed at providing emotional support to anyone in emotional distress, struggling to cope, or at risk of suicide throughout Great Britain and Ireland, often through their telephone helpline*

### Cruse Bereavement Support

[https://www.cruse.org.uk](https://www.cruse.org.uk)

*Cruse Bereavement Support and its counterpart Cruse Bereavement Care Scotland are the United Kingdom's largest bereavement charity, which provide free care and bereavement counselling to people suffering from grief*
