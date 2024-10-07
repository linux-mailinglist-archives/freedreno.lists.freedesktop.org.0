Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E452A992D00
	for <lists+freedreno@lfdr.de>; Mon,  7 Oct 2024 15:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD60110E390;
	Mon,  7 Oct 2024 13:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z9Ce8GHF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3115D10E357
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2024 13:19:10 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5398a26b64fso4262312e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 07 Oct 2024 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728307148; x=1728911948; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0xLf663k7Unb9yQSVk3+yd3X5tyISjr5HvAhl1UQ5jk=;
 b=Z9Ce8GHFHdHpRzSHLWuGQvH0LTPFc2tDSHYcZctWKi5QwovsygKJ73ANXwL0XrSSqY
 5RGUwT5lzdV0ICroB8Px8Ww71IwoRg17kBh+5bLcsfLAFQzwNh2NDopC2eHqgaXb0aOz
 PM/QgbqEJC+1PwiC/Yo6BmurMc0OSh67VfSLuIx09ip8QKk6lOsln2u/HQmgI/mIORZ7
 3mUUKSH/XaQGFU/HKOtkVBhKXR5MiewU202UFC8aWwiKocppVo4762xJhOkX0HVkD9OF
 28KIqkSXrV0a5y49ZTnB7jf3KztLsCGmDPPL/xls2UVpd3dQ8LxQ4E+SqeUtOZvSgtod
 nI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728307148; x=1728911948;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xLf663k7Unb9yQSVk3+yd3X5tyISjr5HvAhl1UQ5jk=;
 b=LZ9Tc5y68ZLaQ8DxOBvLF86jQzCrVG5H6hpHsLFHbQKf3dcbBjN9zig8fEiT0C1EVC
 1ExHo6OQnqzK+M7T5+0sLIqCRAlwlzGn7Xdj3xa7ULBu8NASJTns+0ar3YmDVkJaAUIA
 R+Oe39SuMcIDp84tSe1WU1C871GdCXo3YoJhZXVlkMcAAshrcph2Ha3t0zkv1Ert9i81
 cKFOCVQTeZOCHn6lk+uyqB/kx6G3gfE4WcSouiE38Cqi38hfE+c3YjC9970gz40GxSM8
 YVBwtI/rkXB2e7Sa2uX+s2J+siQBqMJaoGiRidUhYtHWq2g2yLWqrjNBA5rfXlyLeQpx
 SSHg==
X-Gm-Message-State: AOJu0YyyZCLT9I9eku7vwjpPcFXCNtKZ8XrZb5G9QV8vcm7w0Fshm6W2
 geE/Cr7a0diaaVozYlf5MbGakfLjTf8xdp2ts6P6UO0FMLAkf8XhAP6coAnWRw0TUhx1AnqM8Tx
 IISgm3Pie
X-Google-Smtp-Source: AGHT+IGYvxRBROgH87NQ+TOEw0fRmb9P07SdQ3NJxECmesIK4Eck3W4jA2bZJ7wyTSLJn8CYPOwSVw==
X-Received: by 2002:a05:6512:220d:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-539ab9f1187mr5089552e87.58.1728307148223; 
 Mon, 07 Oct 2024 06:19:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec847bsm840205e87.96.2024.10.07.06.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 06:19:07 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:19:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] drm/msm/dsi: fix 32-bit signed integer extension
 in pclk_rate calculation
Message-ID: <uuotcdtdnh7u6emjozmxicvdmaeztrdfa72bxl7w2elzanf3qc@2q4nip75flsx>
References: <20241007050157.26855-1-jonathan@marek.ca>
 <20241007050157.26855-2-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007050157.26855-2-jonathan@marek.ca>
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

On Mon, Oct 07, 2024 at 01:01:49AM GMT, Jonathan Marek wrote:
> When (mode->clock * 1000) is larger than (1<<31), int to unsigned long
> conversion will sign extend the int to 64 bits and the pclk_rate value
> will be incorrect.
> 
> Fix this by making the result of the multiplication unsigned.
> 
> Note that above (1<<32) would still be broken and require more changes, but
> its unlikely anyone will need that anytime soon.
> 
> Fixes: c4d8cfe516dc ("drm/msm/dsi: add implementation for helper functions")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
