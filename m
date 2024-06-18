Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BDD90C4EE
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 10:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EA010E5CA;
	Tue, 18 Jun 2024 08:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SEzi8WP8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3332910E5CA
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 08:28:43 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebd95f136bso58885881fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 01:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718699321; x=1719304121; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bYZjAGpgEt4oOgf7LT/jfEKyned/wQxFG9qSD5B+G2c=;
 b=SEzi8WP8UMKuUtA8MgrqrPzJxTGIc8hTsRnlUHpS1GpPZQy3m3SnLGERVbeEMvp67k
 EhhkL0GJ+V4cUSUMJ0SoLxkNryzY49Ohmfmt4NnotPzxuEUOQjIC2Zrha2vwiKuaDV8l
 V27Py7E/hF1/p10oevjFa3iRW6F2EEuk+Ee35WcLHzyLuGLFo6AuUIdbjiJMRLZQ+cql
 vTRZvhF3YnUCN2Vn1arDwLNrPpvJUuuf3/JtqSrjg4vbxPRE01qqSY1yJUKpqtpXL8Lt
 A70vGHO9umMyQfOSV8uK369Ck0v23TLykoabVZk0c8v3UCI2sijPhENz2Qf/am/57YGc
 X53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718699321; x=1719304121;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYZjAGpgEt4oOgf7LT/jfEKyned/wQxFG9qSD5B+G2c=;
 b=IDSg9IfXtD5k2FdEuCc3T/k9L+sC0SQ+sjfgPUUgtEsSo1TPI4J5zCuIizkHb20M9o
 AnQt7gi/Eaf6WDDRgegL4LNTebmR2p3zx5sRZ4pDXhjvEv/tI0SDtUvN/mlaa58BIUQm
 uY401dBc9klh/HdtpG58LJJcgDh6Aeg/qIXLwXCMk02IC9aPlC/KKjDOnPw44QozxLhs
 mI4VlLkVr+B3+YJyjwK0mpgkyQGTh6og0BhbnKDwg6+PjIR7gqke1Ao+O0RGiiiGeHfn
 m79fZIEiZ7j5d32+0cb1S0yop9HWFoMSLyTdiMRGW7tFsa7C6LoAdQYNgHSeaFJXIt8S
 TD7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6gLSQrBefJpw4nfb36mWUAEaMUMwGHw4wDD2oEaoCwkOAIoQyvuxmQcujVcqAcnrq7bFx8rh0pttFcSmP7m2WVH2stoyZGT7M9swBgsZf
X-Gm-Message-State: AOJu0YypSP1+k1Tu2oCD/EmdSJaH0/gZFKlSMLwjkGAjZdxpsT0Ajh/w
 Rw8UHgNnvAYPx+4+ivvIe6lMC/kh5z+pNyUAMGlfn8qhwHzqbHhUfCVC8Ojc9/8=
X-Google-Smtp-Source: AGHT+IEwq8nhRRqn9q5YxuzIXR5AcAtlRS1/gJNxZ9ufr0fPbu7ispovCsrRMZxqawaZ5SghogxRog==
X-Received: by 2002:a05:651c:b14:b0:2ec:f68:51d2 with SMTP id
 38308e7fff4ca-2ec0f685646mr85838011fa.11.1718699321178; 
 Tue, 18 Jun 2024 01:28:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7813dsm16388561fa.76.2024.06.18.01.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:28:40 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:28:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
Message-ID: <eob2zex45yckr2ufuq5deerpuiwhcyfpzxrqj56zoc3t7w4uye@kwvr23fxhvex>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-6-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:51:15PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 247 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 257 +---------------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   2 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  13 ++
>  4 files changed, 268 insertions(+), 251 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
