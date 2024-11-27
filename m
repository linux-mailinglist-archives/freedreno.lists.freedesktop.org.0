Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A779F9DA8FF
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 14:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C66D10E283;
	Wed, 27 Nov 2024 13:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gRQK3gvJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861D310EAD9
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 13:49:35 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53dde5262fdso4983008e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 05:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732715374; x=1733320174; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sjfACckMsQ0RDEAnMAJcWOckCYMyrNJCIYP5z1ys8TA=;
 b=gRQK3gvJnM8sYhCCl/W01/kHyvzIUa2Me/9I4DfXs6+ALkfx2+EnX4MeJEvGokiEV6
 2KN61HEZ63D1kC66zzMSglhRxrt50BySwwcoZf+7WF+ZUDTIksQ07pPiv3rdAtoQFFjX
 IBPqzIUxu9m4VUoDirmHEXpMR3z9CnvkZ6Rg9CdDaVON9devgi79hj5olrmzi/791wkz
 3Hq/yWQUDKNKkD35znhfmE3ZXZ7rXUJPfbjuML1/fxCe/Q32XRLg4vu0AbGaVDQvwQL3
 YVwxioYBYxLGBkBC3MwLifSqHbq8/QRsyNmffZdLiL5ZueO350dx5H9kxGGMq2onrN6x
 lugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732715374; x=1733320174;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjfACckMsQ0RDEAnMAJcWOckCYMyrNJCIYP5z1ys8TA=;
 b=wr1ynON4pe1aCQDkxXxwnCZ6kEh36FYZY6VKF1mbaPOb75w+Q93T4f7VDuB3oXndY6
 ggpHOCCrtMII90FFTU5/sPcf2+r2t+q7XvY5cbUKB/Zz3m2HUzbtnthSHRmpzfrxHqas
 cNIO05QZXSHSlr3t/tcC2l2j3xmQd4/JRmTjM/59YVZDgdFWw2rh28knBAHcYv+8d26O
 VnKQUwu6slcxYxwTQ+y6myaJa3Q03/ozIgnuyPpGKqNJcss6VauiR+TwkK8Yr3GNuumg
 rh5E+bU/5jOLgK//sgodo38S5IGhxev3+gtTZi8T/QkvnrCAM7K/9ZAc31U5S8tG4MQY
 MnWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb5Z+PLHISVJRi5B/koXnTOpGT7jUD93aw/PIFEwNwmjHNfrXqQG6c1oOtlcvEvPMR4bQDF40Sjsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGynYO9So4I9ApjQo32oMTnYwhQLb61gYXwsFuezzRm4/AhnFI
 yl0YIoN/KWY8+XvJ61odxI8rIypMGk9KF5eMTyDAJt3iWR57kyb3+gwwQ/FWseg=
X-Gm-Gg: ASbGncupKTe2zC8+d3JqtCwwxxq0g4M8JIPbN7A2nfYw3iFaMe+DHd12KPR/F3/b/IX
 w5eIoDDxPfeV+1nx2q2HQHpaOejJk30Kk6+gcKhXB1urkaUG3C6HrMb6SjxBqtESw8ZJ8tuR9Fn
 ZQddnhaI+xWOP5rmXIWGdxApx2qC8M5XXVo9qyxNYXy/zaUQ/MPhYyOxHZZznYqbbmF/i5FTCr3
 2a9TmVVfZlaxsjrGJsntBBGUCRjZ58OKOza9gPxg4PqqTq/eHUE+MsQAIVBWXQ3dG8dMRX2AKui
 ShZ1SSSRgKc4RWUKEPaLr9B45C0orA==
X-Google-Smtp-Source: AGHT+IFxQkhy+KuEro7ZMNIqjxBcDKQk66j1eoYtbfEaE+Xo2Ghx/5z0Ju7Gw0TpK1R+/8bJQWa42w==
X-Received: by 2002:a05:6512:4012:b0:539:f7ba:c982 with SMTP id
 2adb3069b0e04-53df00de5aamr1541730e87.33.1732715373671; 
 Wed, 27 Nov 2024 05:49:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53de0c3ce8bsm1323963e87.116.2024.11.27.05.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:49:32 -0800 (PST)
Date: Wed, 27 Nov 2024 15:49:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add QCS8300 support
Message-ID: <f5kqdxkhniwwxu6wm2q323vvlsfn3yyig7mfg3h5ctqo7jjxc7@7g32tirseuqs>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127-mdss_qcs8300-v1-4-29b2c3ee95b8@quicinc.com>
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

On Wed, Nov 27, 2024 at 03:05:04PM +0800, Yongxing Mou wrote:
> Add definitions for the display hardware used on the
> Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_8_4_qcs8300.h    | 485 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 488 insertions(+)
> 
> 

NAK, there is no need for this.


-- 
With best wishes
Dmitry
