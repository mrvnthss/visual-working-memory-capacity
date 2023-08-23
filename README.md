# Visual Working Memory Capacity

![Static Badge](https://img.shields.io/badge/MATLAB-9.14_(2023a)-%233464e3)
![Static Badge](https://img.shields.io/badge/Psychtoolbox-3.0.19-%233464e3)
![GitHub](https://img.shields.io/github/license/mrvnthss/brightness-discrimination-2afc?color=%2342ffd1)

This repository contains [MATLAB](#matlab) code that replicates[^1] a visual working memory capacity experiment by [Vogel & Machizawa (2004)](#vogel-machizawa). This experiment is part of [#EEGManyLabs](https://osf.io/yb3pq/), a large-scale effort by an international collaboration of researchers "to directly test the replicability of key findings from 20 of these [most influential and continually cited] studies [in the field of EEG research] in teams of at least three independent laboratories" ([Pavlov et al., 2021](#eeg-manylabs)).

[^1]: This solely refers to the psychophysics of the study by [Vogel & Machizawa (2004)](#vogel-machizawa). The source code published here is not intended to be used for an actual EEG study.

## Table of Contents

- [Overview](#overview)
- [Results by Vogel & Machizawa (2004)](#results-by-vogel--machizawa-2004)
- [Getting Started](#getting-started)
- [Configuring the Experiment](#configuring-the-experiment)
- [Known Issues](#known-issues)
- [References](#references)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Overview

In their study, [Vogel & Machizawa (2004)](#vogel-machizawa) provide evidence for "**lateralized [brain] activity in humans that reflects the encoding and maintenance of items in visual memory**". Moreover, their study strongly suggests that the amplitude of this neural activity (measured by recording ERPs) serves as a "strong neurophysiological predictor of an individual’s [visual working memory] capacity" ([Vogel & Machizawa, 2004](#vogel-machizawa)).

To arrive at these results, [Vogel & Machizawa (2004)](#vogel-machizawa) had their subjects complete the following visual working memory task: On each trial, participants were briefly shown a bilateral array of colored squares. Subjects had to memorize the items from only one of the two hemifields, which was indicated with an arrow prior to the onset of the memory array. After a retention interval spanning 900 ms, "memory was tested (...) with the presentation of a test array that was either identical to the memory array or differed by one colour" ([Vogel & Machizawa, 2004](#vogel-machizawa)). To indicate whether the two arrays were identical or different, subjects pressed one of two buttons. This flow of the experiment is summarized in the following figure:

<div align="center">
    <img src="figures/trial-structure.png" alt="trial-structure" width="800">
    <p><b>Note:</b> To properly see all parts of the image, you need to use a light theme in GitHub.
        <br>You can change GitHub's appearance under <i>Settings &rarr; Appearance</i>.</p>
</div>

Additionally, here is a dynamic preview[^2] of the experiment:

<div align="center">
    <img src="figures/experiment-demo.gif" alt="trial-structure" width="600">
</div>

[^2]: The size of the stimuli has been increased for demonstration purposes.

## Results by Vogel & Machizawa (2004)

The experiments conducted by [Vogel & Machizawa (2004)](#vogel-machizawa) suggest that there is **lateralized activity** (contralateral to the memorized hemifield) **reflecting** "**the maintenance of successful representations in visual memory**". This activity comes in the form of a "large negative-going voltage (. ...) focused primarily over the posterior parietal and lateral occipital electrode sites" with a peak latency of approximately 200 ms (ERPs were time-locked to the onset of the memory array) ([Vogel & Machizawa, 2004](#vogel-machizawa)).

The mere presence of the described signal during the experiment does not imply that this contralateral delay activity reflects "the maintenance of successful representations in visual memory" since visual memory performance is driven by numerous processes ([Vogel & Machizawa, 2004](#vogel-machizawa)). How then did the authors arrive at their conclusion?

1. By repeating the experiment with different array sizes (1, 2, 3, and 4), [Vogel & Machizawa (2004)](#vogel-machizawa) showed that the "amplitude [of the delay activity] was **highly sensitive to the number of items** in the memory array". Additionally, this amplitude was **significantly larger for correct trials compared to incorrect trials**.

2. In a third experiment, [Vogel & Machizawa (2004)](#vogel-machizawa) had participants complete the same task again; this time with array sizes of 2, 4, and 6 squares. While there was a significant increase in amplitude going from 2 to 4 squares per array, there was no additional increase when increasing the array size further from 4 to 6 squares. Given that a typical individual's memory capacity is right around 3 to 4 items, this implies that the delay activity's **amplitude only increases for larger stimulus arrays below or at an individual's capacity and does not increase any further for supra-capacity arrays**.

3. This finding was further reinforced by yet another experiment in which participants completed the same task again, this time the arrays consisted of 2, 4, 8, and 10 squares each. The finding was identical: While there was a significant increase in amplitude going from 2 to 4 squares per hemifield, no such increase was observed when moving from 4 to either 8 or 10 squares per array ([Vogel & Machizawa, 2004](#vogel-machizawa)).

4. The amplitude of the contralateral delay activity initially increases monotonically as the number of squares per array increases.  However, it quickly reaches its maximum at three items per hemifield and then starts to drop off. Notably, the **visual working memory capacity** averaged across participants was "2.8 items, which is approximately when the memory **delay activity** reaches a limit" suggesting that these two measures are **strongly related** ([Vogel & Machizawa, 2004](#vogel-machizawa)).

5. Building on this finding, further analysis of the data showed that the increase in amplitude between arrays of 2 and 4 items was "very strongly correlated" with the individual subject's memory capacity, "with low-capacity subjects producing very little amplitude increase and high-capacity subjects showing larger amplitude increases" ([Vogel & Machizawa, 2004](#vogel-machizawa)).

## Getting Started

Follow these steps to clone the repository and run the project on your local machine.

### Prerequisites

- MATLAB with Psychtoolbox installed. Visit [Psychtoolbox](http://psychtoolbox.org/) for installation instructions.

### Clone the repository

1. Open a terminal or command prompt on your local machine.

2. Clone the repository using `git`:

```
git clone https://github.com/mrvnthss/visual-working-memory-capacity
```

### Run the Experiment

1. Open MATLAB and navigate to the cloned repository's directory.

2. Run the [`WorkingMemoryCapacity.m`](WorkingMemoryCapacity.m) script to start the experiment.

## Configuring the Experiment

### Setting Experiment Parameters

There are several parameters that can be changed in the [`WorkingMemoryCapacity.m`](WorkingMemoryCapacity.m) script that alter the experiment. They can be found in the *Configuration of Experiment* section close to the top of the script.

#### High-Level Settings

- `nSquares`: Controls the number of squares per hemifield in the memory and test arrays. [Vogel & Machizawa (2004)](#vogel-machizawa) conducted multiple experiments with varying numbers of squares (i.e., 1, 2, 3, 4, 6, 8, 10)

- `nTrials`: Number of trials to be conducted. [Vogel & Machizawa (2004)](#vogel-machizawa) had every subject complete 240 trials in each experiment.

- `nPracticeTrials`: Number of (additional) trials that participants complete to familiarize themselves with the experiment.

- `viewingDistanceMM`: The orthogonal distance (in mm) from the eye of the participant to the screen used to display the stimuli. This value is used to convert stimuli sizes from degrees of visual angle to number of pixels on the screen. The screen resolution as well as the physical size of the display (in mm) necessary for this conversion are provided through a call to the `ConfigurePsych.m` function.

- `Progress.thresholdPct`: Controls when participants are informed about their progress. Thereby also splitting trials into blocks.

#### Timing parameters

- `Duration.stimOnsetAsyncMinSecs`: Parameter (lower bound) of the uniform distribution from which SOA is sampled (in seconds).

- `Duration.stimOnsetAsyncMaxSecs`: Parameter (upper bound) of the uniform distribution from which SOA is sampled (in seconds).

- `Duration.arrowSecs`: Presentation duration (in seconds) of the arrow indicating the array of colored squares to memorize.

- `Duration.memoryArraySecs`: Presentation duration (in seconds) of the memory array.

- `Duration.retentionIntervalSecs`: Duration (in seconds) of the retention interval between presentation of memory array and test array.

- `Duration.testArraySecs`: Presentation duration (in seconds) of the test array.

### Configuring Psychtoolbox

The experiment code (i.e., the [`WorkingMemoryCapacity.m`](WorkingMemoryCapacity.m) script) calls the `configurePsych.m` function to generate a struct called `Config`. The parameters of this struct are then used to set up a new Psychtoolbox session to run the experiment. You can change the way this session is set up by passing the appropriate arguments to the `configurePsych.m` function:

- `whichScreen`: Either 'main' or 'max'. Passing 'main' will set `Config.screenNumber` to 0 (i.e., main screen), 'max' will set it to `max(Screen('Screens'))` (i.e., screen detected last). Defaults to 'main'.

- `skipTest`: Either 0 or 1. Assigned to the field `Config.skipTest` which is used to determine whether synchronization tests are to be skipped. A value of 1 will skip the internal synchronization tests, a value of 0 will not. Defaults to 1.

- `debugMode`: Either `true` or `false`. If set to `true` (and `whichScreen` is set to 'main'), Psychtoolbox opens a window positioned in the top-left that only covers 25 % of the screen. Defaults to `false`.

## Known Issues

As of now, there are two known issues with the implementation of the experiment:

1. **Size of stimuli**: To compute the size of the squares (in pixels) presented on screen[^3], we assume that every square is centered on the screen (which isn't the case). Technically, as objects of a fixed size in pixels move further into the periphery, their visual angle decreases. Conversely, if we want the visual angle to remain constant, we would have to alter the size of the squares in pixels depending on their precise location on the screen. This is currently not accounted for.

2. **Randomization of stimuli positions**: The colored squares were presented "within two 4° x 7.3° rectangular regions that were centered 3° to the left and right of a central fixation cross" and their positions "were randomized on each trial, with the constraint that the distance between squares within a hemifield was at least 2° (centre to centre)" ([Vogel & Machizawa, 2004](#vogel-machizawa)). As of now, this particular randomization is not implemented very efficiently. As a result, randomization of stimuli positions only works (in a reasonable amount of time) for stimulus arrays of up to 6 squares each. For further details, see [`WorkingMemoryCapacity.m`](WorkingMemoryCapacity.m).

[^3]: The size of the stimuli used in the experiments by [Vogel & Machizawa (2004)](#vogel-machizawa) was 0.65° by 0.65° of visual angle.

## References

- <a id='brainard-ptb'></a> Brainard D. H. (1997). The Psychophysics Toolbox. *Spatial vision, 10*(4), 433–436. [https://doi.org/10.1163/156856897X00357](https://doi.org/10.1163/156856897X00357)

- <a id='kleiner-ptb'></a> Kleiner, M., Brainard, D., & Pelli, D. (2007). What’s New in Psychtoolbox-3? *Perception 36*(14).

- <a id='eeg-manylabs'></a> Pavlov, Y. G., Adamian, N., Appelhoff, S., Arvaneh, M., Benwell, C. S. Y., Beste, C., Bland, A. R., Bradford, D. E., Bublatzky, F., Busch, N. A., Clayson, P. E., Cruse, D., Czeszumski, A., Dreber, A., Dumas, G., Ehinger, B., Ganis, G., He, X., Hinojosa, J. A., … Mushtaq, F. (2021). #EEGManyLabs: Investigating the replicability of influential EEG experiments. *Cortex, 144,* 213–229. [https://doi.org/10.1016/j.cortex.2021.03.013](https://doi.org/10.1016/j.cortex.2021.03.013)

- <a id='pelli-ptb'></a> Pelli D. G. (1997). The VideoToolbox software for visual psychophysics: transforming numbers into movies. *Spatial vision, 10*(4), 437–442. [https://doi.org/10.1163/156856897X00366](https://doi.org/10.1163/156856897X00366)

- <a id='matlab'></a> The MathWorks Inc. (2023). MATLAB version: 9.14.0 (R2023a), Natick, Massachusetts: The MathWorks Inc. [https://www.mathworks.com](https://www.mathworks.com)

- <a id='vogel-machizawa'></a> Vogel, E. K., & Machizawa, M. G. (2004). Neural activity predicts individual differences in visual working memory capacity. *Nature, 428*(6984), 748–751. [https://doi.org/10.1038/nature02447](https://doi.org/10.1038/nature02447)

## Acknowledgments

The experiment code is based on the Psychtoolbox library. For more information about Psychtoolbox, visit [Psychtoolbox](http://psychtoolbox.org/).

The *grammarly.com* [Grammar Checker](https://www.grammarly.com/grammar-check) was used to check written text for spelling and grammar mistakes.

Screenshots and screen capture videos were taken/recorded using macOS' built-in [Screenshot app](https://support.apple.com/guide/mac-help/take-screenshots-or-screen-recordings-mh26782/mac).

The [Gifski](https://gif.ski) app was used to convert screen capture videos into GIFs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Permissions

You are free to:

- **Use:** Copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the materials.

### Under the Following Terms

- **No Attribution Required:** The MIT License does not require you to provide attribution when using or distributing the code.

- **No Warranty:** The code is provided "as is," without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and non-infringement.

- **Limitation of Liability:** In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the code or the use or other dealings in the code.
