Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF46945EA
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 13:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEA710E5A4;
	Mon, 13 Feb 2023 12:35:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB710E5A0
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 12:35:33 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ml19so31620738ejb.0
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 04:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g6etP0PHoEzmwkAwU1sWyc/fLmfc1gwqL6wt4gHzdmw=;
 b=hnv0aANWv0LshJQhx6NxJdjMa9idzF2ChBnJpk4z4R8hie6sV8ZbP6dbf9ZIetFPYL
 7+21H4Ja7Kziwvjl7VrH3kNQxctWTHHf6OfVJJzWVOyWEMhlSCCTa2wfzjqHn1WtOfco
 /65cXuNQ29DgfUdbg2q7jJG/mInbyOAX9OIkUkWqu1ot08iOIzNTa9Vaos2j5ptJcGww
 Db0Z9soV9OGsUn8RIYthoo9d1Qj5EH5xO8JAqqHm647HGf2jUqtfosYyh0evnFO5cOzG
 +VrpB1B2iaiUatlxDG9tCiGOgGNxy0b78QGkBRSclusVBTs3vQqDv+M2cRT1ZxTBoExb
 kYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g6etP0PHoEzmwkAwU1sWyc/fLmfc1gwqL6wt4gHzdmw=;
 b=K2Ns8S1cv6Mky7n3r9Kkd/0G1aPZ0hU4c9w7cv7wbrz3ulckdB3BkV163VJml9izvw
 Dn/iJgSVLg3EveJikgRnQif2aS+ggyGPg7ojauXM1t5kxqsUZ9zd+QAvikWLQEplMbKE
 juo6immRbWrWRs1xXbVFXlmmtPixXzew+GI+VWIZIo76MJ49sDkCrKtppmwRNYZjRMt6
 YmqTcD+uqMyuTl9h89g3WOoku9NXAk5c54u0IBN7PwanbxshSuKE8T8NmrcUi2RtHwgm
 CrfWDpdCFFKi1ucQGOvPQ5EbA7tjiZlbsQAdCUrUnHQHLiDLBiPzapcSz/tNqiqKc/2A
 hEjg==
X-Gm-Message-State: AO0yUKWuMP/s9Zij8obWTEBzL4O8qqLE8Dc9Vm2Ol/nWagTmIqk5NRaT
 wQx1XlBJPLlwumfXw75hbXDyeg==
X-Google-Smtp-Source: AK7set/a4QxyKqE9KlCKpOjOcecOb57gmOGMtMJ0rcHamtTPFjtjef7xpvmMt4Hd8ptxbq3EdiB6DQ==
X-Received: by 2002:a17:906:5d9:b0:878:45e9:6f96 with SMTP id
 t25-20020a17090605d900b0087845e96f96mr24442385ejt.49.1676291732123; 
 Mon, 13 Feb 2023 04:35:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a17090673c500b0088aadc18b69sm6747375ejl.101.2023.02.13.04.35.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 04:35:31 -0800 (PST)
Message-ID: <8b8f61ea-8419-c4b5-0434-276d13fe3e39@linaro.org>
Date: Mon, 13 Feb 2023 14:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
 <20230213121012.1768296-4-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213121012.1768296-4-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/9] drm/msm/dsi: Fix DSI index detection
 when version clash occurs
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/02/2023 14:10, Konrad Dybcio wrote:
> Currently, we allow for MAX_DSI entries in io_start to facilitate for
> MAX_DSI number of DSI hosts at different addresses. The configuration
> is matched against the DSI CTRL hardware revision read back from the
> component. We need a way to resolve situations where multiple SoCs
> with different register maps may use the same version of DSI CTRL. In
> preparation to do so, make msm_dsi_config a 2d array where each entry
> represents a set of configurations adequate for a given SoC.
> 
> This is totally fine to do, as the only differentiating factors
> between same-version-different-SoCs configurations are the number of
> DSI hosts (1 or 2, at least as of today) and the set of base registers.
> The regulator setup is the same, because the DSI hardware is the same,
> regardless of the SoC it was implemented in.
> 
> In addition to that, update the matching logic such that it will loop
> over VARIANTS_MAX variants, making sure they are all taken into account.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 52 ++++++++++++++++++++++--------
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  5 ++-
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++---
>   3 files changed, 48 insertions(+), 19 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

