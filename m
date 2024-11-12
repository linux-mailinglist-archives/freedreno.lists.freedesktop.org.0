Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB49C58B8
	for <lists+freedreno@lfdr.de>; Tue, 12 Nov 2024 14:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297E810E5DF;
	Tue, 12 Nov 2024 13:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f+G/95TZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C898B10E1E9
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2024 13:15:13 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6ea7c9227bfso57093617b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 12 Nov 2024 05:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731417312; x=1732022112; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RjMFUcCJ2PMcOh++QmaV4FSg4hd5bf5ZwUL8svAZiGU=;
 b=f+G/95TZI+DSnLe40Jwsvlbiale/juhmk3NGgB2oi5y6BOTQj1nL2WPpWmuFHJkAdB
 9z3C9QfYNq7bqttAsny1QWQdlWcVN5lA8HywdQRKkp8HbUiunLCKE20MyqQILG047TCZ
 2+SfwQ+7VFWaS8S1JLXP+4kB4eVHDZoClPnyrR9wjylsvm7MoQEM9oTSf47asahN+EGo
 mg8AxL00ziiDnTfz9hdPCcDSm2GAU4M+svXrJWjP1EcIop/2Q+lS9RGsYtFYrWJErc7w
 HLMEez9+tlDevjEbXXW3AR1RyeJmTYdauaoUSXIJ1Rxbl2fuYVT+kYur3u3VqME8hy5/
 Fc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731417312; x=1732022112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RjMFUcCJ2PMcOh++QmaV4FSg4hd5bf5ZwUL8svAZiGU=;
 b=lKPEEOo7D8Kjn6coVWSyj9SptUXL677BRWpUjxcSb/bc2h+/0egMjH7z8Krt2FgGkb
 R18Wit9d17LGEE1HhQU98iPjZTpOa8ipJo0U52eDXprl3WkKLsEex5AVjSe2O4/2Mws4
 QDDX3PwFY10xi63TZD5MKSegn9PjeQDkZ+pwuqm/hnGuXsxOeKpjPDgsbSC5RJhe5q29
 UAXs7+VphEkNYuRinJAVxn5mjVvlZMnXkx/ugSZ1u/kIze6mItPNj3qW414UEWP/q8AX
 tIl/e9wWwwhimrEypEqq6o01nSpWdMm3vMyX7BAo9LFAmnHvpzoxk+IlqfkPSr377d9r
 6bCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMLyS0uTF4Fe8NaOHJhae1vBoMNidBviNoPotxytLylFkhpxmlBK3TBTiR1zTSdaK8N1pIagwu0bA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTTJ+7ZUJKiUpRqGWIHZJA2j0/pc3VSoV7y/BajaqPdNv0kQVO
 VZHOF2Q/OBAMLH9fWf9CKn+xaFKmQSUR9ACUu2AZd0Yq+0XSafB6yKrqb5vb8GS4lZQp5DGsy8C
 vU+fpH/K/cF8RRH92CB2uW8qR6Nf5A3R+8eLHFw==
X-Google-Smtp-Source: AGHT+IHXjXnnSh4cfhalObRmFjWIlKplKbXL511dM4znTgK/qAvBdvKZqt3NvA/NCChuF/Jz1MpD8Bjt8ZPwU1Hyt0g=
X-Received: by 2002:a05:690c:9b08:b0:6e3:1f02:407b with SMTP id
 00721157ae682-6eaddda0ec6mr157284817b3.11.1731417312627; Tue, 12 Nov 2024
 05:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>
 <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
In-Reply-To: <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Nov 2024 15:15:03 +0200
Message-ID: <CAA8EJpqBouv-f-QMpZ+hrA-vF4ojhUWBn5yMqYYB9LpW0TACdg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,
 sa8775p-mdss: fix the example
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 12 Nov 2024 at 05:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/11/2024 7:21 PM, Dmitry Baryshkov wrote:
> > Add p1 region to the list of DP registers in the SA8775p example. This
> > fixes the following warning:
> >
> > Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short
> >
> > Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
> > Reported-by: Rob Herring <robh@kernel.org>
> > Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
>
> Thanks for the patch.
>
> I think this link has an extra 'c' at the end.

Oh.. Can you fix that when picking it up for -fixes or would you
prefer to have a clean version in patchwork?

>
> With that fixed,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://lore.kernel.org/r/20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org
> > ---
> >   Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > index 58f8a01f29c7aaa9dc943c232363075686c06a7c..4536bb2f971f3b7173b8807f90c9af3e460bb01c 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > @@ -168,7 +168,8 @@ examples:
> >               reg = <0xaf54000 0x104>,
> >                     <0xaf54200 0x0c0>,
> >                     <0xaf55000 0x770>,
> > -                  <0xaf56000 0x09c>;
> > +                  <0xaf56000 0x09c>,
> > +                  <0xaf57000 0x09c>;
> >
> >               interrupt-parent = <&mdss0>;
> >               interrupts = <12>;
> >
> > ---
> > base-commit: ff2ce06d5e28be5ee399a2ff894d6a551c70a318
> > change-id: 20241112-fd-dp-fux-warning-c8764c93f787
> >
> > Best regards,



-- 
With best wishes
Dmitry
