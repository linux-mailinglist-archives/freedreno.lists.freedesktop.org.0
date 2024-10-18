Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D49A3DBB
	for <lists+freedreno@lfdr.de>; Fri, 18 Oct 2024 14:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F4D10E8F4;
	Fri, 18 Oct 2024 12:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GipXgTxY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72E510E8F5
 for <freedreno@lists.freedesktop.org>; Fri, 18 Oct 2024 12:02:28 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539f53973fdso1577994e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 18 Oct 2024 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729252947; x=1729857747; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vAbv6XsDmwAo2jyC998ue0W9E4DrCSE3SereVqz2R1I=;
 b=GipXgTxYknirQJdQHqz0fH35UD2KLh0X3l23+loBNqKJ5rJMpR9vSGooYvQBHojbyn
 mqf2UOunMu71seakPFatyZMAcHujr9AzU7AcsOk0zM0p2X9TpUfb0qSNSnctQqsDn0My
 HoDbmXi2qNEo98Eh10czvkNnWoXNZOowE+TGbIgP9eTrogvE74mSSqUWmpdlqXfYJt+x
 nIoETSG4Sbbe67qb+mTy9Y8xoOj0FLvuDVBQEevOT+Gqrj+Eg4pA31W+c9utwAyazmb5
 HHBbWtHtqDd1R8XLYFrWjmYGRPoDVSnE6/Q0J2WCJSlJ+6DcIAxTgETSH2sNFE+2OR4S
 Me4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729252947; x=1729857747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vAbv6XsDmwAo2jyC998ue0W9E4DrCSE3SereVqz2R1I=;
 b=lvn0v2vXUIbhqggFXaEAZ87sd1niAKusWkfKWqy+jFuI4ZbakyvtQdxRXWhZWGP/8W
 SAspzXwenM+70ISn48Sh3gJn2an4LJTMySPisP6IeOUH5kJYRdsVZDmX8pfJeoXgzZdM
 QiywSd5gO4DSawr3fT37FaGVTLAFgptaRxNjgeOojJKhXXim2oUrAqB/YqM1KOFczsWw
 wHNUBqiZiJsJFdRiB8IanVOmKJAU6Umr50zW/9bGTO4mY3WG2zmjGQZ7PWigUDyplXc0
 7YerkM+x5XPnnImx64rG1ypqObIGOCbH7Vm7hQl7SDmGcjsJ/4EUH6wyIU0ZFRnhl0Ru
 nEqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs6FeXyb97dy48oqRyGR2TJ2cMV3X6p8Mx132vflQ2gNksB8VZ+pToQibIPmU95WLMUumAOTraHWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZJqBTWDD9LZ8rsigKHZAOkrvcqVQJFLzx2PA9bucIsrm934Xr
 uPZ1tSFeZyrjPZ8RfdN4JxQ489zMO4LiEiyvEbbxpGJQv9gX4YoqU1XYkNE0g/4=
X-Google-Smtp-Source: AGHT+IHCFo+NNLfp0lSvn5YXtWignyK0C2gw+49g51E6ZF+fUhL3qAV0HflJP7w5Uvo/44V70tVY0Q==
X-Received: by 2002:a05:6512:124e:b0:539:a2e0:4e94 with SMTP id
 2adb3069b0e04-53a15b9f2f2mr578807e87.30.1729252946842; 
 Fri, 18 Oct 2024 05:02:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a152044a2sm202120e87.227.2024.10.18.05.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 05:02:26 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 robdclark@gmail.com, 
 sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
 marijn.suijten@somainline.org, airlied@gmail.com
Subject: Re: [PATCH] drm/msm/gpu: Check the status of registration to PM QoS
Message-ID: <dpwmookr5owd43efowmnoxbtbzstvezgczpbzwxb5rwu3h3zaf@luim5srcbo6f>
References: <20241018111811.3534385-1-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018111811.3534385-1-lukasz.luba@arm.com>
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

On Fri, Oct 18, 2024 at 12:18:11PM +0100, Lukasz Luba wrote:
> There is a need to check the returned value of the registration function.

Why?

> In case of returned error, print that and stop the init process.
> 
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
