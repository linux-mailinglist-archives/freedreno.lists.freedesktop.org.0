Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E42F8FC36B
	for <lists+freedreno@lfdr.de>; Wed,  5 Jun 2024 08:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796CC10E6A0;
	Wed,  5 Jun 2024 06:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RJBPwjrj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B390C10E6A0
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jun 2024 06:29:22 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52b90038cf7so5341225e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 23:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717568960; x=1718173760; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RJ/23iqkxXhCu+0zyqHfXdCfh5GsXoO3Ru5EztY6RCw=;
 b=RJBPwjrjCyT/R/QKzRle2KDz0gB4dCuRtHdvAsNhkarK/zFP5QG9jo+CU+dys3JAYC
 eMv8lnFOCN/0zqGNrTzpIqJ9kUaGMBwvt+B2eFfiH7Q4U1J8/ISsPCCQr1biTiHfrH2O
 sFlEKWNOUTaEhV6Tdt2anJLYgL00+3NbWKl0JNzGN7N+YJtakU3kjJBDWbzO6BGxAoUr
 OpvqK4fF9z60xGVy8SwXbPgfl5O4r38dHW8lXnGiGmm8Q81yEUrWp+Rn2/tTxXN4Fu+0
 HpvEn7LHyGPkyqG2Wc3/o+CgkhS57WjfJptcvu4MuUgEWDG2n4iDdzSq+mh29uoxmW9c
 KaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717568960; x=1718173760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJ/23iqkxXhCu+0zyqHfXdCfh5GsXoO3Ru5EztY6RCw=;
 b=urmm9poIFHAhB0qKq6Flp07Dp6hQSgOv/UrImAYAeEp3RA4CHpEfMNrMJUiCzDuB4j
 HCvvIYybNAZCMOpNc+LR4K6b7dxW6G/A99EVyU3vRKcQO5lTXGCB995a+n52Q4MooLxk
 RYxEHLs7+d5qvX+Vb2fiEttC0T9kAj57aGq9oPbJZqMsu1xVXah1gd9r17tc1iLusttQ
 GLqfFbAt8rC+CZwOt0NYGyqSM/5ufoZOzt6h47uB+qqAtljZ9qL8ZHGC9RsI4x59TW4R
 j090y+7MCjShU0M7yEz7eoQola23Iat+eq+V0wds5b/Cd7NrkIqNepG49JM6em3hN4NT
 UMgg==
X-Gm-Message-State: AOJu0YxCUVHSpU6deWPABVeOD9mLugXjt64THkyNMQ6gpdros2KAID8d
 wfXblY3LHkSVdRo9XhFQX/Fw+WyDmTjWhPh0T34pI4mhMLFesY0b3+KZDwG1jUM=
X-Google-Smtp-Source: AGHT+IEMB9B/0I44cfP8n6kV1HLDOy5FxC94CDo+3545zQnZBjIiD9D2HCEXMElemi0yaQa7rQDptg==
X-Received: by 2002:a05:6512:3056:b0:52b:7945:a434 with SMTP id
 2adb3069b0e04-52bab4bd908mr1013426e87.28.1717568960298; 
 Tue, 04 Jun 2024 23:29:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b97a15436sm943344e87.96.2024.06.04.23.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 23:29:19 -0700 (PDT)
Date: Wed, 5 Jun 2024 09:29:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Connor Abbott <cwabbott0@gmail.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/a6xx: use __unused__ to fix compiler warnings
 for gen7_* includes
Message-ID: <zgg52ydg2w4gxgmsfwte5houkns3rikdfz375oty6bappf5eud@gekg6ynavdpv>
References: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>
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

On Tue, Jun 04, 2024 at 05:38:28PM -0700, Abhinav Kumar wrote:
> GCC diagnostic pragma method throws below warnings in some of the versions
> 
> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown
> option after '#pragma GCC diagnostic' kind [-Wpragmas]
>   #pragma GCC diagnostic ignored "-Wunused-const-variable"
>           ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning:
> 'gen7_0_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_0_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning:
> 'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_2_0_external_core_regs[] = {
>                     ^
> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning:
> 'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
>   static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
>                                             ^
> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning:
> 'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
>   static const u32 *gen7_9_0_external_core_regs[] = {
> 
> Remove GCC version dependency by using __unused__ for the unused gen7_* includes.
> 
> Changes in v2:
> 	- Fix the warnings in the commit text
> 	- Use __attribute((__unused__)) instead of local assignment
> 
> changes in v3:
> 	- drop the Link from the auto add
> 
> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
