Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2D9992CE9
	for <lists+freedreno@lfdr.de>; Mon,  7 Oct 2024 15:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70ED10E1FE;
	Mon,  7 Oct 2024 13:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IJFQB0AM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8310E1FE
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2024 13:17:01 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539908f238fso4832658e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 07 Oct 2024 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728307020; x=1728911820; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+pWYExryHfEOHSZj+Ne8AORcHVOO1VxvRGvUXHt9asg=;
 b=IJFQB0AMfoa40CYQjsoMs3rL0+NNN5BmCgwknf9QggY1LV3dfb0w5BFmxMcI4af/gz
 Uro/406ANjfzax0T4LFnX2MciUrnuZSbC+pWlBbLfzMNT6fIWoZqdg9/h8I0FmNewN1m
 DXfvKQWr7diILwwrO1fHmMCNbpOde0u4ouhpu6/8Cxm+T1NfcPUro1IxwQL9kRER49Gb
 rB6zZ/6DMUeDldmnd6LwHMYQaWKCqyTvG0zcvz7XoPG5CysV1UVPgjZ5m4398mJZd4Dt
 y3Ma8k84vfS74qBMflRzAyCr2dkTy9egNzdTdECzMt27SniRD89OGnkyloi/2BafdqmW
 dYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728307020; x=1728911820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pWYExryHfEOHSZj+Ne8AORcHVOO1VxvRGvUXHt9asg=;
 b=R16pg2Si6xf/JbdqYj8CdWtgYxtaz9i2PzDJxgLGBQ9HyuOeraUr8LMWXoeb1guUpf
 8JpvHm9FgigQSWi8kwoI/SGdonX86dWdzsMaw6DW48qRNHgrehZKWucQLw5IR3/mN4Sk
 or7Akt459bt2u2eVQ5UNK36lf54NGdqXFQwNG/1Z68QROVj/XCHg5IyFQ4g3RiM+zxVJ
 sczZ76XK/qB9BRipuQMUWzrP4F9acQaqY0noO13oHTZwmCGHBJa7moFVsKZN1XQjnn26
 cTfHpgEffTWltWlDDwtMTfDsuID6IioA956/33wLioM8KYhR0v4Y/5tvUbyPLa4+HDKz
 GkYg==
X-Gm-Message-State: AOJu0YwYw2Ilf/4I6GNyt9WtJI5MnJcVUwQJ/xU4Sqb3juFoeWWnZIND
 LCrAHle4BcnFPENYrO4ruxVYtQXwm134VHwIYt/PxJ4yGph8Vc+vcchgT3M5ljs=
X-Google-Smtp-Source: AGHT+IF5Z5M06yNJGCi1ez/Gx/T8VjldzZqMCqhBqFS3zMMX19PR8zfmRYYeTqG1usnU6bJUYarfKQ==
X-Received: by 2002:a05:6512:3c9b:b0:539:9155:e8d4 with SMTP id
 2adb3069b0e04-539ab862530mr4922913e87.8.1728307019585; 
 Mon, 07 Oct 2024 06:16:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec157asm851578e87.58.2024.10.07.06.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 06:16:58 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:16:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Message-ID: <gd3bevkbevqqn54xq54dfc5imq3koc7ggudkila7jxgaxcluvz@5mkw2ra6pgoh>
References: <20241007050157.26855-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007050157.26855-1-jonathan@marek.ca>
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

On Mon, Oct 07, 2024 at 01:01:48AM GMT, Jonathan Marek wrote:
> drm_mode_vrefresh() can introduce a large rounding error, avoid it.
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
