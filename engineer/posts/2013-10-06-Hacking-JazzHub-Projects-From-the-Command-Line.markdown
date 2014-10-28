title: Hacking JazzHub Projects From the Command Line
timestamp: 09:00 PM Sunday, October 06, 2013 EDT
status: published
slug: hacking-jazzhub-projects-from-the-command-line
tags:
- jazzhub
- commandline
- scm
- lscm
- rtc
url: /weblog/2013/10/06/hacking-jazzhub-projects-from-the-command-line/

comments: true
layout: post
slub: hacking-jazzhub-projects

---

[JazzHub](http://hub.jazz.net/) is a new project from IBM that provides the power of Rational Team Concert (RTC) in a cloud environment. If you're working on a public project it's entirely free. In fact, it's also free until at least the end of 2013 for private projects too.

The obvious question that most people are going to ask is "Why should I use JazzHub if I know how to use GitHub?" This is a perfectly fine question and I don't fault anyone for asking it. In fact, for most projects you're going to be just fine using GitHub. It has a lot of great features for collaborative software development that have truly revolutionized the way that software is developed. JazzHub is designed for projects that want and need more robust mechanisms for project planning and management. A project on JazzHub can utilize the full power of Rational Team Concert's excellent support for agile processes to really plan out their software development processes. If it isn't software development without words like "scrum", "iteration", and "sprint", then you'll feel right at home using JazzHub.

Rational Team Concert is designed to be used with a thick client that is a nice extension to the Eclipse Integrated Development Environment. As licensing for RTC is done on the server side, you can download and use RTC for work on JazzHub for free. Hop on over to the [jazz.net downloads page](https://jazz.net/downloads/) to grab the newest version of Rational Team Concert for your combination of architecture and operating system.

One seriously underutilized feature of RTC is the inclusion of a very robust command line program for interacting with RTC's powerful source code management  (SCM) facilities. This article attempts to explain what you need to do to create a project on JazzHub and then commit your code from the command line. It's a perfect way to work if you're comfortable with dropping down to a shell to manage your files inside of an SCM, as is often the case with Git and Subversion.

Creating A Project
------------------
Before we get too far, we'll start by creating a public project on JazzHub. It is called `scmtest`. The full naming convention for JazzHub projects is `USERNAME | PROJECTNAME`. Yes, this means that there is a pair of spaces and a pipe in the project name (as opposed to GitHub which uses `USERNAME/PROJECTNAME`. It's not that big of a deal if you remember to use quotes when working from the command line.

<div class="image caption center">
	<img src="/weblog/media/2013/10/jazzhub-create-project.png" width="910" height="665" alt="JazzHub Create Project Screen">
	<p>Options Selected for Creating Sample Project</p>
</div>

After a minute or two JazzHub will return with your brand new shiny project page. Congratulations! Now you're on your way to hacking it from the command line.

<div class="image caption center">
	<img src="/weblog/media/2013/10/jazzhub-project-created.png" width="970" height="531" alt="Project Successfully Created">
	<p>Project Successfully Created</p>
</div>
	
Setting up lscm
---------------
By this point you should have project on JazzHub and also downloaded a copy of the RTC client for your machine. You'll need to unpack the archive somewhere, in my case I unpacked it to `/Applications/RTC-4.0.4`. You'll find a file hierarchy that looks a little like this:

```
:::text
/Applications/RTC-4.0.4
`-- jazz
    |-- client
    |   |-- eclipse
    |   |-- license
    |   `-- sametime
    |-- properties
    |   `-- version
    `-- scmtools
        `-- eclipse
```

The `lscm` program resides in `jazz/scmtools`. There are a variety of ways that you can make it so it's easy to execute. I symlinked it to `/usr/local/bin/lscm` using the following command:

```
~> ln -s /Applications/RTC-4.0.4/jazz/scmtools/eclipse/lscm /usr/local/bin/lscm
```

If you're using a newer version of RTC, specifically 4.0.3 or newer, you're going to have a much better time because there's a new native code version of `lscm` rather than the old version that fired up a Java virtual machine every time. This results in a much better and faster experience.

Using lscm
----------

The first thing you'll need to do is to login to the RTC server. You'll need to know the CCM server for your JazzHub project; this is included in the original email you're sent and in my case (and probably your case too) it was `https://hub.jazz.net/ccm01`. You'll also want to create an alias for JazzHub, in my case it's just `jazzhub` and then tell it to cache your credentials so you don't need to login all the time.

```
~> lscm login -r https://hub.jazz.net/ccm01 -n jazzhub -u pwagstro -c
```

Now you can start creating the directory structure for the project. Before we dive in too far, I recommend reading up on [how the RTC SCM works](https://jazz.net/library/article/41), because it's a bit of a brain twist from what you're used to if you normally work with Subversion or Git.

Unlike Git and Subversion where you first start with files on your local drive and then later send them to the remote repository, with RTC's SCM you start by loading a remote workspace. In the case of JazzHub a workspace is created by default that is called `USERNAME | PROJECTNAME Workspace`. The following commands will create an empty directory and load the workspace.

```
~> mkdir scmtest
~/scmtest> cd scmtest
~/scmtest> lscm load -r jazzhub --all "pwagstro | scmtest Workspace"
Nothing to load. File system unmodified.
```

In a mechanism similar to Subversion, RTC doesn't want you to have files at the top level of your directory. In fact, if you have files at the top level of your directory you'll probably break RTC's command line SCM. Just don't do it. Instead, you'll have a collection of directories that represent different major modules. Each module, in turn, belongs to one or more components. In this case will make a module called `Test` and populate it with a simple `README.md` file with no content.

```
:::text
~/scmtest> mkdir Test
~/scmtest> cd Test
~/scmtest/Test> touch README.md
~/scmtest/Test> cd ..
```

The next step is to tell RTC to share the `Test` module as part of your current workspace and the default component. JazzHub automatically makes a default component called `USERNAME | PROJECT Default Component`. Just use that and it will make things easier. Here we first share `Test` then checkin the `README.md` file.

```
:::text
~/scmtest> lscm create workspace -r jazzhub -d "Default Workspace" "pwagstro | scmtest Workspace" -s "pwagstro | scmtest Stream"
Workspace (1528) "pwagstro | scmtest Workspace" successfully created
~/scmtest> lscm share -r jazzhub "pwagstro | scmtest Workspace" "pwagstro | scmtest Default Component" Test
Shared successfully
~/scmtest> lscm checkin Test/README.md
```
After checking in the code it hasn't been pushed to the server yet, rather the change is sitting in staged changeset that needs to be sent to the repository workspace. First, we can check to see what projects are currently staged.

```
:::text
~/scmtest> lscm status
Workspace: (1528) "pwagstro | scmtest Workspace" <-> (1529) "pwagstro | scmtest Stream"
  Component: (1530) "pwagstro | scmtest Default Component"
    Baseline: (1531) 1 "Initial Baseline"
    Outgoing:
      Change sets:
        (1532) *--@  "Share" 06-Oct-2013 10:18 PM
```
The default changelog message is simply "Share". This is really bad, but unfortunately `lscm` doesn't make it easy to create nice commit messages like Git does. From the above output we can see that our output changeset alias is 1532. This is a value that we can use to change the changeset comment as follows:

```
~/scmtest> lscm changeset comment 1532 "Initial attempt at sharing"
```

Now we can look at the output and see if it has our proper commit message.

```
:::text
~/scmtest> lscm status
Workspace: (1528) "pwagstro | scmtest Workspace" <-> (1529) "pwagstro | scmtest>
  Component: (1530) "pwagstro | scmtest Default Component"
    Baseline: (1531) 1 "Initial Baseline"
    Outgoing:
      Change sets:
        (1532) *--@  "Initial attempt at sharing" 06-Oct-2013 10:18 PM
```

Everything looks good, let's deliver the changes.

```
:::text
~/scmtest> lscm deliver
Delivering changes:
  Repository: https://hub.jazz.net/ccm01/
  Workspace: (1529) "pwagstro | scmtest Stream"
    Component: (1530) "pwagstro | scmtest Default Component"
      Change sets:
        (1532) ---$  "Initial attempt at sharing" 06-Oct-2013 10:20 PM
          Changes:
            --a-- /Test/
            --a-- /Test/README.md
Deliver command successfully completed.
```

Congratulations, you've now pushed your first file using the RTC SCM to JazzHub.

Synchronizing the Changes to Orion
----------------------------------

One of the really valuable features of JazzHub is the ability to edit and checkin your code right from the browser. This, in theory, lets someone do all of their development within the cloud. Go back to your project page on JazzHub and select the `Code` tab at the top.

<div class="image caption center">
	<img src="/weblog/media/2013/10/jazzhub-code-tab.png" width="522" height="281" alt="Click on the Code Tab">
	<p>Click on the Code Tab on Your JazzHub Project Page</p>
</div>

This should take you right to a page where you'll see your `Test` module on the side. Click on the twistie to reveal your blank `README.md` file. Now, enter something useful into it. Click `Save` when you're happy.

<div class="image caption center">
	<img src="/weblog/media/2013/10/jazzhub-orion-editor.png" width="974" height="273" alt="Click on the Code Tab">
	<p>Enter in Something Useful into the Editor</p>
</div>

Now, check your changes in by clicking on "Check in".

<div class="image caption center">
	<img src="/weblog/media/2013/10/jazzhub-orion-checkin.png" width="385" height="155" alt="Check In Your Code">
	<p>Check In Your Code</p>
</div>

Now click "submit".

Congratulations! You've just successfully committed your first bit of code using the JazzHub editor.
