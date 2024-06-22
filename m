Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4491337B
	for <lists+freedreno@lfdr.de>; Sat, 22 Jun 2024 13:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9745A10E11C;
	Sat, 22 Jun 2024 11:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z1vGFHaL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9823510E112
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 11:46:28 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so3514582e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719056787; x=1719661587; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5GoKr5LpL8zxiF4e6rxCxrhmJRtxBtTG1Kl19ZojU+k=;
 b=Z1vGFHaL11Tc6XaeJVRPpYg4qYu3pmqZA1/2o8nHen8doiPC8G6tqWzV+0JifLRVaI
 CX/5leq+3e8CWcqsKeLHXAJYQiOXpZrisbq8t3sudkqJs9GbH0MF840VkNsts9aeFElq
 s8BiR5m457uyzBx8aquxWEOuegCPYEs+AIr4jjTMGEknnnhxYYMfGvMOrr5QAzOqzRUj
 3HkRFeySJEI/XHfBxh9AwKmdfiUdEYKNZlxzmDwgRsK3wdMMagFmK81bvR+5VBXDglfk
 8LWtpXjygLZ2xKsRLPNGN0rJyRv8CEFYTLFlsiTokam/HTfk0zDQ7gbOLw3OfD3MGzpj
 j+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719056787; x=1719661587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5GoKr5LpL8zxiF4e6rxCxrhmJRtxBtTG1Kl19ZojU+k=;
 b=hE8A+j0UIklJ1ngIX9cU6JhnanLFtorMR1zXqFwcAmCQDU4B+Xuwnh8W8+720bBtMg
 m5d1Nr54Rw32Wxu84LgyWinqDrbORMAUz9kk2KBnns8Ey8SWWCP3L6fM4ExU0QnKVMon
 mwLCsRr6mZk7TdUH1OW26lR85fTYG16PyBU1O5ZxTPjpIWcGEcJGuZAvieZqqV4cBIQF
 Ebx4H/J2gw+ZiIed6lFsqn1nMnK+wCGgvEe0fO/l1yqQctp79UO7fvIgx3P8tKceLNeF
 eUNJF8RtNQAfTKPxIUiZyqiPGMLi9mjoTWPTIqxqaK1G+lYNJmLwoWpLDDkqXexfKTPl
 vOXg==
X-Gm-Message-State: AOJu0YyMNZWuYdO+2wGBGhG+OG3X/uMTYhfAAm9haUWGMBweI/VE1APC
 Vx60pFhcM+sPFOP7/XSeq1K+T50RZqlFaW1lLQrtZE2WUlUoKFeerHotlc4ubDw=
X-Google-Smtp-Source: AGHT+IH3hl6/PlsSyEWBouIFziPH6NwxAF7HPfEv0Hgg9JU/r6Jt/4V5LhdGmq3eAU8V3lfRrusSAw==
X-Received: by 2002:a19:8c17:0:b0:52c:dd7d:3fd4 with SMTP id
 2adb3069b0e04-52ce061afadmr190528e87.25.1719056786599; 
 Sat, 22 Jun 2024 04:46:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce05e8512sm39826e87.254.2024.06.22.04.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 04:46:26 -0700 (PDT)
Date: Sat, 22 Jun 2024 14:46:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, dan.carpenter@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Message-ID: <3bbazi5xqwe3dvxyb42ghlzanwba5gvhhltnaqgl3tebzbzaxc@cqezq3xx2pzj>
References: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
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

On Thu, Jun 20, 2024 at 01:17:30PM GMT, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> changes in v2:
> 	- instead of adding more validity checks just drop the one for clear_pending_flush
> 	- update the documentation for clear_pending_flush() ctl op
> 	- update the commit text reflecting these changes
> 
> changes in v3:
> 	- simplify the documentation of clear_pending_flush
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h          | 3 ++-
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
