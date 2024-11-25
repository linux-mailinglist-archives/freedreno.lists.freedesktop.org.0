Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F039D8E5E
	for <lists+freedreno@lfdr.de>; Mon, 25 Nov 2024 23:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7EA10E74A;
	Mon, 25 Nov 2024 22:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ed1MOFZ7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630A910E748
 for <freedreno@lists.freedesktop.org>; Mon, 25 Nov 2024 22:12:07 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6ee676b4e20so50442367b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Nov 2024 14:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732572726; x=1733177526; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RGr05iKNJHbtHhaz6iDKZMDzd6vC++UBaPJYjmD+AfE=;
 b=ed1MOFZ7B2dMBgTvL7chSiEURPRIZe+UKHWTW2R7orKX9uYJ2utHfasPDi/i4CbLq7
 7Xo7AfeAqjHmkiX1ErNd42/rZvgCgSUCxv+hDfhqFL6r5nxbXtXlOLz11f0neb+qhC8g
 tyrWxbFb3yGSlsXVi8wXzoiHeQveTGUy2TXyzrdinapoP1UQY0ewvEfy3r0gNCXIgYaa
 Dwerk/ecZTRtvIOH7e7fFbYPfdqycQAZ7K6cItYeVEUYgbg1fQDrdJt+S1VVz4uoQrBJ
 9D0BVdg7qTgfEKGEqdYL+PaFwqh0GYmzHwFQTpfd8hdxNhS2xBRFjxP4yyRCxwuK0jfB
 L2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732572726; x=1733177526;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RGr05iKNJHbtHhaz6iDKZMDzd6vC++UBaPJYjmD+AfE=;
 b=K4iO9v8TUj0fFXU3/0nLtJJXrO0WgXp7yjNI7WHOnTDSLEfN2zSyccom5urvFTHnnF
 8mkR0B1jyCvSCsW+fgNsZBFLJTNSF9d0stADIwjrNtAn0ltprbKv9OC8Q9BI9HrMRZlV
 dom1cwnVEI9JSshQlWo82VUMoBiQSg8Yd4rG/2fIOX9VN82mAIGSaS45+4yYBSCuHOxU
 k5LXn939xxo7qk2i0eAiPejCcXSAsObb3Q/XEmP4r4Hrm/ZzXUDpxO9cWYoq9D4bwsGh
 Eumy7eWpGomopF2d2oZlrowwc8vxEVa+U+zSEYvuMPlkyywYHN5SSEWNaHrbLqf/XS4C
 cjwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvdhxvrGYJfa+y3msPijAhLgZ9GnkmacMzfeOQmMHYPfk0gu2NGuamwYeZ9n4W9+k1ILlrPXjDuBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzovI4D9QltNm59EvcCUMgbwpCPs5cGftJiD94P7OhRAgfy3Acj
 NMbsAW0r+ZmBWANTi2Idp4ZaXcDyOEd1YonXGIHNd/DhzTmj0SvC0iyI9x7lJjt+OQL3PPG02jk
 xFkzFLRNNDfnic6WHroTGwTxGQac96ItHd/zTWQ==
X-Gm-Gg: ASbGnctzG/iDEWPA4A5DC16KodPyDuRWpyDBipZKjWz+dSnuaMNq2w9BQOGQqNqWJNq
 x9AHi0giVZqj/LGz6zcg9EwGVSmKR4u320Nd3ccPDe9Rp0Q==
X-Google-Smtp-Source: AGHT+IHMeE1tMJvjhY7YlnbsGtnbHrVf2fxw1EomN6QywO8Yk7cLfG7wt01HeO53/ICqUTeaxSuJYhsdBLq9CwzcufI=
X-Received: by 2002:a05:690c:600e:b0:6ee:5068:74f7 with SMTP id
 00721157ae682-6eee08ba0c6mr132245527b3.23.1732572726501; Mon, 25 Nov 2024
 14:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-7-35252e3a51fe@quicinc.com>
 <mcvhfkh3ycrx2ganumsxlc7lx53ed55yk4syh5qev3jqqgkeqj@h5vnfpgjwtj5>
 <bfc87132-a63e-4f3f-99b7-1a1bd7eb60ce@quicinc.com>
In-Reply-To: <bfc87132-a63e-4f3f-99b7-1a1bd7eb60ce@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Nov 2024 00:11:55 +0200
Message-ID: <CAA8EJpoYwGHenThgxaKcapjTng3BchpbVBfzXqBvTDGBzv2J-w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/msm/dsi: Add support for SM6150
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Mon, 25 Nov 2024 at 04:31, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/11/22 18:10, Dmitry Baryshkov wrote:
> > On Fri, Nov 22, 2024 at 05:56:50PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add support for DSI 2.3.1 (block used on SM6150).
> >>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 +++-
> >>   drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
> >>   2 files changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..fe02724bddf69c2e8d6816589f4ea410fa666e5b 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> @@ -171,7 +171,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
> >>      .num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> >>      .io_start = {
> >>              { 0xae94000, 0xae96000 }, /* SDM845 / SDM670 */
> >> -            { 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6375 */
> >> +            { 0x5e94000 }, /* QCM2290 / SM6115 / SM6125 / SM6150 / SM6375 */
> >
> > Not true
> Should I remove it or add it behind the SDM670?

You should not be sending patches which provide false information. Why
did you add it to the wrong line in the first place?

> >
> >>      },
> >>   };
> >>
> >> @@ -286,6 +286,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >>              &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>      {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
> >>              &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >> +    {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_1,
> >> +            &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>      {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
> >>              &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>      {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> index 4c9b4b37681b066dbbc34876c38d99deee24fc82..120cb65164c1ba1deb9acb513e5f073bd560c496 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> @@ -23,6 +23,7 @@
> >>   #define MSM_DSI_6G_VER_MINOR_V2_2_0        0x20000000
> >>   #define MSM_DSI_6G_VER_MINOR_V2_2_1        0x20020001
> >>   #define MSM_DSI_6G_VER_MINOR_V2_3_0        0x20030000
> >> +#define MSM_DSI_6G_VER_MINOR_V2_3_1 0x20030001
> >>   #define MSM_DSI_6G_VER_MINOR_V2_4_0        0x20040000
> >>   #define MSM_DSI_6G_VER_MINOR_V2_4_1        0x20040001
> >>   #define MSM_DSI_6G_VER_MINOR_V2_5_0        0x20050000
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry
