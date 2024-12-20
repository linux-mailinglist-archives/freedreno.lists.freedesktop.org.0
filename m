Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC36E9F8C22
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 06:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2AD10EEF1;
	Fri, 20 Dec 2024 05:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DXT1W3+O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1380D10EEF1
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 05:55:43 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-540201cfedbso1434349e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 21:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734674141; x=1735278941; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OJhpuoBbKLElyofoNozRR7fNdcqH/mOd7wB7B78IPAU=;
 b=DXT1W3+OuihnYT176GRHKv+xwRPBOLjvhaiEDKlfVVERt5RQpzmSWYWqHoxPQP852p
 ttN7HQW5OWLdDUB8HGEM6NRQMMQF4c1+Q8s09JGmFPYI2sT05J9obDP2hZDzgaIiJ9Ey
 C3uaAflbYSICr9yKL/eoIPb7ebrlpCFZH3edmNjA4jvyopRzTcJkBkTl5Ic6QAl/gzFw
 cgmLhJCWonViWcUTwAhq1hQ7rj+XIgrWEzvRnFzV4Va6p6Q8CECWSzUlvcSt2ufZVcPp
 z5an2/wlLiKMpX8vwUwfA5QzJ4sFn36pVrKyp4ynqG/HAEjgxwFTt++/U7Gpjy8NqOW5
 6MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734674141; x=1735278941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OJhpuoBbKLElyofoNozRR7fNdcqH/mOd7wB7B78IPAU=;
 b=CTQIrPFQGCweY59e1TYmpE/GMVglgqO0aKmx67zJ+H76ZZscEidkt4IybZzUyLOJei
 kOm9aF2dv9Jx68+S8FVgWM7654qFUf1BDKxRdowfsYseRHICQmhj6YaJgF3sP0VUmSVH
 m9xseu4DlHSjMwTKrZo0vCyDbmjWwCN9LoH+kyJMjrRMTf/A7lPtW0I1WMbMcH8xngyh
 39Cya/S9kHdaCn+005LEBaoL4KKJfxcb5DFF7VOG+VFkNbdI4hUz65WeC5QWfwljoWE/
 KHpc0Gjn9myseLgscun2Ibur+sAsRjGfsf9QSvk+lu/oU3VCh3uMoCzTDP+YFcczgu8L
 VADQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Y7D0CyakAS3/7HpuhJckiKb4+IJbjPTCTXah3fvSXOfeDn/L1xX1HuziWp9+YU9v/t6f/dfkwDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Sb6SBfsCzgT9Px+TdAJzjZuiglr1lH/ZsnOB6glUXMk3W+Ch
 g9sKuSpDf6usbBa4XUqZ9xHOIybEDNyCGuFQv6E6BeYNZ80UeoMZOjfNMn/obdQ=
X-Gm-Gg: ASbGncv3L0r4JMqt+suNdu1wMjZMewV5AsvJez9ehDjw9wXO5R4/stZiAEjZFpirrvw
 CWsx/zmEqFufXGIbSfjpGmIfrn17RPbxsqK6bNwX6mko1jCu4Iw28qcWlSAEMkSlFGl6xtPsXUG
 3+ITKsP2G2yO8dzuQmujjePkXivil34L+tGDHR+ZHsb8cUsuPQ2psDi1E08wxNCULCjH8QjYIuz
 oMcxUeLlWFtDuVtI56mw+MJmkuv9zrgOJgBGIKFPpemR41L9Tfwg5kMxXavg2qXbzQ0nYMP0TM0
 cd6Ye2caRqDYAydcUbZ3BAB/iQ/r6XHbHwKu
X-Google-Smtp-Source: AGHT+IETemAVTmQyZ9rbwPDBncgy1nlOXafMgvgGBZDfwJJZOMq7B3fJHMrkOYNfkHSOT4TqKqybDw==
X-Received: by 2002:a05:6512:350e:b0:542:2991:e984 with SMTP id
 2adb3069b0e04-5422991e989mr241894e87.9.1734674141403; 
 Thu, 19 Dec 2024 21:55:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f57sm386381e87.33.2024.12.19.21.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 21:55:41 -0800 (PST)
Date: Fri, 20 Dec 2024 07:55:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 19/25] drm/msm/dpu: Configure CWB in writeback encoder
Message-ID: <i6xj5p5jbn6hdu6uip5q3k4umz4b4daqmbwsgfuaw2guf23kjj@lkq42furh3sh>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-19-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-19-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:30PM -0800, Jessica Zhang wrote:
> Cache the CWB block mask in the DPU virtual encoder and configure CWB
> according to the CWB block mask within the writeback phys encoder
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 75 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  7 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
>  3 files changed, 83 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
