Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDFE6920AC
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 15:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AE110ED39;
	Fri, 10 Feb 2023 14:19:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F5A10ED2B
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 14:19:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id ba1so5213841wrb.5
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1uTFfmvobksvpoGMelQsFMa0FYBiyHzYPIzwFP1iQCw=;
 b=OTFNGu03iKhaysy/pY/1pl3FPBrTNkjUm6x5Sb/3sRJoxAE76OhyP0zP72fc2EtuOd
 XJFePkwrYGy1yhpPYo7IsuNsHrqFTjin4aNNlpKZUIjYlmmI/UY/bJZV2UxN7iUGgLz5
 8sUBB27Z7UZuzcsC4Ff9TyKOL/Lrrmj04YlIISU2RmoEXhJeTvWYAE9Hx3Fgk7K4Af7/
 oOZ06FWW0NIdNCmw5fwGEDjItE1OSgZRAsyGeH2KUAUAnoeODq3E76ajy18qIckAkKsr
 QMkByf81kU5S5vctaL5a5IAqkLmZepYEIedIdC7nPgcdaS75KzwO5STeMF6YlmXxDJ5y
 9B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1uTFfmvobksvpoGMelQsFMa0FYBiyHzYPIzwFP1iQCw=;
 b=20vfh6+95oUmlH253iYFJTMXBNXHp+P+wxze2erTXILXzQNVHCHYgfAwcijvxeOfav
 MNla92Bixq7/N8KAqpu5fK0F5I5RHAyY/sylvExPkaD0pkxi4DWkJDBIF0xFOkMvR8CB
 /JtcxtC8cJEnXQ9qCvLcZqQEH1EVB5qaNxrF/uAYeQFQ/1d7X4yZSOEsC7AxJXBhJHZT
 ezmBttPXFOpVjPB8vV5XsCOqdOz07Wmpdi6sB1qa1ud83RNA/AUs+lSDG43tr+T9QW9g
 f5dj44NYfQJF5UL0F5zRrvXTk3KmMi3zXsW9U+0Ocgm7NNYj4TvNA7Ez7kO2Cynsh44j
 x8Fw==
X-Gm-Message-State: AO0yUKWoHc7aPgydkTUsoFS9dwm0TLZrsQwms/FYNTqrQMA0EpGPV09S
 /UNeDpnasQ4xwnu9851TWVvDPw==
X-Google-Smtp-Source: AK7set8E+f+ZV83w6B4IZTO9iq19ePvcHokwop+CDn+zBqZ/sctxhXM7i0ujcsYzlSt9Utc2g5ywwQ==
X-Received: by 2002:a5d:464b:0:b0:2c3:f8b6:666b with SMTP id
 j11-20020a5d464b000000b002c3f8b6666bmr4591136wrs.26.1676038748717; 
 Fri, 10 Feb 2023 06:19:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027?
 ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b002c54c92e125sm584454wrq.46.2023.02.10.06.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 06:19:08 -0800 (PST)
Message-ID: <63ea4f1a-a9be-eef7-bfe9-acb5567b4107@linaro.org>
Date: Fri, 10 Feb 2023 15:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED
 for sc8280xp
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2023 15:15, Dmitry Baryshkov wrote:
> The SC8280XP also has a black hole at the top of MDP_TOP region. Set
> corresponding bit to disable access to that region.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 3fa202da62fb..f792275dc48f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -743,7 +743,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>   	{
>   	.name = "top_0", .id = MDP_TOP,
>   	.base = 0x0, .len = 0x494,
> -	.features = 0,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
>   	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
