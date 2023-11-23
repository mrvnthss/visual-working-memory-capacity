# Visual Working Memory Capacity

[![MATLAB](https://img.shields.io/badge/MATLAB-2023a-006d9b.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAhGVYSWZNTQAqAAAACAAFARIAAwAAAAEAAQAAARoABQAAAAEAAABKARsABQAAAAEAAABSASgAAwAAAAEAAgAAh2kABAAAAAEAAABaAAAAAAAAAEgAAAABAAAASAAAAAEAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAQKADAAQAAAABAAAAQAAAAAC1ay+zAAAACXBIWXMAAAsTAAALEwEAmpwYAAACymlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNi4wLjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iPgogICAgICAgICA8dGlmZjpZUmVzb2x1dGlvbj43MjwvdGlmZjpZUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KICAgICAgICAgPHRpZmY6WFJlc29sdXRpb24+NzI8L3RpZmY6WFJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgICAgIDxleGlmOlBpeGVsWERpbWVuc2lvbj4yNTY8L2V4aWY6UGl4ZWxYRGltZW5zaW9uPgogICAgICAgICA8ZXhpZjpDb2xvclNwYWNlPjE8L2V4aWY6Q29sb3JTcGFjZT4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjI1NjwvZXhpZjpQaXhlbFlEaW1lbnNpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgrkVyGCAAAHi0lEQVR4AeWbW6iVRRTHPR7NJIzootCTFiVesKwgswy6CEVWUhFWXoJECsKghyDyoR6rp54qKEWMLgQRPQRBhEJgD2UEgSBY+ZBRhIlJ1vFy+v3nm/+c2bfv7H323mdfXPD/1nwz882s/5q15rucfWbMOM9lpN/5j4+Py8ZR2zkyMnLG5aHXkXwFT9XVq6/oNAwnkJxpHpS3gp1gc1aX2l03NBqiKTUpfwZy+cREqUz9XDcUGmIh59G7gORfMAb+0wmyS0TRaW8YCuKR1KyoNwaqBfFYDEqOkDyW9x8KB0Aq5DV6PvgLSM4WKh19fpSaedEJw5EKEPLqfxDperUT+6r6V4YmCjLy6yPJM9Wss/NzsXwMffnARwEkHPrzKP8ayTnU42mNcnTsGPgogJpDf3ekaXI1rLMKO+gIdXMHNgowfnY0fkMkVxb6Gf9QPB0rNg1kFGC8V34R5ZORjFc2npYqO2tfdMDgPB1Cy3mvZ/vvI02vaCnrqkZviCun4oSeeAwCmndcBiMfg+vBaRAiAt2KnI2dN0bdE05NGwz59PhK+c24ms1serFrjXLK/EJLf26GGKYwHwVhw5O3KL8LJFMJ++LKiaP3ggfj2MnJTa9MNzpin4hXhDXnC8FeIOkE+XycD/vGAViVcpGyHnDWgNfAP0DSTtgXI0wcvRHq/WF+dELv3g8wIq065ReBXlxy6dTK1xvzyeiAZIPOp02wKEyMvgx8nVmoPBVxr1bW1JGi94HPRZYRm9oHOhomTDpLHy3RC7BhP1gExoCcklKCcjdEt1XxOQWWYMcR7JiJPlc2WceMipOJ/EVMuA+Y/AWUOzZPCRmR1xdj3Qrvi/0mnXfSDnGgUgVpHJ08/SmdFwOtvMhPp8gJkocLNaN09dWnbQdo5RnHLzRvUL4b9II80yY+t2HX1VqUaJ/a6sqUHcDAerAZ1SRAt7QtzLAdKAyne+VNzmmg+e+PlaUcSxs9qjUk04MNpM8K1C0Gr9Pnndivqd3XY3ZBt5QG7lxqBwTlKO2oWt0g1K2l8Ax4AJi0d+LQp0cH26D8X47NB2U/uu5+UPqwwIWBmFaawZRPl6A3gG0gvH6iJXKM+jblUF3QRXEaiNt6cBBoAes6oMZgSKpOuZ2v9hLqtoKNIDxqouUUebtfiGNKEtkmu76Dx03ihMjWGkkOoFO9ML+HKxTm64D3CzkmOAndz+JUuBHyB+CnRfW3g2T3LDXoLDYqzC/lVH91UZivABYRlxNK08ad+0CLrGx9BBwAabEpJ0mVEF9OrcL8CRC+taP7Ocwxr1SU81qwQ2AZC6ynVFRlKui2po3iWXA78AcLr7bDnqaBFDthLcS/hGtNGoigUuBWIPJ6kXDoDDp5qKSdX1EtSRFfnMYKPHMxFXuA7ukSRcCg5HowuMHBG+Ex2hcTBX9Wp8FMKvQKewLoe9pzQBeJvL7SDrpoxbWY2tgfimTCph/LRUjghBDuOEF3getofB8sBUoHDTLI6SAOIr0ffqtrIoAG3QL1QiPys9E/ULUCvAV0ocjLi4Mq4qDN8Bb4rYYfauJrUcXK0qhPVkoJvejoAUj30BPAKVH3aYr2Xops0gIJWm1riknkAMlThZrYDGt2RXXACaoPj8OUr6T8HrhDTUCDyau5qL7uWHmnLpRFttFmndtq+47TX5vhH+KIFLlfbZgagB4clBJHwZ302QGCY9DaIO1tiqFextjTquumiJDmF/mTYA94GjwOXgBfAdsqu1SW1svco0BSvYhFbfURJ+jDR1hdtDaRn0Au2jv85ynVy3HdlHz8nUykCK0R6mXrN9EQXeNP8d+qM+eBU82F9SrUGfiz11zK+g2P/rqzCawAS8E28BuQeLLirHNHk5fTtdpBKOudJrzXWGdtr1JnsV1r1E5lc1GQDdYo30IXBrwC/Bhn82TxtG1l8qcYyQRmU67YyOvZSp8tQCLHSXarH7qUj8eq0FykhydDXnd5Thx0AXXaZCR5ahQ1UzuavJx6c5xH3/1Khb555N7Lue3Rn9Dqpk7pgJM1MmgwCr0OSGx4cTa1o43W1XfJBvSk5HNb6e/0XUP5byB5Pu/TsTIDh7BCf6RZkHZSId9g/ctQv7G2ZDN22Anar46D31saoNnODBxyEn0NMHnnHlUtia9/SfNz5ZTI23Zfj9ZedQhsd1tHNQM7CvwLEBOhqWkZiz13yTjKre3YDRgxjm27kPLmBt3aq2ZgR8G1lE2+lSgw+b22hHGav2/7ogaasTrizAbDF9VMYk/voSyxI4qzxkf3O0wX/xi64wYztu4QdW+hpcSabWTwYDR6FZDku3lRU3s0ef0GeKHmQgdHNjtvX/XDeKfC3si17LZo8gr/GyL5tja9njvDq4f2z2BNMvojKdfLQekpr+cE2jUAMn6JmkP5ZyCpTgX/G8wJ2lYNxcrnjoOUN8OXxR7xakvbGfoD5lVDRz4S8j6wCJL65yeFeX5LfJtzP0IP7oaXr3p1GYKOAj8eywlfgJDv0VEdv9VV29Gzc4g6ClZSViosszGU9UbZsYccj9t3upok53qN7vmqT6vnRZqVEcJn+L5bpfPRoP8BboU5szUawX0AAAAASUVORK5CYII=
)](https://www.mathworks.com/)
[![Psychtoolbox](https://img.shields.io/badge/Psychtoolbox-3.0.19-50124e.svg?logo=data:image/png;base64,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
)](https://www.psychtoolbox.net)
[![GitHub License](https://img.shields.io/github/license/mrvnthss/brightness-discrimination-2afc?color=9a2333)](https://opensource.org/license/mit/)

This repository contains MATLAB (The MathWorks Inc., [2023](#matlab)) code that replicates[^1] a visual working memory capacity experiment by Vogel & Machizawa ([2004](#vogel-machizawa)). This experiment is part of [#EEGManyLabs](https://osf.io/yb3pq/), a large-scale effort by an international collaboration of researchers "to directly test the replicability of key findings from 20 of these [most influential and continually cited] studies [in the field of EEG research] in teams of at least three independent laboratories" (Pavlov et al., [2021](#eeg-manylabs)). The implementation provided here is based on the [Psychtoolbox](http://psychtoolbox.org/) library (Brainard, [1997](#brainard-ptb); Kleiner et al., [2007](#kleiner-ptb); Pelli, [1997](#pelli-ptb)).

[^1]: This solely refers to the psychophysics of the study by Vogel & Machizawa ([2004](#vogel-machizawa)). The source code published here is not intended to be used for an actual EEG study.

## Table of Contents

- [Overview](#overview)
- [Results by Vogel & Machizawa (2004)](#results-by-vogel--machizawa-2004)
- [Getting Started](#getting-started)
- [Configuring the Experiment](#configuring-the-experiment)
- [Data Analysis](#data-analysis)
- [Known Issues](#known-issues)
- [Languages and Tools](#languages-and-tools)
- [References](#references)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Overview

In their study, Vogel & Machizawa ([2004](#vogel-machizawa)) provide evidence for "**lateralized [brain] activity in humans that reflects the encoding and maintenance of items in visual memory**". Moreover, their study strongly suggests that the amplitude of this neural activity (measured by recording ERPs) serves as a "strong neurophysiological predictor of an individual’s [visual working memory] capacity" (Vogel & Machizawa, [2004](#vogel-machizawa)).

To arrive at these results, Vogel & Machizawa ([2004](#vogel-machizawa)) had their subjects complete the following visual working memory task: On each trial, participants were briefly shown a bilateral array of colored squares. Subjects had to memorize the items from only one of the two hemifields, which was indicated with an arrow prior to the onset of the memory array. After a retention interval spanning 900 ms, "memory was tested (...) with the presentation of a test array that was either identical to the memory array or differed by one colour" (Vogel & Machizawa, [2004](#vogel-machizawa)). To indicate whether the two arrays were identical or different, subjects pressed one of two buttons. This flow of the experiment is summarized in the following figure:

<div align="center">
    <img src="figures/trial-structure.png" alt="trial-structure" width="700">
    <p>Schematic flow of a single trial.<br>
    Size of stimuli has been increased for demonstration purposes.</p>
</div>
<br>

Additionally, here is a dynamic preview[^2] of the experiment:

<div align="center">
    <img src="figures/experiment-demo.gif" alt="trial-structure" width="600">
</div>

[^2]: The size of the stimuli has been increased for demonstration purposes.

## Results by Vogel & Machizawa (2004)

The experiments conducted by Vogel & Machizawa ([2004](#vogel-machizawa)) suggest that there is **lateralized activity** (contralateral to the memorized hemifield) **reflecting** "**the maintenance of successful representations in visual memory**". This activity comes in the form of a "large negative-going voltage (. ...) focused primarily over the posterior parietal and lateral occipital electrode sites" with a peak latency of approximately 200 ms (ERPs were time-locked to the onset of the memory array) (Vogel & Machizawa, [2004](#vogel-machizawa)).

The mere presence of the described signal during the experiment does not imply that this contralateral delay activity reflects "the maintenance of successful representations in visual memory" since visual memory performance is driven by numerous processes (Vogel & Machizawa, [2004](#vogel-machizawa)). How then did the authors arrive at their conclusion?

1. By repeating the experiment with different array sizes (1, 2, 3, and 4), Vogel & Machizawa ([2004](#vogel-machizawa)) showed that the "amplitude [of the delay activity] was **highly sensitive to the number of items** in the memory array". Additionally, this amplitude was **significantly larger for correct trials compared to incorrect trials**.

2. In a third experiment, Vogel & Machizawa ([2004](#vogel-machizawa)) had participants complete the same task again; this time with array sizes of 2, 4, and 6 squares. While there was a significant increase in amplitude going from 2 to 4 squares per array, there was no additional increase when increasing the array size further from 4 to 6 squares. Given that a typical individual's memory capacity is right around 3 to 4 items, this implies that the delay activity's **amplitude only increases for larger stimulus arrays below or at an individual's capacity and does not increase any further for supra-capacity arrays**.

3. This finding was further reinforced by yet another experiment in which participants completed the same task again, this time the arrays consisted of 2, 4, 8, and 10 squares each. The finding was identical: While there was a significant increase in amplitude going from 2 to 4 squares per hemifield, no such increase was observed when moving from 4 to either 8 or 10 squares per array (Vogel & Machizawa, [2004](#vogel-machizawa)).

4. The amplitude of the contralateral delay activity initially increases monotonically as the number of squares per array increases.  However, it quickly reaches its maximum at three items per hemifield and then starts to drop off. Notably, the **visual working memory capacity** averaged across participants was "2.8 items, which is approximately when the memory **delay activity** reaches a limit" suggesting that these two measures are **strongly related** (Vogel & Machizawa, [2004](#vogel-machizawa)).

5. Building on this finding, further analysis of the data showed that the increase in amplitude between arrays of 2 and 4 items was "very strongly correlated" with the individual subject's memory capacity, "with low-capacity subjects producing very little amplitude increase and high-capacity subjects showing larger amplitude increases" (Vogel & Machizawa, [2004](#vogel-machizawa)).

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

#### Experimental Design

- `nSquares`: Controls the number of squares per hemifield in the memory and test arrays. Vogel & Machizawa ([2004](#vogel-machizawa)) conducted multiple experiments with varying numbers of squares (i.e., 1, 2, 3, 4, 6, 8, and 10).

- `nTrials`: Number of trials to be conducted. Vogel & Machizawa ([2004](#vogel-machizawa)) had every subject complete 240 trials in each experiment.

- `nPracticeTrials`: Number of (additional) trials that participants complete to familiarize themselves with the experiment.

#### Timing parameters

- `Duration.stimOnsetAsyncMinSecs`: Parameter (lower bound) of the uniform distribution from which SOA is sampled (in seconds).

- `Duration.stimOnsetAsyncMaxSecs`: Parameter (upper bound) of the uniform distribution from which SOA is sampled (in seconds).

- `Duration.arrowSecs`: Presentation duration (in seconds) of the arrow indicating the array of colored squares to memorize.

- `Duration.memoryArraySecs`: Presentation duration (in seconds) of the memory array.

- `Duration.retentionIntervalSecs`: Duration (in seconds) of the retention interval between presentation of memory array and test array.

- `Duration.testArraySecs`: Presentation duration (in seconds) of the test array.

#### Other

- `viewingDistanceMM`: The orthogonal distance (in mm) from the eye of the participant to the screen used to display the stimuli. This value is used to convert stimuli sizes from degrees of visual angle to number of pixels on the screen. The screen resolution as well as the physical size of the display (in mm) necessary for this conversion are provided through a call to the [`configurePsych.m`](configurePsych.m) function.

- `Progress.thresholdPct`: Controls when (i.e., after which fraction of total trials) participants are informed about their progress. Thereby also splitting trials into blocks.

### Configuring Psychtoolbox

The experiment code (i.e., the [`WorkingMemoryCapacity.m`](WorkingMemoryCapacity.m) script) calls the [`configurePsych.m`](configurePsych.m) function to generate a struct called `Config`. The parameters of this struct are then used to set up a new Psychtoolbox session to run the experiment. You can change the way this session is set up by passing the appropriate arguments to the [`configurePsych.m`](configurePsych.m) function:

- `whichScreen`: Either 'main' or 'max'. Passing 'main' will set `Config.screenNumber` to 0 (i.e., main screen), 'max' will set it to `max(Screen('Screens'))` (i.e., screen detected last). Defaults to 'main'.

- `skipTest`: Either 0 or 1. Assigned to the field `Config.skipTest` which is used to determine whether synchronization tests are to be skipped. A value of 1 will skip the internal synchronization tests, a value of 0 will not. Defaults to 1.

- `debugMode`: Either `true` or `false`. If set to `true` (and `whichScreen` is set to 'main'), Psychtoolbox opens a window positioned in the top-left that only covers 25 % of the screen. Defaults to `false`.

## Data Analysis

The [`analyzeData.m`](analyzeData.m) script can be used to analyze data collected via the [`WorkingMemoryCapacity.m`](WorkingMemoryCapacity.m) script. To do so, simply run the [`analyzeData.m`](analyzeData.m) script from the command window while in the cloned repository's directory. This computes the hit rate, the false alarm rate, and the estimated visual working memory capacity for each valid dataset in the `data/` directory using the formula
$$K = S \times (H - F),$$
where $K$ is the estimated capacity, $S$ is the number of items in each array, $H$ is the hit rate, and $F$ is the false alarm rate. For the logic behind this formula, see (Vogel & Machizawa, [2004](#vogel-machizawa)). The results are stored in a table named `analyzedData` and are printed to the command window upon execution.

For example, when run with only the sample dataset provided in this repository, the [`analyzeData.m`](analyzeData.m) script will produce and print the following table[^3]:

<div align="center">
    <img src="figures/sample-results.png" alt="sample-results" width="600">
</div>

[^3]: The reason for there being only 239 trials is simply that I did not respond quickly enough in one of the 240 trials.

## Known Issues

As of now, there are two known issues with the implementation of the experiment:

1. **Size of stimuli**: To compute the size of the squares (in pixels) presented on screen[^4], we assume that every square is centered on the screen (which isn't the case). Technically, as objects of a fixed size in pixels move further into the periphery, their visual angle decreases. Conversely, if we want the visual angle to remain constant, we would have to alter the size of the squares in pixels depending on their precise location on the screen. This is currently not accounted for.

2. **Randomization of stimuli positions**: The colored squares were presented "within two 4° x 7.3° rectangular regions that were centered 3° to the left and right of a central fixation cross" and their positions "were randomized on each trial, with the constraint that the distance between squares within a hemifield was at least 2° (centre to centre)" (Vogel & Machizawa, [2004](#vogel-machizawa)). As of now, this particular randomization is not implemented efficiently. As a result, randomization of stimuli positions only works (in a reasonable amount of time) for stimulus arrays of up to 6 squares each. For further details, see [`WorkingMemoryCapacity.m`](WorkingMemoryCapacity.m).

[^4]: The size of the stimuli used in the experiments by Vogel & Machizawa ([2004](#vogel-machizawa)) was 0.65° by 0.65° of visual angle.

## Languages and Tools

<p align="left">
  <a href="https://www.mathworks.com/" target="_blank" rel="noreferrer">
    <img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" alt="matlab" width="40" height="40"/>
  </a>
  <a href="https://www.psychtoolbox.net" target="_blank" rel="noreferrer">
    <img src="https://www.psychtoolbox.net/wp-content/uploads/2022/03/no_background_purple_text.png" alt="pytorch" height="40"/>
  </a>
</p>

## References

- <a id='brainard-ptb'></a> Brainard, D. H. (1997). The Psychophysics Toolbox. *Spatial vision, 10*(4), 433–436. [https://doi.org/10.1163/156856897X00357](https://doi.org/10.1163/156856897X00357)

- <a id='kleiner-ptb'></a> Kleiner, M., Brainard, D. H., & Pelli, D. G. (2007). What’s new in Psychtoolbox-3? *Perception, 36*(ECVP Abstract Supplement), 14. [https://doi.org/10.1177/03010066070360S101](https://doi.org/10.1177/03010066070360S101)

- <a id='eeg-manylabs'></a> Pavlov, Y. G., Adamian, N., Appelhoff, S., Arvaneh, M., Benwell, C. S. Y., Beste, C., Bland, A. R., Bradford, D. E., Bublatzky, F., Busch, N. A., Clayson, P. E., Cruse, D., Czeszumski, A., Dreber, A., Dumas, G., Ehinger, B., Ganis, G., He, X., Hinojosa, J. A., … Mushtaq, F. (2021). #EEGManyLabs: Investigating the replicability of influential EEG experiments. *Cortex, 144,* 213–229. [https://doi.org/10.1016/j.cortex.2021.03.013](https://doi.org/10.1016/j.cortex.2021.03.013)

- <a id='pelli-ptb'></a> Pelli, D. G. (1997). The VideoToolbox software for visual psychophysics: transforming numbers into movies. *Spatial vision, 10*(4), 437–442. [https://doi.org/10.1163/156856897X00366](https://doi.org/10.1163/156856897X00366)

- <a id='matlab'></a> The MathWorks Inc. (2023). MATLAB (9.14.0) [Computer software]. The MathWorks Inc. [https://www.mathworks.com](https://www.mathworks.com)

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
