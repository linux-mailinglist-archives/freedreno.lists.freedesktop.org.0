Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95237F95B7
	for <lists+freedreno@lfdr.de>; Tue, 12 Nov 2019 17:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFA16E0FD;
	Tue, 12 Nov 2019 16:33:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4D06EAFB
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2019 10:21:18 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id i31so4526810uae.13
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2019 02:21:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=M9jnplVvI1Z3lHbnLW8Vuy8T1iB9SeLFj5sVI3bWyT8=;
 b=EtLMUzT00BO9B3rG+rZiVE5zjDpmg5Q93vuiVFuzTa3wIyTaUnMDERYczbkW+7D0Gl
 fjHMrfq89B936qhLRzV7HPczKkvDsbFQuWrD9tu1bxka1OfnqWixINqrrUEzgfrDLeLY
 xSfE/Lfp9+aEDyKJ3yydQFAkNCX1Z79vBHmfJPwyPy5fRynHzkdHeUdNR2ngGkONw6tN
 XM7/HQZfe7G/lVernSzxeap95uHP09mreuUEomM7bgykjVIVivCGAF3g2EhZdDe17qU7
 MrZeZSbwk0v7q50n8hJLCxcVRWmMGIm8VDSj1/hSyhrZe5ZQP+BmBGASbdOUqPd84OYo
 b5Xw==
X-Gm-Message-State: APjAAAUzwSF5Ln21bYYCILHEAMbUsu4RPVK0279b3DsWDsXTO7G+hmkp
 K8OE2UOwSReNfjV2Z9Lxewn1vJ1ZvvK0CCZg1ie4D1a1M78=
X-Google-Smtp-Source: APXvYqziCJz1Z/iEdMEQnwdsWzB6mj9acltdg2BmYZbTaC17+ed1guAwAQpqXm7BroLDof9b/5LPfsDUgEHZl4hBYA4=
X-Received: by 2002:ab0:2618:: with SMTP id c24mr4962164uao.75.1573554077518; 
 Tue, 12 Nov 2019 02:21:17 -0800 (PST)
MIME-Version: 1.0
From: vadiraj kaveri <vadirajkaveri@gmail.com>
Date: Tue, 12 Nov 2019 15:51:06 +0530
Message-ID: <CA+xOhcQ8ZmYPoa1Q8P9CDkudpdHnZJO+6QPFSKFJKn3ED6HWhg@mail.gmail.com>
To: chandanu@codeaurora.org
X-Mailman-Approved-At: Tue, 12 Nov 2019 16:33:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=M9jnplVvI1Z3lHbnLW8Vuy8T1iB9SeLFj5sVI3bWyT8=;
 b=TSajrO/Wjqme3fffBXHxYlXQgTxtlycC+jxTW9v9mggsKtfd8CTJSl03PDQrMACvBP
 9uf2D36Lakm7IeNYXdhsnUO43CFF/T4HtZSVw8Ur/hYdXbp+9apyEe9W+bCGuHWIIH8M
 soEG8f+ophkPxDzMwLsk1BxmlpLRx3XSc0ZHgNMyAEaxXzllV1PDufhKgoijF6S3kq6M
 p+1Jx5ghEhatcjTrOcFktrF9QdxO8+vvWulbudBK0wa7jp9L1EQJXw6gHcnQwPmbhXF2
 MTZ4d7BGykbnF4yvQ/5wMyiqocte5yWksZ9BPupeDGhFKVyaJDPM69vKCvdipp/JC5qH
 j3SA==
Subject: [Freedreno] Add support for DisplayPort driver on SnapDragon 845 -
 5.2.0 kernel from Linaro.
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0676313982=="
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--===============0676313982==
Content-Type: multipart/alternative; boundary="000000000000d3510e0597239b2f"

--000000000000d3510e0597239b2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chandan,

I am trying to enable DP on 5.2.0 based kernel from Linaro, using Inforce
Computing SnapDragon 845 based board. I have integrated your DP patches
done on 4.9 kernel.
I am getting some compile errors as listed below. Please let me know if you
have some pointers for that, also do you have plans to integrate on 5.2
kernel? Please let me know.

*** Default configuration is based on 'defconfig'
arch/arm64/configs/defconfig:346:warning: override: reassigning to symbol
SERIAL_QCOM_GENI
arch/arm64/configs/defconfig:347:warning: override: reassigning to symbol
SERIAL_QCOM_GENI_CONSOLE
arch/arm64/configs/defconfig:406:warning: override: reassigning to symbol
PINCTRL_SDM845
arch/arm64/configs/defconfig:859:warning: override: reassigning to symbol
DMA_CMA
arch/arm64/configs/defconfig:870:warning: override: reassigning to symbol
SECURITY
arch/arm64/configs/defconfig:871:warning: override: reassigning to symbol
CRYPTO_ECHAINIV
arch/arm64/configs/defconfig:872:warning: override: reassigning to symbol
CRYPTO_ANSI_CPRNG
arch/arm64/configs/defconfig:874:warning: override: reassigning to symbol
ARM64_CRYPTO
arch/arm64/configs/defconfig:875:warning: override: reassigning to symbol
CRYPTO_SHA1_ARM64_CE
arch/arm64/configs/defconfig:876:warning: override: reassigning to symbol
CRYPTO_SHA2_ARM64_CE
arch/arm64/configs/defconfig:877:warning: override: reassigning to symbol
CRYPTO_SHA512_ARM64_CE
arch/arm64/configs/defconfig:878:warning: override: reassigning to symbol
CRYPTO_SHA3_ARM64
arch/arm64/configs/defconfig:879:warning: override: reassigning to symbol
CRYPTO_SM3_ARM64_CE
arch/arm64/configs/defconfig:880:warning: override: reassigning to symbol
CRYPTO_GHASH_ARM64_CE
arch/arm64/configs/defconfig:881:warning: override: reassigning to symbol
CRYPTO_CRCT10DIF_ARM64_CE
arch/arm64/configs/defconfig:882:warning: override: reassigning to symbol
CRYPTO_AES_ARM64_CE_CCM
arch/arm64/configs/defconfig:883:warning: override: reassigning to symbol
CRYPTO_AES_ARM64_CE_BLK
arch/arm64/configs/defconfig:884:warning: override: reassigning to symbol
CRYPTO_CHACHA20_NEON
arch/arm64/configs/defconfig:885:warning: override: reassigning to symbol
CRYPTO_AES_ARM64_BS
arch/arm64/configs/defconfig:895:warning: symbol value 'm' invalid for
BT_HCIUART_QCA
#
# No change to .config
#
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CC      drivers/gpu/drm/msm/dp/dp_power.o
  CC      drivers/gpu/drm/msm/msm_fbdev.o
  CC      drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.o
  CC      drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.o
drivers/gpu/drm/msm/dp/dp_power.c: In function =E2=80=98msm_dss_enable_vreg=
=E2=80=99:
drivers/gpu/drm/msm/dp/dp_power.c:128:5: error: implicit declaration of
function =E2=80=98usleep_range=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
     usleep_range(in_vreg[i].pre_on_sleep * 1000,
     ^~~~~~~~~~~~
drivers/gpu/drm/msm/dp/dp_power.c: In function =E2=80=98dp_power_clk_init=
=E2=80=99:
drivers/gpu/drm/msm/dp/dp_power.c:289:19: error: =E2=80=98struct dp_parser=
=E2=80=99 has no
member named =E2=80=98pll=E2=80=99
  if (power->parser->pll && power->parser->pll->get_provider) {
                   ^~
drivers/gpu/drm/msm/dp/dp_power.c:289:41: error: =E2=80=98struct dp_parser=
=E2=80=99 has no
member named =E2=80=98pll=E2=80=99
  if (power->parser->pll && power->parser->pll->get_provider) {
                                         ^~
drivers/gpu/drm/msm/dp/dp_power.c:290:21: error: =E2=80=98struct dp_parser=
=E2=80=99 has no
member named =E2=80=98pll=E2=80=99
   rc =3D power->parser->pll->get_provider(power->parser->pll,
                     ^~
drivers/gpu/drm/msm/dp/dp_power.c:290:54: error: =E2=80=98struct dp_parser=
=E2=80=99 has no
member named =E2=80=98pll=E2=80=99
   rc =3D power->parser->pll->get_provider(power->parser->pll,
                                                      ^~
In file included from drivers/gpu/drm/msm/dp/dp_power.c:9:0:
drivers/gpu/drm/msm/dp/dp_power.c: In function
=E2=80=98dp_power_set_link_clk_parent=E2=80=99:
drivers/gpu/drm/msm/dp/dp_power.c:597:7: error: implicit declaration of
function =E2=80=98__clk_get_name=E2=80=99 [-Werror=3Dimplicit-function-decl=
aration]
       __clk_get_name(power->link_provider),
       ^
./include/drm/drm_print.h:387:29: note: in definition of macro
=E2=80=98DRM_DEBUG_DP=E2=80=99
  drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
                             ^~~~~~~~~~~
drivers/gpu/drm/msm/dp/dp_power.c:596:18: warning: format =E2=80=98%s=E2=80=
=99 expects
argument of type =E2=80=98char *=E2=80=99, but argument 3 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
     DRM_DEBUG_DP("%s: is the parent of clk=3D%s\n",
                  ^
./include/drm/drm_print.h:387:21: note: in definition of macro
=E2=80=98DRM_DEBUG_DP=E2=80=99
  drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
                     ^~~
drivers/gpu/drm/msm/dp/dp_power.c:596:18: warning: format =E2=80=98%s=E2=80=
=99 expects
argument of type =E2=80=98char *=E2=80=99, but argument 4 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
     DRM_DEBUG_DP("%s: is the parent of clk=3D%s\n",
                  ^
./include/drm/drm_print.h:387:21: note: in definition of macro
=E2=80=98DRM_DEBUG_DP=E2=80=99
  drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
                     ^~~
drivers/gpu/drm/msm/dp/dp_power.c: In function
=E2=80=98dp_power_set_pixel_clk_parent=E2=80=99:
drivers/gpu/drm/msm/dp/dp_power.c:624:16: warning: format =E2=80=98%s=E2=80=
=99 expects
argument of type =E2=80=98char *=E2=80=99, but argument 3 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
   DRM_DEBUG_DP("%s: is the parent of clk=3D%s\n",
                ^
./include/drm/drm_print.h:387:21: note: in definition of macro
=E2=80=98DRM_DEBUG_DP=E2=80=99
  drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
                     ^~~
drivers/gpu/drm/msm/dp/dp_power.c:624:16: warning: format =E2=80=98%s=E2=80=
=99 expects
argument of type =E2=80=98char *=E2=80=99, but argument 4 has type =E2=80=
=98int=E2=80=99 [-Wformat=3D]
   DRM_DEBUG_DP("%s: is the parent of clk=3D%s\n",
                ^
./include/drm/drm_print.h:387:21: note: in definition of macro
=E2=80=98DRM_DEBUG_DP=E2=80=99
  drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
                     ^~~
cc1: some warnings being treated as errors
scripts/Makefile.build:278: recipe for target
'drivers/gpu/drm/msm/dp/dp_power.o' failed
make[4]: *** [drivers/gpu/drm/msm/dp/dp_power.o] Error 1
make[4]: *** Waiting for unfinished jobs....
scripts/Makefile.build:489: recipe for target 'drivers/gpu/drm/msm' failed
make[3]: *** [drivers/gpu/drm/msm] Error 2
scripts/Makefile.build:489: recipe for target 'drivers/gpu/drm' failed
make[2]: *** [drivers/gpu/drm] Error 2
scripts/Makefile.build:489: recipe for target 'drivers/gpu' failed
make[1]: *** [drivers/gpu] Error 2
make[1]: *** Waiting for unfinished jobs....
Makefile:1071: recipe for target 'drivers' failed
make: *** [drivers] Error 2

Thanks,
Vadiraj

--000000000000d3510e0597239b2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Chandan,</div><div><br></div><div>I am trying to e=
nable DP on 5.2.0 based kernel from Linaro, using Inforce Computing SnapDra=
gon 845 based board. I have integrated your DP patches done on 4.9 kernel.<=
/div><div>I am getting some compile errors as listed below. Please let me k=
now if you have some pointers for that, also do you have plans to integrate=
 on 5.2 kernel? Please let me know.</div><div><br></div><div>*** Default co=
nfiguration is based on &#39;defconfig&#39;<br>arch/arm64/configs/defconfig=
:346:warning: override: reassigning to symbol SERIAL_QCOM_GENI<br>arch/arm6=
4/configs/defconfig:347:warning: override: reassigning to symbol SERIAL_QCO=
M_GENI_CONSOLE<br>arch/arm64/configs/defconfig:406:warning: override: reass=
igning to symbol PINCTRL_SDM845<br>arch/arm64/configs/defconfig:859:warning=
: override: reassigning to symbol DMA_CMA<br>arch/arm64/configs/defconfig:8=
70:warning: override: reassigning to symbol SECURITY<br>arch/arm64/configs/=
defconfig:871:warning: override: reassigning to symbol CRYPTO_ECHAINIV<br>a=
rch/arm64/configs/defconfig:872:warning: override: reassigning to symbol CR=
YPTO_ANSI_CPRNG<br>arch/arm64/configs/defconfig:874:warning: override: reas=
signing to symbol ARM64_CRYPTO<br>arch/arm64/configs/defconfig:875:warning:=
 override: reassigning to symbol CRYPTO_SHA1_ARM64_CE<br>arch/arm64/configs=
/defconfig:876:warning: override: reassigning to symbol CRYPTO_SHA2_ARM64_C=
E<br>arch/arm64/configs/defconfig:877:warning: override: reassigning to sym=
bol CRYPTO_SHA512_ARM64_CE<br>arch/arm64/configs/defconfig:878:warning: ove=
rride: reassigning to symbol CRYPTO_SHA3_ARM64<br>arch/arm64/configs/defcon=
fig:879:warning: override: reassigning to symbol CRYPTO_SM3_ARM64_CE<br>arc=
h/arm64/configs/defconfig:880:warning: override: reassigning to symbol CRYP=
TO_GHASH_ARM64_CE<br>arch/arm64/configs/defconfig:881:warning: override: re=
assigning to symbol CRYPTO_CRCT10DIF_ARM64_CE<br>arch/arm64/configs/defconf=
ig:882:warning: override: reassigning to symbol CRYPTO_AES_ARM64_CE_CCM<br>=
arch/arm64/configs/defconfig:883:warning: override: reassigning to symbol C=
RYPTO_AES_ARM64_CE_BLK<br>arch/arm64/configs/defconfig:884:warning: overrid=
e: reassigning to symbol CRYPTO_CHACHA20_NEON<br>arch/arm64/configs/defconf=
ig:885:warning: override: reassigning to symbol CRYPTO_AES_ARM64_BS<br>arch=
/arm64/configs/defconfig:895:warning: symbol value &#39;m&#39; invalid for =
BT_HCIUART_QCA<br>#<br># No change to .config<br>#<br>=C2=A0 CALL =C2=A0 =
=C2=A0scripts/atomic/check-atomics.sh<br>=C2=A0 CALL =C2=A0 =C2=A0scripts/c=
hecksyscalls.sh<br>=C2=A0 CHK =C2=A0 =C2=A0 include/generated/compile.h<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/msm/dp/dp_power.o<br>=C2=A0 C=
C =C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/msm/msm_fbdev.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.o<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.o<br>drivers/gpu/dr=
m/msm/dp/dp_power.c: In function =E2=80=98msm_dss_enable_vreg=E2=80=99:<br>=
drivers/gpu/drm/msm/dp/dp_power.c:128:5: error: implicit declaration of fun=
ction =E2=80=98usleep_range=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]<br>=C2=A0 =C2=A0 =C2=A0usleep_range(in_vreg[i].pre_on_sleep * 1000,<br>=
=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~<br>drivers/gpu/drm/msm/dp/dp_power.c: In f=
unction =E2=80=98dp_power_clk_init=E2=80=99:<br>drivers/gpu/drm/msm/dp/dp_p=
ower.c:289:19: error: =E2=80=98struct dp_parser=E2=80=99 has no member name=
d =E2=80=98pll=E2=80=99<br>=C2=A0 if (power-&gt;parser-&gt;pll &amp;&amp; p=
ower-&gt;parser-&gt;pll-&gt;get_provider) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>drivers/gpu/drm/msm/dp/dp_po=
wer.c:289:41: error: =E2=80=98struct dp_parser=E2=80=99 has no member named=
 =E2=80=98pll=E2=80=99<br>=C2=A0 if (power-&gt;parser-&gt;pll &amp;&amp; po=
wer-&gt;parser-&gt;pll-&gt;get_provider) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>drivers/gpu/drm/msm/dp/d=
p_power.c:290:21: error: =E2=80=98struct dp_parser=E2=80=99 has no member n=
amed =E2=80=98pll=E2=80=99<br>=C2=A0 =C2=A0rc =3D power-&gt;parser-&gt;pll-=
&gt;get_provider(power-&gt;parser-&gt;pll,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~<br>drivers/gpu/drm/msm/d=
p/dp_power.c:290:54: error: =E2=80=98struct dp_parser=E2=80=99 has no membe=
r named =E2=80=98pll=E2=80=99<br>=C2=A0 =C2=A0rc =3D power-&gt;parser-&gt;p=
ll-&gt;get_provider(power-&gt;parser-&gt;pll,<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~<br>In file included from drivers/gpu/drm/msm/dp/dp_pow=
er.c:9:0:<br>drivers/gpu/drm/msm/dp/dp_power.c: In function =E2=80=98dp_pow=
er_set_link_clk_parent=E2=80=99:<br>drivers/gpu/drm/msm/dp/dp_power.c:597:7=
: error: implicit declaration of function =E2=80=98__clk_get_name=E2=80=99 =
[-Werror=3Dimplicit-function-declaration]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0__c=
lk_get_name(power-&gt;link_provider),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>./=
include/drm/drm_print.h:387:29: note: in definition of macro =E2=80=98DRM_D=
EBUG_DP=E2=80=99<br>=C2=A0 drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~<br>drivers/gpu/drm/msm/dp/dp_power.c=
:596:18: warning: format =E2=80=98%s=E2=80=99 expects argument of type =E2=
=80=98char *=E2=80=99, but argument 3 has type =E2=80=98int=E2=80=99 [-Wfor=
mat=3D]<br>=C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DP(&quot;%s: is the parent of clk=
=3D%s\n&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^<br>./include/drm/drm_print.h:387:21: note: in definition of macro =
=E2=80=98DRM_DEBUG_DP=E2=80=99<br>=C2=A0 drm_dbg(DRM_UT_DP, fmt, ## __VA_AR=
GS__)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~<br>drivers/gpu/drm/msm/dp/dp_power.c:596:18: warning: format =
=E2=80=98%s=E2=80=99 expects argument of type =E2=80=98char *=E2=80=99, but=
 argument 4 has type =E2=80=98int=E2=80=99 [-Wformat=3D]<br>=C2=A0 =C2=A0 =
=C2=A0DRM_DEBUG_DP(&quot;%s: is the parent of clk=3D%s\n&quot;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>./include/drm/=
drm_print.h:387:21: note: in definition of macro =E2=80=98DRM_DEBUG_DP=E2=
=80=99<br>=C2=A0 drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>driver=
s/gpu/drm/msm/dp/dp_power.c: In function =E2=80=98dp_power_set_pixel_clk_pa=
rent=E2=80=99:<br>drivers/gpu/drm/msm/dp/dp_power.c:624:16: warning: format=
 =E2=80=98%s=E2=80=99 expects argument of type =E2=80=98char *=E2=80=99, bu=
t argument 3 has type =E2=80=98int=E2=80=99 [-Wformat=3D]<br>=C2=A0 =C2=A0D=
RM_DEBUG_DP(&quot;%s: is the parent of clk=3D%s\n&quot;,<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>./include/drm/drm_print.h:38=
7:21: note: in definition of macro =E2=80=98DRM_DEBUG_DP=E2=80=99<br>=C2=A0=
 drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>drivers/gpu/drm/msm/dp/=
dp_power.c:624:16: warning: format =E2=80=98%s=E2=80=99 expects argument of=
 type =E2=80=98char *=E2=80=99, but argument 4 has type =E2=80=98int=E2=80=
=99 [-Wformat=3D]<br>=C2=A0 =C2=A0DRM_DEBUG_DP(&quot;%s: is the parent of c=
lk=3D%s\n&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ^<br>./include/drm/drm_print.h:387:21: note: in definition of macro =E2=80=
=98DRM_DEBUG_DP=E2=80=99<br>=C2=A0 drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~<br>cc1: some warnings being treated as errors<br>scripts/Makefile=
.build:278: recipe for target &#39;drivers/gpu/drm/msm/dp/dp_power.o&#39; f=
ailed<br>make[4]: *** [drivers/gpu/drm/msm/dp/dp_power.o] Error 1<br>make[4=
]: *** Waiting for unfinished jobs....<br>scripts/Makefile.build:489: recip=
e for target &#39;drivers/gpu/drm/msm&#39; failed<br>make[3]: *** [drivers/=
gpu/drm/msm] Error 2<br>scripts/Makefile.build:489: recipe for target &#39;=
drivers/gpu/drm&#39; failed<br>make[2]: *** [drivers/gpu/drm] Error 2<br>sc=
ripts/Makefile.build:489: recipe for target &#39;drivers/gpu&#39; failed<br=
>make[1]: *** [drivers/gpu] Error 2<br>make[1]: *** Waiting for unfinished =
jobs....<br>Makefile:1071: recipe for target &#39;drivers&#39; failed<br>ma=
ke: *** [drivers] Error 2</div><div><br></div><div>Thanks,</div><div>Vadira=
j<br></div><div><br></div></div>

--000000000000d3510e0597239b2f--

--===============0676313982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

--===============0676313982==--
