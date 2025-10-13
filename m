Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96759BD1212
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 03:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E75D10E32B;
	Mon, 13 Oct 2025 01:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nhYAoRxW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C7F10E1D1
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 01:53:32 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-639102bba31so7659014a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 12 Oct 2025 18:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760320411; x=1760925211; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jib6qtZ7uovkQhx/qSCYqbTejviWgQQiEea0Nhubv1E=;
 b=nhYAoRxWA1+RPNLkrZfz9WmOUM0w8bBzVOGNJhocyUYiXUtbq21ljo1LdYCTVd+Mid
 QZZ5+1MHqgDNohAPWmlgJv70yt57p+df61UZWC1a66k4FUrv6zdMjRzJeuq96/Jjmc/f
 eMxJIoGI3+Fh/+a9bFb3Y8vlDBkOqW8403nfCCuLxGouoxs1DCV+TnruUEky4H8Qc05o
 5+wzwnkx9PkqrDjtohUsWvqFH+eFfD1qRhS5abEco8EkYj1LugbNwE+WrozYXu70vdUw
 eTYi6nQecoR7R2L18/0f8pf0kmmsy8zIsqbxXGbboEH0yT1tLlF/UIEdsYS8oIV0GyMN
 REjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760320411; x=1760925211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jib6qtZ7uovkQhx/qSCYqbTejviWgQQiEea0Nhubv1E=;
 b=xLyEIntDNbvYDtJhTyNo0WJo39Rup1HFdIqd2Dvz0gwGlJtonNrorUF4wDt10KP/Ux
 sOsSoVCC0AUTm4PuadyXqAm0KIxthOh6DMo0wSokjQNJ0QlIatGu6GKkfKmtZWbjaGeI
 7MhXF5gFVUojuXJPsQkC71nuBnIvLrArS6s4j1inVArB6cQLFkaNcUlG1ZG5AatDatTU
 XDMU/qlZsnxl764sZjxTCEt2D3iw5ZSJhCHPw8BhTYsQ5TD1bPsVWFYDyDg6Kvtzn0X8
 ILybrbRpyK0ztTmoh6wXze4UvCrAeCgC3vYMXB11l/RrGVqXDOcqEv3BHcsd60ph3bB9
 Pzuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWjo9ZY3cArOfi65aNf9ZsiEahnCmVFoo61LRfELZgP3vPWrM8T35Qgge0fBDD/DNfPaYUX4UaQ5Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaNucl+bF0IaREgFqlFaSw2Mc0Ei2/MNpDYCIh7qu4+rgJTK16
 TR+iI34W58akGb/YzI7sTdJ4pzuInAfiZM/TE/WgB+1MsSJ60MrCPDCKPu6UDox36ZzfKsLSBki
 dFNauDYhqGEKrAOwH5GgNttAKWDNFYlQ=
X-Gm-Gg: ASbGncuUwKO+xyj8Ks2eftwskjELdAsdoKYbxIqhEHcZkcC0ZEuAHJ+lL/kMCg0UlmU
 SVrqXgu6xgqulaH6Xt+SHC/N3mA/IXB5Xr1q2PrclUHJ41AAWZpOf+48+QBWv3yzxp14FBaxs4S
 oc+wfokDvBQS1MUsAo0ZQPqpVER5VAddM9ozybkWrTiYG47dWWxj+XDkv5Ts5QHxDTVbyXNwDi9
 gM12VCmc1DJEwF7+jG7g7wghg==
X-Google-Smtp-Source: AGHT+IHNL1BUTxL2xPvRlvw72ZaxFIL6RT4owwNyRO7JLM5S/Xgryvv1liecPpjG1QLNARe02zsa23/lQ3BBsnrQvyc=
X-Received: by 2002:a05:6402:13d1:b0:626:4774:2420 with SMTP id
 4fb4d7f45d1cf-639d5c320c0mr17570498a12.20.1760320410533; Sun, 12 Oct 2025
 18:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-4-caojunjie650@gmail.com>
 <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
In-Reply-To: <lfdhib6a7ct36nmj3of2setjft7ydrf6sfgtx7qued7qd56nhc@2xol3grm5re7>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 09:53:18 +0800
X-Gm-Features: AS18NWCXgZGcIsMOlZRhCMOrt21hgF7Nu9A3rD70J3JwS3-UfBSVjAvvGwnrsc8
Message-ID: <CAK6c68gLfH63Ywv_sP3YkHngihc4vscpdFrehj6uRfwEL=ZAfQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: Add Novatek NT36532 panel driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>, 
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000c2c4b706410088f4"
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--000000000000c2c4b706410088f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=
=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:
>> Add a driver for panels using the Novatek NT36532 Display Driver IC,
>> including support for the CSOT PPC100HB1-1, found in the OnePlus Pad 2
>> tablets.
>>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  MAINTAINERS                                   |   7 +
>>  drivers/gpu/drm/panel/Kconfig                 |  10 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  drivers/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++
>>  4 files changed, 455 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36532.c
>>
>> +
>> +static const struct panel_info csot_panel_info =3D {
>> +     .width_mm =3D 250,
>> +     .height_mm =3D 177,
>> +     .lanes =3D 4,
>> +     .format =3D MIPI_DSI_FMT_RGB888,
>> +     .mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOU=
S |
>> +                   MIPI_DSI_MODE_LPM,
>> +     .display_mode =3D csot_display_mode,
>> +     .dsc_slice_per_pkt =3D 2,
>
>As this is not a part of the standard, what if the DSI host doesn't
>support this feature?
>

Without it, parameters will not be calculated correctly, garbled then.

>> +     .dsc_cfg =3D &csot_dsc_cfg,
>> +     .init_sequence =3D csot_init_sequence,
>> +     .is_dual_dsi =3D true,
>> +};
>> +
>
>--
>With best wishes
>Dmitry

Regards,
Junjie

--000000000000c2c4b706410088f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshko=
v@oss.qualcomm.com">dmitry.baryshkov@oss.qualcomm.com</a>&gt; =E4=BA=8E2025=
=E5=B9=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:05=E5=86=99=E9=81=93=EF=
=BC=9A<br>&gt;On Wed, Oct 01, 2025 at 09:59:14PM +0800, Junjie Cao wrote:<b=
r>&gt;&gt; Add a driver for panels using the Novatek NT36532 Display Driver=
 IC,<br>&gt;&gt; including support for the CSOT PPC100HB1-1, found in the O=
nePlus Pad 2<br>&gt;&gt; tablets.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Ju=
njie Cao &lt;<a href=3D"mailto:caojunjie650@gmail.com">caojunjie650@gmail.c=
om</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 7 +<br>&gt;&gt; =C2=A0drivers/gpu/drm/=
panel/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A010 +<br>&gt;&gt; =C2=A0drivers/gpu/drm/panel/Makefile =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>&gt;&gt; =C2=A0driver=
s/gpu/drm/panel/panel-novatek-nt36532.c | 437 ++++++++++++++++++<br>&gt;&gt=
; =C2=A04 files changed, 455 insertions(+)<br>&gt;&gt; =C2=A0create mode 10=
0644 drivers/gpu/drm/panel/panel-novatek-nt36532.c<br>&gt;&gt;<br>&gt;&gt; =
+<br>&gt;&gt; +static const struct panel_info csot_panel_info =3D {<br>&gt;=
&gt; + =C2=A0 =C2=A0 .width_mm =3D 250,<br>&gt;&gt; + =C2=A0 =C2=A0 .height=
_mm =3D 177,<br>&gt;&gt; + =C2=A0 =C2=A0 .lanes =3D 4,<br>&gt;&gt; + =C2=A0=
 =C2=A0 .format =3D MIPI_DSI_FMT_RGB888,<br>&gt;&gt; + =C2=A0 =C2=A0 .mode_=
flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_CLOCK_NON_CONTINUOUS |<br>&gt;&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIPI_DSI_=
MODE_LPM,<br>&gt;&gt; + =C2=A0 =C2=A0 .display_mode =3D csot_display_mode,<=
br>&gt;&gt; + =C2=A0 =C2=A0 .dsc_slice_per_pkt =3D 2,<br>&gt;<br>&gt;As thi=
s is not a part of the standard, what if the DSI host doesn&#39;t<br>&gt;su=
pport this feature?<br>&gt;<br><br>Without it, parameters will not be calcu=
lated correctly, garbled then.<br><br>&gt;&gt; + =C2=A0 =C2=A0 .dsc_cfg =3D=
 &amp;csot_dsc_cfg,<br>&gt;&gt; + =C2=A0 =C2=A0 .init_sequence =3D csot_ini=
t_sequence,<br>&gt;&gt; + =C2=A0 =C2=A0 .is_dual_dsi =3D true,<br>&gt;&gt; =
+};<br>&gt;&gt; +<br>&gt;<br>&gt;-- <br>&gt;With best wishes<br>&gt;Dmitry =
<br><br>Regards,<br>Junjie</div>

--000000000000c2c4b706410088f4--
