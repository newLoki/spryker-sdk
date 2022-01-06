#!/bin/bash
echo ""
echo "Spryker SDK Installer"
echo ""

# Create destination folder
DESTINATION=$1
DESTINATION=${DESTINATION:-/opt/spryker-sdk}


mkdir -p "${DESTINATION}" &> /dev/null

if [ ! -d "${DESTINATION}" ]; then
    echo "Could not create ${DESTINATION}, please use a different directory to install the Spryker SDK into:"
    echo "./installer.sh /your/writeable/directory"
    exit 1
fi

# Find __ARCHIVE__ maker, read archive content and decompress it
ARCHIVE=$(awk '/^__ARCHIVE__/ {print NR + 1; exit 0; }' "${0}")
tail -n+"${ARCHIVE}" "${0}" | tar xpJ -C "${DESTINATION}"

${DESTINATION}/bin/spryker-sdk.sh sdk:init:sdk
${DESTINATION}/bin/spryker-sdk.sh sdk:update:all

echo ""
echo "Installation complete."
echo "To use the spryker sdk execute: "
echo "echo \"alias spryker-sdk='${DESTINATION}/bin/spryker-sdk.sh'\" >> ~/.bashrc && source ~/.bashrc"
echo ""

# Exit from the script with success (0)
exit 0

__ARCHIVE__
�7zXZ  �ִF !   t/����] 1J��7:@@KS,��	�����3�Xy�A�<x��QE(�u�� ��J����7��Ez�_/Ր2�0�5�'<'�T���`�eʊO�H�%.�!��s��zK��C��J��fUԪms�	<~��pǸ�R$�g��E�;DO�	�zn�Fi�oG�Ye~�+�i{h���cup$��N.42�?F�w�R����W�yU�kXH�)�#��q�����Ux�aTk>�ͷE��_?�~#Ƕ����=�J%�P;�Sx�w�M��ԥn:vkF��7��-Hl�麴Rg��:c3:ec0���`�}V7E��n^����) �c�N��@&�L^�y��n���Գ���ɧ�c4c�V�&�Yӎ�Hzk�
,��p(�4����c���՛X�L>\a֨��4�T�_�U`����no2�8�ԓ�ƃyH�Ë�@)(o������4FqF�<��g3�H��brY�Chy�h6���Ĺ�^n�}��ӯʩ��/8v9��t�������(��ݷ\���Y>�����$�#*m��֋���	�Y���;�t�(~�C�/�����X��D��Z)Nkf_�Bt`'����@rR������Yw�^sh�0�����]̛c,�/֞C�`sc�J�b�^�c�=�r3����QobT�f�׆ύE���e��
syw��+ �֞����[�,��2YD�Q�Χ�oBr)��?{�_8�K�K}Mo�#Z5�n�_:iA�k>��%��K{#S! �P��o~5&��^�\�R���c�H�:C3����3�GSU���er�J;��ӯpp( ��SD*n-y�v���v}I���֍ך��#�A��?�DC�jq]3c���g�qg ���4�y��/��=�Q�8���yEv��g��?L��� ++=F:O���<�������9���i�GU�|�2Z��;jy�P�^{��2I1u�/YI�x>�]9Se���?��l��f ���0��y02x ȷO^(�E�~s�����C��3\oR�)� 0�\(�5]�n���0��fP�h0^���mZ��+��~mV�(&t�%=M��ԁ�h�3��0Y��M�e��k�b�Z�x��N��BY�p���e �N�����i��!�7(<�k0r�"M��Q�HE!�/��
����
�_F�B����S�м�(&�X�aZZ��:M�Y>�/
l�<�GL�F�,w�ʒ(�5^ ���7�$�����dP�&i:�op�E���I�F��Oz)�n�\�#.�4�/N���x�w� L���q �F"��ߊ�_5|;�v�5�Gp��d��9���Sk����N'm)g��>�L/Q����{d"�7ݺ���+�j�D�N�DiB��-Ӈ��d�+t[+��C]�WR鸱(�%�v�̤�T#@�` ?�9��7�� ��@  B͌3��g�    YZ