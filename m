Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B481B94534E
	for <lists+freedreno@lfdr.de>; Thu,  1 Aug 2024 21:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AA510E92B;
	Thu,  1 Aug 2024 19:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lQ9q+Lh5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C7C10E92A
 for <freedreno@lists.freedesktop.org>; Thu,  1 Aug 2024 19:25:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52efba36802so12065079e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 01 Aug 2024 12:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722540312; x=1723145112; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NrLSwEPusse/MuTuJW5ek+V6ugLF2Iclegua7zatll8=;
 b=lQ9q+Lh51orWwAvANDfq59hI/RChrELI8VdZo3GWr06mpAsPeV+jwlJaACvXoRsVfV
 rON6exMEp0t4X9nDs6lEF9rV0e3QkQlK9copdjnyzZE7TsmvdZnbpr/FmHzKCBY/do7k
 jKqb0dVqxRwAYUNoYoDqO0ySUffVEElNEjPbK9HRU9l6B0hlw66M/rWVApAB26+YGQZy
 8xTdm+ebwelEEXQSYDOI2d/rvzxGj/eaVA1IjoRuyO+rFo0nKdRXnDXZzLTJxIxLQJy4
 Z3ZAkB5nqWW0drtsQDbTT0qC7ParA0VY/WzavCS7xY13uf289j1L08+4fRT5ENV88ZZa
 Z5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722540312; x=1723145112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrLSwEPusse/MuTuJW5ek+V6ugLF2Iclegua7zatll8=;
 b=PSEGlZpQMbJm50YVmwud6EZUuA0Ej05ZYwcpYuEvBwvs4XK42+e+IWoT3eZyNcYccA
 FS9ayGN/czUfmKwGP3wEiHG/kY5z1iSGkwbK+dEQa5UvGoJnAXkxDKYE7QcEoYXpsLLD
 jFTQXNijBOj/vLFxLr0oTRA2n2T+Dj1AZiHxWsWQuOmlbpsDjkMzLKpRaCkYfcN8LcAS
 vNULTsGxDae6nqOVhjQ8EWn0+WTgjNRyWNqrFBkiXri6xLojVXO3rqzXo1ZZZEfboY3Q
 E4i64foMH58Tt2LbUwQ3lAe7R46ZD9J0kkcu8J8Uh1iYZBA07Yier0vKBy7IrrF8BwhV
 hqow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXga0Jx8LKq4WRwpCJUvbAi1RGWjriqbpSi9ufqyRCFZHmhgBRCu5tajYYbLqyopV+exk8aRdvQaL+3D8sduYNDAJSqr4kejsEprfMmKnBu
X-Gm-Message-State: AOJu0Yy6u0eoHXHlLbjFgKllyVMS50grLLq5H58vaTI6KUgjAZgGIIeG
 Da04Pz82W604Yxgz+3fa5K5Q7vopcrdMrYyVmXu41zwRb2/AYdXdn0NptkyajjWzcHdRIP2NKZ4
 Y
X-Google-Smtp-Source: AGHT+IHyvHO6F0PypSn/UmfAHe+RChPC8zWKCvyEdtI5ipmD0BkNJ+h95UKmnYJ0E129Lj7ff5XZnA==
X-Received: by 2002:a05:6512:a96:b0:52c:8c4d:f8d6 with SMTP id
 2adb3069b0e04-530bb39b0b0mr724584e87.45.1722540312231; 
 Thu, 01 Aug 2024 12:25:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba10fd9sm35859e87.99.2024.08.01.12.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 12:25:11 -0700 (PDT)
Date: Thu, 1 Aug 2024 22:25:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
Message-ID: <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
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

On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnabás Czémán wrote:
> This patch series add dpu support for MSM8996/MSM8953 devices.
> 
> Note, by default these platforms are still handled by the MDP5 driver
> unless the `msm.prefer_mdp5=false' parameter is provided.

Could you please provide a summary of features actually tested with the
DPU driver? Have you tested YUV output? Have you tested RGB planes?
Which LMs have you tested?

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Dmitry Baryshkov (1):
>       drm/msm/dpu: add support for MSM8953
> 
> Konrad Dybcio (1):
>       drm/msm/dpu: Add MSM8996 support
> 
>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++
>  .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    | 348 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 106 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   2 +
>  6 files changed, 678 insertions(+)
> ---
> base-commit: df9574a57d02b265322e77fb8628d4d33641dda9
> change-id: 20240528-dpu-msm8953-msm8996-5d0fb7e387b8
> 
> Best regards,
> -- 
> Barnabás Czémán <barnabas.czeman@mainlining.org>
> 

-- 
With best wishes
Dmitry
