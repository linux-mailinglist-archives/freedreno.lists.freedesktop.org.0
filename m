Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2D5887A8
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 09:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBDE11A440;
	Wed,  3 Aug 2022 07:01:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5273F11A4AD
 for <freedreno@lists.freedesktop.org>; Wed,  3 Aug 2022 07:01:17 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id r14so17987523ljp.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 00:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=6iA1iDDg2wT5L45f8xQzKm/33un6F5eze6/xZZLONzc=;
 b=LkvUnyrn95oArIe+LqyBPWpm1Tt2+ZtXN95srDZ5S+5JY8SHMNFCerf6bdm4APJdn6
 pkJKDqEuHtWTkYZikpsKLdLZMI3efKjCne42dk/2e8BoavLopWbtWPcWkepqIG+FNaVx
 PUeKEZEz+dUPctCW73YN2EegSF+mACNF2p8RL+wXldyT9iUEVHK6baWiqjsg2wk4kpo7
 ISKUm5jCmT9QM+8c0lca0bzNeZqvKaY95u3FVnNWawRL6ViswAhd2UDHVVMO3ILYeXip
 gWXQY9ROaAm7zs/4Rl0dspJ+EIFeUBrQewxwxcOAQquWoukUL+ok3egO167EgYiTnPDF
 OOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6iA1iDDg2wT5L45f8xQzKm/33un6F5eze6/xZZLONzc=;
 b=REegwbLx+Dn99uaGDkQ8o3bRlWq4wqTEcJRcSJrVYOuCdUyorBgnS0TYaaRT9bVJ2U
 6crkJJF5a0wVcM6vnlmAYxu90Ug7sY0wpZAWxB9DuEvuGUKzelOAlQAD8M+L6aSuN5kE
 6O04kH4nVr9GNudKg94B9oGeF0RhGGxiIWTlsJX+oGIsKxijf53pTQiXYMjxsPNEAXd3
 wHNdhjUjZU+YX8JFxwuhpNemPcJSQXfvGLJgf7WgxrxMgDzCNPz83KFKfcILdiEJKKBo
 +5zYuTMtHuPRQDIYEng4rsiOdzzamK1sGYBgFQBJDQ5Cy8RmvqKWauCvL9nYLXkxCSyV
 ViWw==
X-Gm-Message-State: AJIora/wAADxJKvZxT4mlzXyhzV8rIbJbT2QIaVZ6NIBD0vn/19qEp66
 Kycqhjg/laQN2y62C4NW3PBgGA==
X-Google-Smtp-Source: AGRyM1s5IdB0FWkmOIReBn0TOtbL6cM9VogND3jzcIcT1PiaxHFmSz63MP1zi2G7w0ZRDn/hAlW+kg==
X-Received: by 2002:a05:651c:1584:b0:25d:c6ad:6237 with SMTP id
 h4-20020a05651c158400b0025dc6ad6237mr7395214ljq.509.1659510075506; 
 Wed, 03 Aug 2022 00:01:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f34-20020a0565123b2200b0048ad13756dcsm2118746lfv.223.2022.08.03.00.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 00:01:15 -0700 (PDT)
Message-ID: <6723fb49-4768-c40b-0d00-6be594adccf0@linaro.org>
Date: Wed, 3 Aug 2022 10:01:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220802153434.v3.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/6] drm/msm/dsi: Fix number of
 regulators for msm8996_dsi_cfg
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
Cc: Sean Paul <sean@poorly.run>, Archit Taneja <architt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/08/2022 01:37, Douglas Anderson wrote:
> 3 regulators are specified listed but the number 2 is specified. Fix
> it.
> 
> Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - ("Fix number of regulators for msm8996_dsi_cfg") new for v2.
> 
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 2c23324a2296..02000a7b7a18 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -109,7 +109,7 @@ static const char * const dsi_8996_bus_clk_names[] = {
>   static const struct msm_dsi_config msm8996_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
>   	.reg_cfg = {
> -		.num = 2,
> +		.num = 3,
>   		.regs = {
>   			{"vdda", 18160, 1 },	/* 1.25 V */
>   			{"vcca", 17000, 32 },	/* 0.925 V */


-- 
With best wishes
Dmitry
