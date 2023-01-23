Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C2678ACD
	for <lists+freedreno@lfdr.de>; Mon, 23 Jan 2023 23:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2471D10E5AD;
	Mon, 23 Jan 2023 22:35:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922D710E5AD
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 22:34:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id tz11so34549647ejc.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 14:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YxnLY9crCokdRJwZ1cSyxopWXEnHeRFdvQXqwCq/JLg=;
 b=tlHGHNwXhG+d5/P861oREM5anvoPyhHVNbQdTZhui7wQRHSLeHzXxAzhIstobqhjLi
 rtvJ/pYgXb/cWnA8QL9zqz7qNX3uUBtEwrLXdSZM0CwL8YOyILW1I8Fkka2BFU+fjrL4
 r4SrZVpSe36iCMJZampFAbqQ98LvGdnYttfjMbOFqJNrV9DY+YQyfBnjc5xms84mFp7f
 Ob8zx1W0G+/M9br4mDKl9YriKhBdS0TGzujgoKDsr8gK7uE5uBXqlk251bWLKIVuSzec
 bE2TI55hnDDU0nY/+Fg10l1nkR0UWAyHA0oRyPdN7o11CUWS8L4HHdKCWFOW23y75G6p
 bFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxnLY9crCokdRJwZ1cSyxopWXEnHeRFdvQXqwCq/JLg=;
 b=yd4wZnb3q/J2zUmoBQHj6CJKp6C7L3SUZQFBs7BYFAfA5g1Gcx4NzcTCsipOJ6wQC1
 9fI5jrgpgWbQ+pjLY9SBsdFjItzX/GdRxf8rh27EhRpJ/Ow+9/djjTptnZtkjrNNNjHE
 ccyuy0RBllrqKhHzEfupkaqND4VVPtJU1OH+aDpx9z//TIZ3gpptjUmisQqDqRHdROU6
 hXlM/n6dGHl+8b8t7D4YzG9Q/jBFQCupo9L9blMsjccy1Kb70vEzc1U8qgRFj3iWK7pl
 wRj7PSPromWsYOwwZbexMX/0lk5W8V4CrlPfvS0UlXeoZYMoQNiKysCRTNYTy8QdHnWw
 dVkA==
X-Gm-Message-State: AFqh2ko7CbdkCW5Fw/3zQABKrdMTLsjSpmY3Yvp1iDOMY0cOtzgKChcu
 4eSNtLL0zNkmwbTWsqvYyFy3UA==
X-Google-Smtp-Source: AMrXdXs/q0SN2iTlfURXLknICueUeQ2KL3YOpAmOmOXhaGSs4EPeAlgu1yjr23YTa3tVLndJjW/kEQ==
X-Received: by 2002:a17:906:5f82:b0:871:45b2:19fb with SMTP id
 a2-20020a1709065f8200b0087145b219fbmr26131003eju.25.1674513298028; 
 Mon, 23 Jan 2023 14:34:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a170906a40f00b00877961fbaffsm46173ejz.15.2023.01.23.14.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 14:34:57 -0800 (PST)
Message-ID: <b09871f5-820b-2e1f-7b56-f31786c492bc@linaro.org>
Date: Tue, 24 Jan 2023 00:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 03/14] drm/msm/dp: add configure
 mainlink_levels base on lane number
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> Mainlink_levels determined when two actions to take place by hardware,
> a new BS sequence due to start of video and a static HW MVID is sent
> to panel. This patch add function to configure mainlink level properly
> base on lane number.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 37 ++++++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  4 +++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 ++++
>   3 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 676279d..7ac37d8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017-2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
> @@ -359,6 +360,40 @@ void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
>   			ln_mapping);
>   }
>   
> +void dp_catalog_ctrl_mainlink_levels(struct dp_catalog *dp_catalog,
> +					u8 lane_cnt)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	u32 mainlink_levels, safe_to_exit_level = 14;
> +
> +	switch (lane_cnt) {
> +	case 1:
> +		safe_to_exit_level = 14;
> +		break;
> +	case 2:
> +		safe_to_exit_level = 8;
> +		break;
> +	case 4:
> +		safe_to_exit_level = 5;
> +		break;
> +	default:
> +		drm_dbg_dp(catalog->drm_dev, "setting the default safe_to_exit_level=%u\n",
> +				safe_to_exit_level);

So, set it here rather than somewhere at the top of the function.

> +		break;
> +	}
> +
> +	mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
> +	mainlink_levels &= 0xFE0;
> +	mainlink_levels |= safe_to_exit_level;
> +
> +	drm_dbg_dp(catalog->drm_dev, "mainlink_level=0x%x, safe_to_exit_level=0x%x\n",
> +		mainlink_levels, safe_to_exit_level);
> +
> +	dp_write_link(catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
> +}
> +
>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
>   						bool enable)
>   {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 1f717f4..990c162 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017-2023, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #ifndef _DP_CATALOG_H_
> @@ -92,6 +93,7 @@ u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
>   void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>   void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
> +void dp_catalog_ctrl_mainlink_levels(struct dp_catalog *dp_catalog, u8 lane_cnt);
>   void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index dd26ca6..959a78c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -161,6 +161,8 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>   	u32 cc, tb;
>   
>   	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
> +	dp_catalog_ctrl_mainlink_levels(ctrl->catalog,
> +				ctrl->link->link_params.num_lanes);
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
>   
>   	dp_ctrl_config_ctrl(ctrl);
> @@ -1296,6 +1298,8 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>   {
>   	int ret = 0;
>   
> +	dp_catalog_ctrl_mainlink_levels(ctrl->catalog,
> +				ctrl->link->link_params.num_lanes);
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
>   
>   	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)

-- 
With best wishes
Dmitry

