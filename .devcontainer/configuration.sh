#!/bin/sh
# get the directory of make
make_dir=$(ls -d /opt/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.make*/tools/bin)
echo "Make directory : $make_dir"
# get the directory of openocd
openocd_dir=$(ls -d /opt/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.openocd*/tools/bin)
echo "OpenOCD directory : $openocd_dir"
# get the directory of cubeprogrammer
cubeprogrammer_dir=$(ls -d /opt/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.cubeprogrammer*/tools/bin)
echo "CubeProgrammer directory : $cubeprogrammer_dir"
# get the directory of gnu-tools-for-stm32
gnu_tools_for_stm32_dir=$(ls -d /opt/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin)
echo "GNU Tools for STM32 directory : $gnu_tools_for_stm32_dir"
# add the directories to the PATH
export PATH="${make_dir}:${openocd_dir}:${cubeprogrammer_dir}:${gnu_tools_for_stm32_dir}:${PATH}"

# Update the bash .bashrc
echo "export PATH=\"${make_dir}:${openocd_dir}:${cubeprogrammer_dir}:${gnu_tools_for_stm32_dir}:\${PATH}\"" >> ~/.bashrc


# ENV PATH="${PATH}:$(ls -d /opt/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.cubeprogrammer*/tools/bin)"
# ENV PATH="${PATH}:$(ls -d /opt/st/stm32cubeide_1.14.0/plugins/com.st.stm32cube.ide.mcu.externaltools.gnu-tools-for-stm32*/tools/bin)"