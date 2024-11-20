Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 484409D39BD
	for <lists+freedreno@lfdr.de>; Wed, 20 Nov 2024 12:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21FC10E71F;
	Wed, 20 Nov 2024 11:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ji+XOJPc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6917810E71D
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 11:44:21 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53d8c08cfc4so4326565e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732103059; x=1732707859; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9DRvXARQ1UdTvlDiFS+YRmTlgOqmMlEKwZDmn4BjfP0=;
 b=Ji+XOJPc9StNr/f6zStsW0wnFe4rO02y60gMUKFjIzG7uHf5vinYEdToU9SBXpbBbi
 +epQoOdnLmemeR5HixqR7U/z3b7MZaFuUZqa1KcmdD69ae9mMpOTK6JP0yr8P9t3hXGw
 MAeNqs5+9OaowpR7CmxnWBCfONGfp0Q7VWyIFuemmxW/vtOrDNFA37ytD6UAN5TOJnVK
 12YfKSg2LeKYzXYe2ZCzhO8GC8YtlNnIKBVsRFdtwcVZ5es/MVA+QNCI39OeYw7epmkM
 9pWVMjxOKvrEycxtpUQ9ZYz5riYBKEc0FgA+gmRVIWPa7ZmSNHvEK9wSt8t/XopyZzG4
 3M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732103059; x=1732707859;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9DRvXARQ1UdTvlDiFS+YRmTlgOqmMlEKwZDmn4BjfP0=;
 b=Ay+uDelWd59goldkDN7t1QLSPq/sWgCEXBxYWZ8disf4263SlfEpJjDhAZSm4rqBwM
 EvmeSk1OTaSf+tuwGtRBAU9DI31XQS5epf+iEhJMilhy7mfrvyMkd56baTvRfFU7+EUG
 rrn4kcOPcdYZK+kp7rwHZAUgqTWEAwpcFC+CDXCQRG9Vg9SNoek8Z6XNi0lb5ELaTCqY
 BSRwGjM/H/Ghps+eCOZlaTMyn+V3t6ow7V2b9rpWY3/rFKXtWpmvzk3gVrUKiTG4HUKT
 bsqNkfTPcs1FR/Mqh7G7KP3UeiGOkvyIjnU/AhRDgKrrLY80H3xJL/MnrWwOKDMQ6K6j
 jouQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrvxe2L4lzmgBvpLzmKJWursthaKzzR/hV/LbHJZ/WBwNv21fEn/Mh9iNRB2lDMujzYe6yccHsODM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7+yhVEZiKWcayUK+xijil2QS+1N5yLp8Q7OKVxB5LuaQTPsaO
 Y11x23VxejtdLJEE/LNvdur+b1Qq5f6ErReYnDvjZzmBq7D8nkML0ojOJSCS834=
X-Google-Smtp-Source: AGHT+IENehDPBicxK9JfxLgvExZQ3j1PXy75ftMbSZQj8HtpOt2sSHv8gorwetAxqzmU4d1aWMiGlA==
X-Received: by 2002:ac2:4551:0:b0:539:8bc6:694a with SMTP id
 2adb3069b0e04-53dc136aa08mr913736e87.43.1732103058604; 
 Wed, 20 Nov 2024 03:44:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbd47285fsm604802e87.225.2024.11.20.03.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:44:17 -0800 (PST)
Date: Wed, 20 Nov 2024 13:44:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 07/11] drm/msm: adreno: find bandwidth index of OPP
 and set it along freq index
Message-ID: <xm2pic3yixhlsktaqnux7uvoxbxpvcmkcurylydifbqpx24x4i@lj65uktyscdq>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-7-4deb87be2498@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-7-4deb87be2498@linaro.org>
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

On Tue, Nov 19, 2024 at 06:56:42PM +0100, Neil Armstrong wrote:
> The Adreno GMU Management Unit (GMU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, until now we left the OPP
> core scale the OPP bandwidth via the interconnect path.
> 
> In order to enable bandwidth voting via the GPU Management
> Unit (GMU), when an opp is set by devfreq we also look for
> the corresponding bandwidth index in the previously generated
> bw_table and pass this value along the frequency index to the GMU.
> 
> Since we now vote for all resources via the GMU, setting the OPP
> is no more needed, so we can completely skip calling
> dev_pm_opp_set_opp() in this situation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 17 +++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
