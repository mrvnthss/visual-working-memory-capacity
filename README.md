# Visual Working Memory Capacity

![Static Badge](https://img.shields.io/badge/MATLAB-9.14_(2023a)-%233464e3)
![Static Badge](https://img.shields.io/badge/Psychtoolbox-3.0.19-%233464e3)
![GitHub](https://img.shields.io/github/license/mrvnthss/brightness-discrimination-2afc?color=%2342ffd1)

This repository contains MATLAB code aiming to replicate a visual working memory capacity experiment by [Vogel & Machizawa (2004)](#vogel-machizawa).

## Overview

The flow of a single trial is depicted by the following figure:

<p style="text-align: center">
    <figure>
        <img src="figures/trial-structure.png" alt="trial-structure">
        <figcaption style="text-align: center">
            <b>Note:</b> To properly see all parts of the image, you need to use a light theme in GitHub. You can change GitHub's appearance under <i>Settings &rarr; Appearance</i>.
        </figcaption>
    </figure>
</p>

## Getting Started

Follow these steps to clone the repository and run the project on your local machine.

### Prerequisites

- MATLAB with Psychtoolbox installed. Visit [Psychtoolbox](http://psychtoolbox.org/) for installation instructions.

### Clone the repository

1. Open a terminal or command prompt on your local machine.

2. Clone the repository using `git`:

```
git clone https://github.com/mrvnthss/visual-working-memory-capacity
cd visual-working-memory-capacity
```

### Run the Experiment

1. Open MATLAB and navigate to the cloned repository's directory.

2. Run the `WorkingMemoryCapacity.m` script to start the experiment.

## Details

### Setting Experiment Parameters

There are several parameters that can easily be changed in the `WorkingMemoryCapacity.m` script that alter the experiment. They can be found in the *Configuration of Experiment* section of the script.

### Configuring Psychtoolbox

The experiment code (i.e., the `WorkingMemoryCapacity.m` script) calls the `configurePsych.m` function to generate a struct called `Config`. The parameters of this struct are then used to set up a new Psychtoolbox session to run the experiment. You can change the way this session is set up by passing the appropriate arguments to the `configurePsych.m` function:

- `whichScreen`: Either 'main' or 'max'. Passing 'main' will set `Config.screenNumber` to 0, 'max' will set it to `max(Screen('Screens'))` (i.e., screen detected last).

- `skipTest`: Either 0 or 1. Assigned to the field `Config.skipTest` which is used to determine whether synchronization tests are to be skipped.

- `debugMode`: Either `true` or `false`. If set to `true` (and `whichScreen` is set to 'main'), Psychtoolbox opens a window that only covers 25 % of the screen.

## References

<a id='eeg-manylabs'></a>
- Pavlov, Y. G., Adamian, N., Appelhoff, S., Arvaneh, M., Benwell, C. S. Y., Beste, C., Bland, A. R., Bradford, D. E., Bublatzky, F., Busch, N. A., Clayson, P. E., Cruse, D., Czeszumski, A., Dreber, A., Dumas, G., Ehinger, B., Ganis, G., He, X., Hinojosa, J. A., … Mushtaq, F. (2021). #EEGManyLabs: Investigating the replicability of influential EEG experiments. *Cortex, 144,* 213–229. [https://doi.org/10.1016/j.cortex.2021.03.013](https://doi.org/10.1016/j.cortex.2021.03.013)

<a id='vogel-machizawa'></a>
- Vogel, E. K., & Machizawa, M. G. (2004). Neural activity predicts individual differences in visual working memory capacity. *Nature, 428*(6984), 748–751. [https://doi.org/10.1038/nature02447](https://doi.org/10.1038/nature02447)

## Acknowledgments

The experiment code is based on the Psychtoolbox library. For more information about Psychtoolbox, visit [Psychtoolbox](http://psychtoolbox.org/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Permissions

You are free to:

- **Use:** Copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the materials.

### Under the Following Terms

- **No Attribution Required:** The MIT License does not require you to provide attribution when using or distributing the code.

- **No Warranty:** The code is provided "as is," without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose, and non-infringement.

- **Limitation of Liability:** In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the code or the use or other dealings in the code.
