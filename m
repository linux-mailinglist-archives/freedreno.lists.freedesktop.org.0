Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F157BB675
	for <lists+freedreno@lfdr.de>; Fri,  6 Oct 2023 13:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618E610E0D0;
	Fri,  6 Oct 2023 11:31:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED39A10E105
 for <freedreno@lists.freedesktop.org>; Fri,  6 Oct 2023 11:31:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c131ddfc95so24621241fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Oct 2023 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696591909; x=1697196709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a0TWF593bNTpaB3Tqqlr8JM3XLOkBPwK4clHQVWNSyM=;
 b=qwcmelSFydiMcNQjtE0N5F5b/2sRPCjWCLnLrRpKxUK1u1UKZv+bqiqYORlFdeLGC2
 3a1ZB0t/wCOTq1oOYon3pguezG+QqKeDtV3X0hGAs4pLfsBAWw7zAQPj5dAosd0D5+pV
 Owdj5wgTiVU7nJQ4gIIovDhkmNqJ41siU148kPSInaJ9bDGwx4yb/TSqhizFMUA8oJiY
 OZAorK7OMnn0xHxgKjYPcQ/HDWLttDqhuSKzgqoX5Gl6kE7p+89Ea7Yqp21eBMZ8QDk+
 DpfV1HOkafCqZUwnvYWZCJFH13FwHeyTgNqOLnfVLLxNNLdTR1b2tOokRrvRIwgvT6Sl
 +BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696591909; x=1697196709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0TWF593bNTpaB3Tqqlr8JM3XLOkBPwK4clHQVWNSyM=;
 b=TmbkkfoIrkho/8OjwtXA2K9h6jyM1aNSHraxvJnZat9NmjkS6eZa6kkY1m//EiUhfD
 O2PJNJIAQozjcnRhdK4kJOo2eMDDf6JQaN1T8IOuwT689JyVFBxivAUI/SBdDAuEe2V1
 O0iqozKTeW6CDVeBejZKPFu9Kl10vlVgJ+bjHh+8WuC50lK7oA70A9SgpF7OAOLEnDcX
 YgjXX8Uryrn/3wTD1vXO6a7Mj6TZXVk5Rl+WpdYtYIbF3RVDHZFwnFP9mzreASkrewcQ
 1IJUxKSX3ufQw+xIgcMPzm7BoIpT99f2YfFYB7ye+LZaceiJb4CBqd6sxj0B/n0HfHlt
 dy2w==
X-Gm-Message-State: AOJu0Yw50iCBAt9gHufxpWgO+ThqvFLBSNStjzazrNqUJQltzrK41scl
 nutadAYdHMDIlLQYzF+l1QypIQ==
X-Google-Smtp-Source: AGHT+IEgFCEHn504tuKBVWYl0xhU1uiPtRBx27WqGJbL9nyuJRS1cbMMw8HuP1zpHgEZaEYk0xzkcg==
X-Received: by 2002:a2e:8256:0:b0:2b6:e958:5700 with SMTP id
 j22-20020a2e8256000000b002b6e9585700mr6751826ljh.4.1696591909007; 
 Fri, 06 Oct 2023 04:31:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a2e9946000000b002bce3123639sm743777ljj.98.2023.10.06.04.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 04:31:48 -0700 (PDT)
Message-ID: <dce265a6-12af-4374-a156-7bceffd5e2ea@linaro.org>
Date: Fri, 6 Oct 2023 14:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1696436821-14261-1-git-send-email-quic_khsieh@quicinc.com>
 <1696436821-14261-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696436821-14261-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 2/7] drm/msm/dp: rename is_connected with
 link_ready
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/10/2023 19:26, Kuogee Hsieh wrote:
> The is_connected flag is set to true after DP mainlink successfully
> finishes link training to enter into ST_MAINLINK_READY state rather
> than being set after the DP dongle is connected. Rename the
> is_connected flag with link_ready flag to match the state of DP
> driver's state machine.
> 
> Changes in v5:
> -- reworded commit text according to review comments from change #4
> 
> Changes in v4:
> -- reworded commit text
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>   drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 14 +++++++-------
>   3 files changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

