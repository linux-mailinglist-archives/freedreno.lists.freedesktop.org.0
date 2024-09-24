Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE90984ED0
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 01:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B350B10E908;
	Tue, 24 Sep 2024 23:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m13HKBcc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C952110E90D
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 23:19:26 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f75428b9f8so80348481fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219965; x=1727824765; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SvU7Vx/LdaZKtGEV8daIjq0EBTdyjFTk7utGpIyOftg=;
 b=m13HKBccThpv6L70wdeBWEgLG6hOAMPbGj9GxNe49AjLGylctUvetxrQjxgSdeatqT
 90EFZNdKuYA1AP7Nxwr34YBRabN013qmszE0jDnhqhav1AfQqzKYsR56Qdeg6KhY7Zhu
 PIKe2nqmZdBr+MBLEVyst3O+ub/VOMJuz0iXuxqS1baOEgmXU3alGrrlTBBvOphYUC7U
 U+IFGw++KB0/BSM3+jEmtFhxcRkBi6XarhSVHPfcsB9SJJ5rIh0X9ugDJhQaOaK4eWNQ
 2gWKlYP+gonra/9e1uL3U2++WGKrHgK0WCXvFeRO91nuS1MzC+b3iIbSiVcFU+MFJ6Td
 oWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219965; x=1727824765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvU7Vx/LdaZKtGEV8daIjq0EBTdyjFTk7utGpIyOftg=;
 b=P5uE4Cly4t6kGWxtkehu15tilvwVZW9f7MOL57W4ZV2i2cKi+mpWNyply4NjpVkGEp
 sjJWX2J/aRD+FlvvYX3RtkGCV35ozAnVEP7yGQXKTFdkHUt/vzOSUJnozgH4eoa6A/zy
 iGApuFWVsw3SwkSJQUXZyWk3Fa0r0kDg2ZZ4uaSKZXmQYr+XQQEXx28QXY4GGlf1PWaV
 bOS8qff3o/xzlzhenJItqkBbIJFZSyngQMl42lV/NwrmhQznYX7JMFnn6iPNtsBIuqUB
 v/QHBsX/ydLZ10RG2fmDOuluuGO/2BL6Lc9f3x9UJMNGa75VaR5Ld1ofJe/04eHgYsvV
 wd2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVTtLYM2+Dqgx4no7n5Y6yIAYnzDTXVopDGVdBwP51DKSbHRQTtTLJKfbAGuNC9GO+blIreMVI5IA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzo9LAjeTreqvymI7nkgBH/Q3lczu0wGgSGq6ZN0i2xc9LQdGBD
 n9soo+vtrPUnOpHtLERsFPvgOdt+W1xGN/TFNwIaeAlzsWDEF3WRO3KRWqEOP58=
X-Google-Smtp-Source: AGHT+IH0klG/CcfMRjXMdFbReF7bhlWRSCeWv4kqKqNH0sL3opOyR4yRKdhF285Ci/EQb6g7QrSjmQ==
X-Received: by 2002:a05:651c:1991:b0:2f7:562d:cb6c with SMTP id
 38308e7fff4ca-2f915fc0a2dmr8141701fa.2.1727219964875; 
 Tue, 24 Sep 2024 16:19:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d283b86fsm3519751fa.30.2024.09.24.16.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:19:24 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:19:22 +0300
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
Subject: Re: [PATCH v2 10/22] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB
 block
Message-ID: <sm7uvwkkir4oj3n3wdaadcfoufh3cktn7gvax6grqma2amhxxc@w3ahhlj3x3jt>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-10-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-10-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:26PM GMT, Jessica Zhang wrote:
> The CWB mux has its own registers and set of operations. Add dpu_hw_cwb
> abstraction to allow driver to configure the CWB mux.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c  | 73 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h  | 70 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 +-
>  4 files changed, 148 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
