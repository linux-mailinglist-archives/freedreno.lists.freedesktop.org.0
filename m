Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A370BD1294
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 04:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF97E10E025;
	Mon, 13 Oct 2025 02:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFO8CXVi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C7510E352
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 02:02:31 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-631df7b2dffso8339083a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 12 Oct 2025 19:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760320950; x=1760925750; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cKOZo+MGQBv4KkNvRAav7sTJbp8ajk9ELpgGPOLBZm4=;
 b=VFO8CXVii0FG/VDW2hDWP0x/0AbbjKG71ilsAR+cnHNFBRQbBaHOAsiRAUCB/h9GoM
 v9U52ag1tu/UN9iqX0xa5sUsBg7aNV28cr0ZESzxIbbCoUhYH7NeZweVw4d8jwYBUXM5
 gSV7f/hO9fs1YSfQDY45hUVJbq1LahLVYaXHa6aasLQnYExtp4qgoj1NM5OpiHl2SZlW
 T/ImWxm0gEi6XUPRt+FEMPnhYBpxfMse1ND86MmCqp+F2+Pk/7HXgW6tmRzagGPDu0CH
 e+NawavBrdHeEOID11ooAcNDPJ+oHl9xdCLnmjWOumXDRdqdoYha8zViV0fSd2JEvIDu
 M2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760320950; x=1760925750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKOZo+MGQBv4KkNvRAav7sTJbp8ajk9ELpgGPOLBZm4=;
 b=vIwg4KazyEeL6T3SaJw8X9lNRG4AQphu5WXKFqFMOaTRB9aqe1unKS3yw418wqY0Tn
 OK1/qMm1naCZQhWMbG+K1zbNfBaWYlL2aLORqu58ILTMhCALEzzduE1ktT0RsVWIb78A
 cJkXPrumMApj4a82KCQGhmd7r6bUxO0LVABocCwYRdXTh+zRnbXSWz8XwQgaJ8lXwohO
 FXKcdQraq2SwSLlWKbOHmSC32TI/mPy5VvIYPYfeH3HUWQ0do9+mEQRxekpp8xBsOEHt
 p22DYHhcZuerKmKaPBuf7FFGZY2RlNXfyj1MryOloA0RUkioqT9djP/k3oz1N3G31Yzk
 JNEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaBWstMG7pscQU5MpIxtjw0bohScR0tAwK3ulE7cxrk4cEuR39oUtw4f9KDnHxmuXM6q8IW1MedF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAcTl/p2JOHkQttXde9qd2BBaCIDa+KqCgdAWfjWhwQv1T+y8L
 uldJhoeAA67nwlaeooss0uqLzl0h2eCK2LLupizHhRcZDbsMZGOsVS+e8i0Yeg2B40trDNXBtNR
 y/OoMVQ+/+EU13AITJnP8c5jjCMahPHI=
X-Gm-Gg: ASbGncutpbh1yVtpxwAfdA18o+/cGHsBTjg8zO2DpSykEE/DdVgO3cdadbHhKy29KAK
 8A8jgVWyma1UeLSvfPWuoye8wqU5aPVDSygZKtGwNXxCjquIv1373rYf74ujT8XJvlWtM4yHggz
 WV3++sPGJ14C14yp1FHlzkxDWyBS0w/j1NcSJLZFbPMyprxi6d7tv6RYSkzTI3epzYoMWdg9hjP
 sWOhqlKhcMo6yV+6igPF/nzAA==
X-Google-Smtp-Source: AGHT+IFTAKUZcpu0Or52X4cPFWH/lGvPoMo0cZl0OXAFq6HByiIQIZ46OQicUY/q4dcLXyIxPvL349rhnXiTBLRJSJ8=
X-Received: by 2002:a05:6402:2788:b0:63b:3aae:c426 with SMTP id
 4fb4d7f45d1cf-63b3aaeeffdmr11764783a12.19.1760320950055; Sun, 12 Oct 2025
 19:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
In-Reply-To: <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
From: =?UTF-8?B?5pu55L+K5p2w?= <caojunjie650@gmail.com>
Date: Mon, 13 Oct 2025 10:02:18 +0800
X-Gm-Features: AS18NWDYBe2ziyEiQdPGz_Noz0h9TvWVbunULPyIXdj2bUT39mUslIiSO0_o0Zc
Message-ID: <CAK6c68gnXo5re5z--t5P17UOPN+BHDjDR4D4NhBnuSHLq1AVpg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
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
Content-Type: multipart/alternative; boundary="000000000000eb369d064100a892"
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

--000000000000eb369d064100a892
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A
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

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
10=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A

> On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> > From: Jun Nie <jun.nie@linaro.org>
> >
> > Some panels support multiple slice to be sent in a single DSC packet. A=
nd
> > this feature is a must for specific panels, such as JDI LPM026M648C. Ad=
d
> a
> > dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> > feature in msm mdss driver.
> >
> > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> >  include/drm/drm_mipi_dsi.h         |  2 ++
> >  2 files changed, 12 insertions(+), 15 deletions(-)
>
> Please extract the generic part, so that it can be merged through a
> generic tree.
>
> --
> With best wishes
> Dmitry
>

--000000000000eb369d064100a892
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@os=
s.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;=
 =E4=BA=8E2025=E5=B9=B410=E6=9C=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=
=99=E9=81=93=EF=BC=9A<span class=3D"gmail-im"><br>&gt;On Wed, Oct 01, 2025 =
at 09:59:13PM +0800, Junjie Cao wrote:<br>&gt;&gt; From: Jun Nie &lt;<a hre=
f=3D"mailto:jun.nie@linaro.org" target=3D"_blank">jun.nie@linaro.org</a>&gt=
;<br>&gt;&gt;<br>&gt;&gt; Some panels support multiple slice to be sent in =
a single DSC packet. And<br>&gt;&gt; this feature is a must for specific pa=
nels, such as JDI LPM026M648C. Add a<br>&gt;&gt; dsc_slice_per_pkt member i=
nto struct mipi_dsi_device and support the<br>&gt;&gt; feature in msm mdss =
driver.<br>&gt;&gt;<br>&gt;&gt; Co-developed-by: Jonathan Marek &lt;<a href=
=3D"mailto:jonathan@marek.ca" target=3D"_blank">jonathan@marek.ca</a>&gt;<b=
r>&gt;&gt; Signed-off-by: Jonathan Marek &lt;<a href=3D"mailto:jonathan@mar=
ek.ca" target=3D"_blank">jonathan@marek.ca</a>&gt;<br>&gt;&gt; Signed-off-b=
y: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org" target=3D"_blank">jun.=
nie@linaro.org</a>&gt;<br>&gt;&gt; Signed-off-by: Junjie Cao &lt;<a href=3D=
"mailto:caojunjie650@gmail.com" target=3D"_blank">caojunjie650@gmail.com</a=
>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0drivers/gpu/drm/msm/dsi/dsi_host.c =
| 25 ++++++++++---------------<br>&gt;&gt; =C2=A0include/drm/drm_mipi_dsi.h=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 ++<br>&gt;&gt; =C2=A02 files changed=
, 12 insertions(+), 15 deletions(-)<br>&gt;<br>&gt;Please extract the gener=
ic part, so that it can be merged through a<br>&gt;generic tree.<br>&gt;<br=
><br></span>Sorry, I don&#39;t get it.=C2=A0 The generic part, generic tree=
? Do you mean<br>the drm tree? `slice_per_pkt &gt;=3D 2` is seen on the pan=
els of these<br>tablets that are equipped with qcom chips. I don&#39;t know=
 if these<br>panels are used on other platforms, and if it is necessary to =
do it<br>in drm.<span class=3D"gmail-im"><br><br>&gt;-- <br>&gt;With best w=
ishes<br>&gt;Dmitry <br><br></span>Regards,<br>Junjie</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com"=
>dmitry.baryshkov@oss.qualcomm.com</a>&gt; =E4=BA=8E2025=E5=B9=B410=E6=9C=
=882=E6=97=A5=E5=91=A8=E5=9B=9B 10:04=E5=86=99=E9=81=93=EF=BC=9A<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct 01, 2025 at 09=
:59:13PM +0800, Junjie Cao wrote:<br>
&gt; From: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org" target=3D"_bla=
nk">jun.nie@linaro.org</a>&gt;<br>
&gt; <br>
&gt; Some panels support multiple slice to be sent in a single DSC packet. =
And<br>
&gt; this feature is a must for specific panels, such as JDI LPM026M648C. A=
dd a<br>
&gt; dsc_slice_per_pkt member into struct mipi_dsi_device and support the<b=
r>
&gt; feature in msm mdss driver.<br>
&gt; <br>
&gt; Co-developed-by: Jonathan Marek &lt;<a href=3D"mailto:jonathan@marek.c=
a" target=3D"_blank">jonathan@marek.ca</a>&gt;<br>
&gt; Signed-off-by: Jonathan Marek &lt;<a href=3D"mailto:jonathan@marek.ca"=
 target=3D"_blank">jonathan@marek.ca</a>&gt;<br>
&gt; Signed-off-by: Jun Nie &lt;<a href=3D"mailto:jun.nie@linaro.org" targe=
t=3D"_blank">jun.nie@linaro.org</a>&gt;<br>
&gt; Signed-off-by: Junjie Cao &lt;<a href=3D"mailto:caojunjie650@gmail.com=
" target=3D"_blank">caojunjie650@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++--------------=
-<br>
&gt;=C2=A0 include/drm/drm_mipi_dsi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
&gt;=C2=A0 2 files changed, 12 insertions(+), 15 deletions(-)<br>
<br>
Please extract the generic part, so that it can be merged through a<br>
generic tree.<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--000000000000eb369d064100a892--
