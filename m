Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E09BD11F4
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 03:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8975E10E1D1;
	Mon, 13 Oct 2025 01:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M51VJscT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2920610E31B
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 01:52:49 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-631df7b2dffso8331801a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 12 Oct 2025 18:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760320368; x=1760925168; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YRrC5ujv29o4Dn7uYuCsIN4DoTMp+m253g/eeBCZNpc=;
 b=M51VJscTzHTKbJDjAlrzRlY8huiQdUm3HMMMItQS0gqd2tXs2NRaVa0MVs2SU/4VSC
 Ru5a5L32SvLRFGrqZhVqjf+VOStGfHUzjy9AkHJ47iRx7Knf40M18lI1FVUL7CF/VR7u
 YEBLEbb+SxjlakwXgn0zrzytHzc7qx78vWnjzY4FM4NFMWlNRp78l5EiX7eL9VzrBLWu
 d8uh6PPnP1tcXy8iOf5+kAOuoT5gn4cVcdvG877bNLW88Cjje5DgxmspmxVOI6c3gAco
 Z9eoaUNlMTZ/V1ZVBqdPqAXWU50DnzVVzOwNkiBA/t1XAL/f92meMDsZ/UtYrkkSzNSU
 fwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760320368; x=1760925168;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YRrC5ujv29o4Dn7uYuCsIN4DoTMp+m253g/eeBCZNpc=;
 b=nZMmh/3xp+9aof69zwUncdnR2NypJu6L3kfGSXbWcoS96WzZij/5I6uX4MjgN2giIl
 GRuee0abJAobZEhASxc/vMBHvZmyIX0IS9MPUpnWNefF2MZvPaGwEkxujuyyuskmIqlm
 z1Wm0ZQgXI7AUZO3qvivjFJEjp+I6NUk2HGemXaNsgLtYwTHyS5X2/DPU918A2I89U62
 5J6ZnBEXteR4MAx+mSxbiqHjj0uc/1dWZQa9dCCwDbPhDNrGWgjWKVwnM31a2yRgLuss
 ohj/oGBTLTmXzVKvR/vozzvoUReEKCusUbw5BD4qX97NsErLPmXd7yTxNFU19cAfdAvP
 P5+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1aklUd8W9b5sxWk+sh9nooC84R/CK5rMa6WYpbPkcV5y1CN986+xBbbD9tf4YVmed7P3Be3MRXnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb49W7R42tkJ6d+FSL1XjslaXv9ciUVBYyhyrjTuao+42Tl0L9
 xbzNP+q7tGW5CzbMCkiHD0qT9Jlmdw6ABIYlG/RlFSEbd64/qVMSq+5eBK5ySCGEUsqeZ3I7+IA
 SoWlFptv3FNRzWI3G8iJcKhZsr0FdbLo=
X-Gm-Gg: ASbGnct7zA7akLgJ73uet94I6Q5WbAh95mxabVxec9c1MMAq6Rlhi5rQ21OREld7t/F
 UtDFb7CNQOq0H2KcVOGgyzKGtLuzEJ/J+2gIxSKaPb+lS8lBQIj5LpoVqYfSVIji9H/k/FUIfle
 FeHSKgjE7FDP+yOdYkMLxfrCgT/w8Ald48klC6moWYUNGzAXVfOtOYcSYjYTk/9ZuLbQTE3hhtT
 Wv42lu5Sdb56aAy5ERCKxKdCw==
X-Google-Smtp-Source: AGHT+IGVwit7EnJqjWJCndPnOaagwjFwRfHJs7DHjGaz2CJNOtKY3nJ4z/ccrJw0qhRGNyC1RhAM+KOBqlgUZm2HII4=
X-Received: by 2002:aa7:c58e:0:b0:62f:c8fc:dce5 with SMTP id
 4fb4d7f45d1cf-639bb229269mr18330933a12.10.1760320367440; Sun, 12 Oct 2025
 18:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
In-Reply-To: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 09:52:34 +0800
X-Gm-Features: AS18NWAwf-hT5rzEa8wZmFlK7aIZOX32p7ZERcY3_A8yYvmRn0M2ZAgY7d92ZDE
Message-ID: <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
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
Content-Type: multipart/alternative; boundary="0000000000003136b206410086f8"
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

--0000000000003136b206410086f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=
=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
>On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
>> From: Jun Nie <jun.nie@linaro.org>
>>
>> Some panels support multiple slice to be sent in a single DSC packet. An=
d
>> this feature is a must for specific panels, such as JDI LPM026M648C. Add
a
>> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
>> feature in msm mdss driver.
>>
>> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>>  include/drm/drm_mipi_dsi.h         |  2 ++
>>  2 files changed, 12 insertions(+), 15 deletions(-)
>
>Please extract the generic part, so that it can be merged through a
>generic tree.
>

Sorry, I don't get it.  The generic part, generic tree? Do you mean
the drm tree? `slice_per_pkt >=3D 2` is seen on the panels of these
tablets that are equipped with qcom chips. I don't know if these
panels are used on other platforms, and if it is necessary to do it
in drm.

>--
>With best wishes
>Dmitry

Regards,
Junjie

--0000000000003136b206410086f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshko=
v@oss.qualcomm.com">dmitry.baryshkov@oss.qualcomm.com</a>&gt; =E4=BA=8E2025=
=E5=B9=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=
=BC=9A<br>&gt;On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:<b=
r>&gt;&gt; From: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org">jun.nie@=
linaro.org</a>&gt;<br>&gt;&gt;<br>&gt;&gt; Some panels support multiple sli=
ce to be sent in a single DSC packet. And<br>&gt;&gt; this feature is a mus=
t for specific panels, such as JDI LPM026M648C. Add a<br>&gt;&gt; dsc_slice=
_per_pkt member into struct mipi_dsi_device and support the<br>&gt;&gt; fea=
ture in msm mdss driver.<br>&gt;&gt;<br>&gt;&gt; Co-developed-by: Jonathan =
Marek &lt;<a href=3D"mailto:jonathan@marek.ca">jonathan@marek.ca</a>&gt;<br=
>&gt;&gt; Signed-off-by: Jonathan Marek &lt;<a href=3D"mailto:jonathan@mare=
k.ca">jonathan@marek.ca</a>&gt;<br>&gt;&gt; Signed-off-by: Jun Nie &lt;<a h=
ref=3D"mailto:jun.nie@linaro.org">jun.nie@linaro.org</a>&gt;<br>&gt;&gt; Si=
gned-off-by: Junjie Cao &lt;<a href=3D"mailto:caojunjie650@gmail.com">caoju=
njie650@gmail.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0drivers/gpu/drm=
/msm/dsi/dsi_host.c | 25 ++++++++++---------------<br>&gt;&gt; =C2=A0includ=
e/drm/drm_mipi_dsi.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 ++<br>&gt;&gt; =
=C2=A02 files changed, 12 insertions(+), 15 deletions(-)<br>&gt;<br>&gt;Ple=
ase extract the generic part, so that it can be merged through a<br>&gt;gen=
eric tree.<br>&gt;<br><br>Sorry, I don&#39;t get it.=C2=A0 The generic part=
, generic tree? Do you mean<br>the drm tree? `slice_per_pkt &gt;=3D 2` is s=
een on the panels of these<br>tablets that are equipped with qcom chips. I =
don&#39;t know if these<br>panels are used on other platforms, and if it is=
 necessary to do it<br>in drm.<br><br>&gt;-- <br>&gt;With best wishes<br>&g=
t;Dmitry <br><br>Regards,<br>Junjie</div>

--0000000000003136b206410086f8--
