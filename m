Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D033984ECB
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 01:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C054510E905;
	Tue, 24 Sep 2024 23:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DKk+z7OW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2FE10E905
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 23:17:34 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f6580c2bbfso2961161fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 16:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219853; x=1727824653; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kbz0tfiyQQErgbHsvyLtv8eq56ZM6ZrFXgSGtiFWYMA=;
 b=DKk+z7OWeK1/E2sEEuPbviYnMdcUGV3t99dwsUHbdJTM1tPtz9haWcMh8TNVuZp601
 7DQbpfI6YGOjUvmg1JmYGCvdNCfkHTkfYCBaXxBcvrWzrpmNxz/6aKz4XYaqSyf9EIqR
 ZOxEw4a7lzPXxszfO2Mxatp/SpDtQ3lDX17bZquDIQNiJSKq0PufviC/x1XPYZujzqiB
 mtbdNfCXPt14Wu1ueYkGHJizTKC8cd0Vp0rRBNraeJslRcJ53+nvy2qUJ1P3lNF80XBI
 O5snjntvn5oYN21oyFlzbhWjN+NDC3dIOGA3gs3qDOESNfWGKFNyJEjc/UbGuM0asDtg
 Rg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219853; x=1727824653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kbz0tfiyQQErgbHsvyLtv8eq56ZM6ZrFXgSGtiFWYMA=;
 b=JCYEyIweoToFWGkGY195YQvYnadWHVDaNQnwPsSSYn5JR1WexH63/K7fKIjwXyDXop
 ORLGDkwZTDvnXy9wU8E9cG0gDia4U6DRJbLbIFLVV+JatXzdVfBC2NrrotIxbAR49LYP
 3DW7Rgq8SdgZLJZqa/5W1ObOGBB+JfhfBjXTuZh9hDp8RaVMvGzk0pS6ZY66Plqcj0lv
 MPdkLHHI5gtUwyKxfJ/EcMbQa73oQ5xJuUMHuf31jW8nLooBkGu7gdeDuXuAJxF8hOiU
 487VZJKp/UVTF+3o7LbmWHPlolTIJPOCFnWrvnBw/9ZDblvVhJVCTuTI4w9xh38X21m7
 7Hcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgHuxFVQLiudur3XwLci8d2TWRofjErOPcXKS2aVtHqfwK3MmCah1hWxzqV/XqUN1vL7atGtZVB2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUzdqZX9ZxPA/JQpEgQ9GWy6sv90pAinqlq8y3TgSX5tneDm98
 oR5y3YGGBOLPE5TZTOY3aurvWe7Yt2ih4qhloDDoCP3Ia9PlYbxRpCj4X9s+EvU=
X-Google-Smtp-Source: AGHT+IEsDQBs1xHo+RHBnCa4F/NIYf+HbT4i9F6SK/oR1mhFSOVGTHMoA9OotkQDZtlvONDTI/XaLA==
X-Received: by 2002:a2e:f11:0:b0:2f3:f1cf:5314 with SMTP id
 38308e7fff4ca-2f94d763343mr2025561fa.10.1727219852780; 
 Tue, 24 Sep 2024 16:17:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289ef2dsm3436881fa.124.2024.09.24.16.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:17:31 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:17:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 08/22] drm/msm/dpu: Specify dedicated CWB pingpong
 blocks
Message-ID: <l5lfx7psxi3xmkgu3woea55txan4ib7kmvaix3h5b7q3fz43nl@r7umftxolsgq>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-8-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-8-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:24PM GMT, Jessica Zhang wrote:
> Change pingpong index and names to distinguish between general use
> pingpong blocks and pingpong blocks dedicated for concurrent writeback
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 8 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 8 ++++----
>  5 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
