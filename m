Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3266A54308
	for <lists+freedreno@lfdr.de>; Thu,  6 Mar 2025 07:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F15F10E90B;
	Thu,  6 Mar 2025 06:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KiQL8tUt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CBD10E909
 for <freedreno@lists.freedesktop.org>; Thu,  6 Mar 2025 06:48:12 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-543d8badc30so375706e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 22:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741243690; x=1741848490; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xHCquTSEunjfj+1YUVoUpApaUr1w2znED2tG1DEgAQk=;
 b=KiQL8tUtzaTizjfADh1Y5vp/N25cTJhtihpWy0FJQPnUkK8SP67Ldrcrd12dpDOU8Y
 NKYUHcc3qWOFbIY76E89Pah1Y61p2UW6wdR+YNSG5qiBCKQZxfT5KMf01mswiJ+d2kwJ
 gR5VHw5YaG3u8Aex3YAGj7pOYfvjxSy3+ZskjEd3JqcxCkqOdNr6hbnwiqu7FcMosn1G
 VqsednwO0y+EoywUgf8cXgrARKMohWbka3BSj0zyUD5x+DX/DRC023S08zpRxzQsnM1z
 8uFrfQv8x7DXGZXF8CGvwXexFrYjZIFNk8IjLjZvZh9KLq5oH8Gd7ze7yP0q4rXwEGaz
 Hh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741243691; x=1741848491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xHCquTSEunjfj+1YUVoUpApaUr1w2znED2tG1DEgAQk=;
 b=gtmiu1JnhG6rlDGeqRjmawA/etPVvY5HAhLxnuWETa3H3Y2+ShefEl7Px5cwd+66mT
 3R/SlfYuC5giF7hTHJycqGyuHfQWc314NQeG1GgjZPCHrRGJy2X0oUF6F3lAzRVudeqC
 2m22rlJBD/zPN7NjHOvc25fgi/ktuIBXhvd+l3G/q4cDGbKvcccQJNyhB0MV5Le1yrOh
 FfyGbnVdwDicJmsvO/EXDh6TGLOB/gKZ+CZgDe96DyiUnzT7F3UNRAsbq2aovETsQuYh
 ef75e8w8z/GY6q4f7fmUrV7mwPm2fMMwbJmStS9GedgUXcI1PGl5ReU42w5RHffkWXvm
 BCxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT/m7YcYByFz8rKBEmMgmUdOwAuj6TnAf6/Y3ISn2XLTJqr7+CccH5EtgNvPsCW4F4HwRdIk02RNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp6s2YqK2de1CEo+O3x1Kmc8BwjBXPkJLw0IIixe3LXBnntBUx
 uIsBmixU/OGTzWoN9JbJcYC21SB2SFBqWZc/Kq4+JmjMcdVyWxJhBBjgHdoP1kw=
X-Gm-Gg: ASbGncv4xtDSmRjrOQ5a93A2bUhKd8tvDkaKImOMTjIsl4Kt/MZ8hCpR5KxYfZ2HfpO
 bt83r2XR3rC4FVFUPxHpCp/1EWyX+lsQ8jLaUxbpgk3xEC2V3vL0F5bmy+7flIKOM6CChJIuIlU
 v6jZ6SJTap1+z0c5xuGxpXNLtRl8kHT0oL1NFebiIj9BdR19Hdqtu/ysHmZVK28vLpFPHgPh2LV
 9qUHyTh6aoIAV7fdZ1vG4Xpk/xuP4QmNLgmGTlzRoP2Jl55inFxPcMCRijDUbo432qsO8Ktrxo4
 +Aesvsj3R3qz6za50uIqfFRGJtUmPYn2nLgN6A2G1Ed4cQ5bjms2eSkCgCw/oOsXP+jsS206OFE
 yBJ9SuScHdjMYrO1046zQZ8kM
X-Google-Smtp-Source: AGHT+IEt5G9y3ap+/DKUieOPRr2JaSqOwkMlnv51oikQmKDmuT5f9uColn4O0tNHRZ5UaMTYsN27/Q==
X-Received: by 2002:a05:6512:2827:b0:549:4e7b:dcf7 with SMTP id
 2adb3069b0e04-5497d331b17mr2846180e87.3.1741243690579; 
 Wed, 05 Mar 2025 22:48:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ae58079sm83858e87.68.2025.03.05.22.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 22:48:09 -0800 (PST)
Date: Thu, 6 Mar 2025 08:48:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU 5.x+
Message-ID: <jwvctczoypux3pdjzb7ozslqc566nmvb7kfeujjhyqhr3bbbcv@sgiaeqowzb5b>
References: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>
 <d1162f8d-5977-42f6-931b-266a2f25049f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1162f8d-5977-42f6-931b-266a2f25049f@quicinc.com>
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

On Wed, Mar 05, 2025 at 09:06:08PM -0800, Abhinav Kumar wrote:
> 
> 
> On 3/5/2025 7:15 PM, Jessica Zhang wrote:
> > Now that CDM_0 has been enabled for DPU 5.x+, add support for YUV formats
> > on writeback
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
> >   12 files changed, 24 insertions(+), 24 deletions(-)
> > 
> 
> Good catch!
> 
> Fixes: 15f2825defeb ("drm/msm/dpu: enable CDM_0 for DPUs 5.x+")

Again, this adds new feature, it's not a fix. There is nothing wrong
with the current tree.

For the patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
