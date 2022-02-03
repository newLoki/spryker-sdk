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


if [[ -e ~/.bashrc ]]
then
    echo "alias spryker-sdk=\"${DESTINATION}/bin/spryker-sdk.sh\"" >> ~/.bashrc && source ~/.bashrc
    echo 'Created alias in ~/.bashrc';
elif [[ -e ~/.zshrc ]]
then
    echo "alias spryker-sdk=\"${DESTINATION}/bin/spryker-sdk.sh\"" >> ~/.zshrc  && source ~/.zshrc
    echo 'Created alias in ~/.zshrc';
else
  echo ""
  echo "Installation complete."
  echo "Add alias for your system spryker-sdk=\"${DESTINATION}/bin/spryker-sdk.sh\""
  echo ""
fi

# Exit from the script with success (0)
exit 0

__ARCHIVE__
�7zXZ  �ִF !   t/�����] 1J��7:Q�!:���e�Z��7ӧ�L�*6���E�ejŶ$�[	��Ѝq�����SB��s/��;�=~K��E2���ɼ��l3;�r���"������-aS����lѶ��~��L������������&*��"�� BI^H;M�T��{7�T��@X�����ޮ�m ��
�%�ֵ����*LO��d��F�;������4�N��f�������.�r#��C���ig�B :3��ֽ;1p�u��u�V��8H��,HN��?��w/G����b,�N�I�E��Zؘ͐��=ԗǵ������Ȃ�E����]~�o��(��&c�l��nR:�qE�Jm��!��ƈ�(| ʎp�B�#��*�$���M��]e��U�I��H Xq�ɮR���/UIA���W+�J;=ݦQMg�w��rN_f�N�[�ր��ץ5)O��H�fq�r�b�pmm X(��W"����}@�����ލr�3{�(*b�J���ҋ�[k�q�W�/_��a��h�y�6=����M,�X��j��,�ʨ�-+b���5���P��Z�/'fh��9�dj��K�־/O(�שH���5�m�ɻ����1�No?&�O )��B�1Hr��G��hmFfJ�^!�K'L�2R4.(r�����r!t�_��g�@n�)C綐�~Th��]��ҧ����c��En+��o=�=�{��g��6�w��bI�G���7m�N���!�k�X@�}:���U~���	�KK�N��c�5�]p/���`����>i(�l��@I$�~0��땾{L�A"o1�h���,NO!7.D��vs���Ǒ#J���/ʥ���;�ı�(��
� ��F�k#�PM�񼁂�����#�1�� Vt�s.�ibBhؖY�Jw6_�\�Ej���T�s0�!p�[z��lN��)�v-�IoQ��~O�N`)h�6N�w	�!7�B��B�%��M�t�m�L�V�b����
��B����f��}�����oq�u��X*������^|�`y��*S�`��;����m�ϔq-=��3՛	���6E)@���J:��h���zӌ��]k�;N�@a(`]J����ׁ����@����P�s�����i���_W�ax,'�@ȇ�B�W���ծ�S�x6z͖��D�J&��MƝ�T����q��1�S_�	�����\�dy�^>�K6I�������Ƿ.+*E��:-;�dغrq��Op�?�G5�2ִ��V�-L����8�ԋ�B�<����?j�Ok�r�cF�}���9�ٽ6;��@W$�^�JܢʾA��鵝Ҿ�{^8H�Ys���ZBQ�״GO;��/7���`"������0�*!sY��v�c'����5?�p+C?A"����st�՝�z)@5E�ݽ��g�9�2x�êΟ| �d�7Pz� #4.��N�����+U���ܤ&����o��za�F����p�g�/�g@��m:S��O�j��M4��mS퓢Dd ��(Ί��*�njϟH^k�-T�@��cH/y�w걥���췗�KW�IO��o�����PR�$�XK��������ö�������?wC���fTr�fs0��{*�]؉:I����*��41e��/,��2_���-�K���i>�\ �@����q[��v؞��1��B���uDN��!��;|e�co��:�$o����O��o�4���8������Wޓ��'� �K�u�ϟzf��蜷D?= 1�N�g���|6��K:Sq�C����F5��b� �b�t�6�F�������z�+ڄ�T�x���yCFV�F�ڼz��P��:t�C��R��A����u�o�]Mc&0�n{��p~�^]�5\�u�z�WW��/��M����<�Տ�!xL2"C�1�7�S���F3L��\�>{\2,�ܢV'�5w�EZ����'�F��~��5�������n�?�����Cf_��!�4(Q	<h!�~{)|��]_$�@�m�_
���_���C6�(��%�	�=��t�Y� Ȱ7�$�r2>�If��H�l�ldy�/��	�p�3jT�㚔	`(%[aZ���-��
:x���s"N���:~M�I������F/<}���_vy682~U�>�z5�u�l�2���)��k��y��)�&�S���%<�(�lɯw7
b�}2��ݤ;:���gO��,K-�4�N'��W)�����?4�)45O7�i��ړ�k���Z�O1	=����aR"���υ�@�io.ޟ)NCY(.��Ȏ>$���k�6e���&�#|ȃ��<�ܞ�ϲe S����QJ//�$MW�G����)�x�.�|���G�[��εe1)q�j�a�f�Zdc���x��:a�)kS���f�w���XG���8��R ����An��1:���@�p��5ieki�)C�:OG������a)�ِt >��84�s�C�r04�z& LpV�����:�#q�o�S�+��m(��Ԉ��f��������{�������cSñ�T�@>6&�%f�h�?�S� Y�Vϛ����e%�.�qJ^q��*	ɶh��>��_够�y>�?��{�����F.�D�/�@XG6:P��?�>s\z�G_�$�|�D���!Ѧ��;�A��sʮl^��!�nϑ��e�<�&��e��b>��iZA�=nV�Ƭ��[��b+�/�(��R���:1�����(��a���[2W�/�IC�u1�!�
MJQ�ܪA{gp�s��a�<���W���+mE��5�Ё~?�)�] ���=�h�GY��_!Ty�A1@Ɛ�i�w�70Å�p���f��d�pLҗ�yr�nw9����ߦQ5��	h�G������s'����Y�A��r�	a�e�=^G�W�d�J��-Q��
9#/f��)%�憇&V(GӤ�(�=�]8��=���́�gi�MӞ�������ƹ!��g������ �ᥝ�D��p%���֤���UU�(k����Ǿ��0F����l$��}�-���5�I\�¢wa��Y�w�^�p	[C��_^�]�W ���Af������`�f��*�_����X-��xN�a��2��"p_�����=�ćS�+����1 G�ÉR1�þ��n�6���%, ��m�n�Gȵ`*BBg۹X�{�%X,����ė��-�B�g�f��=Xb� �+�&>vY�=��3���R�},�_����ݕ@�w�aﰳ��⳿��;�+u���~��^������-ϛ�ΗXg��|3|�,�1��d-"���/�#sa	i| Z1(��*�����������+���Br�D��;��g��������e�w ,V�L|�h��K�Xl�O��Sl �}�0��!�,E/�q||��F<�:]����r�/aP�k����|�\�[���n7�'�����iԭWQi�6h͋�$_TFǽ�HC�]��j���A�t�)DNW����
��/�	��\�e2�>�!�)W^W"jn�w�o^��|*\҉+�F&r������b��ǯ1T���}�L�q�:ŉ->VO�,mH��N!�
�ȕk*� �5��*[��e��M�$d
���Q�u�
>ޮlc�#�&V3P}4gn<�ɴQ)�Y͙X/gf�#��LX5���(�J-��D<�!�x.Mnwm��P��f�;D�/��ᴊ�$�=���Za�d�t���k���R�=�6�pP�*�]fMނ	[�Er�3���������hP�0%� ��"��#Fa�W�hc���)�{�SK���i��Q�	d������R)��1��N����J�q�F-��K�2��s��	e9]�~����O~�q���V̘}|���fT��a��؈��`M	��_y��T�33\W�(q����N��1Fh� �g������=�ug66��A�v���Ø5��Ɉ��I�{�a%Т��x�>~X��VW���R(9��\}�@<�|jΊ����v1�w��oЎO�ϼ��bzK��.�d:�oI�&*J��=���{!�L���w�����"��{w�ab�ipI�W�=\�����0t�|^�����4��m�UC��5	�2����v�D������!�O���h,��k�
�V�3�G�Ya����(i�o��½9'��3�発vq*顊[����gV�\�U�`P��u>VLy���A���O/:[���9�w&[�k����i�yy�p������x8` ���������Y�lx�
c3$fz)���VN�u�Џ� G�ƍ
�W���_�i�6�{l���&V�giN|�P���s�~8��5�	kxh��Ba��|�''�vK��u"J���E�� ��<�� �����EA���ݼ�Wh�1U��8����co`'e�:��*�a�w�9&꡹���K�j�Vb����4è�|��H7Ϩ�:&�s�D�(<�+s�ӝ����-Ň�i��	��*k^2ȸ��P��V    94P�5��� �#�� Д�L��g�    YZ