Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66791383E
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 08:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5B10E0D1;
	Sun, 23 Jun 2024 06:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uqL+ADuQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694D910E0BA
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 06:01:19 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso3965158e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 23:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719122477; x=1719727277; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oO/yeKrqlD6AMd5wV3WFZIiC2wA8T5SaNuGSHMCz+LM=;
 b=uqL+ADuQLRWAW/fHn8SsMZheVrVRdZxqBZS1jLU6fuSA5acGKhweSWO/MQe70tUKz5
 nZRbe3FfmsI9PKKrHAQUjyu2dVsZYpd5fMQ9jGnUC0YcBMEhbjmaoBliXvT/Qc3R7p3n
 7mAc76IC78GWcIgo/a97xuj+CYtPy8LcxbkD2AoLA6c3JY6/9KyKKkJvCD+BiHVqFmPy
 +VDmsxrJknnatrlw+qBIyCy91JftVJ3huRv/OkybootlCGWVa5SXRQtprL1PKiLsLAJ7
 4Im+YsZjgXf5v9qxwxT2no+L6fN4D/m079iwkzJ1mQb7yW/Ag8uzxee5Ai8EyQ71XgQ8
 vW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719122477; x=1719727277;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oO/yeKrqlD6AMd5wV3WFZIiC2wA8T5SaNuGSHMCz+LM=;
 b=EylRP7WkTC0Suo5LU5eq4eXk4tZ1KdzcMe0uEgKNvkbIPxcCuB9mDGnK00/sGTgBUs
 0wDh3u8ktL3Y1YKAYTPOtLkjxOijvGB+o0s8EFXX8UjosnkIgPJsf3I9C83rdwdmkyc+
 kbr06I8V0wjunBAdG9mOLP7/n4LvBL1S0rWeAOZqtXNECapPZ7WCIclRd9X3eh8/qgOy
 DjIwaT6dmWo7QtFBC8BC61lCUOO1pOGrGSZiGqBTejGNSd+4a0o8FfD3tFAiiQxKHDJN
 oOs8/IfpheyZSDPE9igRFNyZLBRCMPNRh3W6Ge2SgR28h2ThkxgREUa0LXvHDySkFVFA
 ecsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+sQtAy//hzRYuBa50WyoWXl6/vIg1qHH4bzocrDU9JiWcmwKdm6h1Bl7GMGuR3iGp0PZtJhyDxaWaYpf6RP9zOKsHo20OUz41WUSfPFB2
X-Gm-Message-State: AOJu0Yz19I6vqeLad0EeTjbgS6fFQH5vHtjeLkYDWRux9cbhBPOScs0L
 dzEnZlzzOJore8Ua+LSf141LpIvdM1SuFrKEVS8yuIFIcEBKJ9ODqUUnSll7P4A=
X-Google-Smtp-Source: AGHT+IFPlO6IKb2eGiTUnC9Nkv6WxHGRszGQWaUUwUdgPx1JDS5kmDVtdDq+1Ch5metEWw5+VYTjtw==
X-Received: by 2002:a19:4312:0:b0:52b:e800:25d8 with SMTP id
 2adb3069b0e04-52ce183559fmr598972e87.25.1719122477496; 
 Sat, 22 Jun 2024 23:01:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce17c3821sm162388e87.241.2024.06.22.23.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 23:01:17 -0700 (PDT)
Date: Sun, 23 Jun 2024 09:01:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/dsi: Add phy configuration for MSM8937
Message-ID: <hmgnm7xgrf7bzae4wkfz3rvhmubprsa5qo3tydjq3vjhapj7wj@klsgm3tlkctg>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
 <20240623-dsi-v1-4-4ab560eb5bd9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240623-dsi-v1-4-4ab560eb5bd9@gmail.com>
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

On Sun, Jun 23, 2024 at 01:25:54AM GMT, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> Add phy configuration for 28nm dsi phy found on MSM8937 SoC. Only
> difference from existing msm8916 configuration is number of phy
> and io_start addresses.
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 18 ++++++++++++++++++
>  3 files changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
