Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B71D480E3D
	for <lists+freedreno@lfdr.de>; Wed, 29 Dec 2021 01:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E4A10E146;
	Wed, 29 Dec 2021 00:29:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361A10E146
 for <freedreno@lists.freedesktop.org>; Wed, 29 Dec 2021 00:29:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id i31so44436172lfv.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Dec 2021 16:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=oibSG8+qBLBks3t9n9I4JkrULzaC1Ink3zPejbgFPPk=;
 b=vtWo8iGRTmFNluIbCbzb/S3Pi9CNF5G5VORZUaQGpEJHiDGYXG9XpLqG3LdYdzg46v
 HvhcSo3THYDRJLJCVCvi6himyh3aUMBRHondFKyBhxeXgrGWooUBttFKOQiykyyGHa4v
 WElou1Ic3XR7SixXnYpCPkPGMwoDmhxisXXOOJWoiBFk+dCe8/eNeMa2zigbEZrGbui8
 Y+eEyQ7OWs9tHA3dSRVcEIBPmpvJHEyogJBgvefFpFnKQ0llyydK8qD+ROnbQUbhc+ih
 V27rUSMRLngn0BaePHbDRSIkyHYWSVcYSnQCoTdAoQ/xN+4Ev8EKvMi1V1BM+Kjty7of
 dh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=oibSG8+qBLBks3t9n9I4JkrULzaC1Ink3zPejbgFPPk=;
 b=4bDd/DfAKY3uAxByIn1WFyqr0rcm7ORb8mJ8JVM0EH6vXmQ/OOI4ltsk18q4nItb+T
 jUor6ncBQDI64HXeKRUSBlnw6mcA6+omHvVxoimeoaKMjTVZFcJZA9D8dvJqzMHS/6x3
 m5MXohRiRkX5bvxEAP0uXNHDacXtXGKKnF01xv5/YBVBrl3v7lBF5RSFk1FR+RwFMjJA
 AwKnTCT5YN9jsGdQNLOTeEVlMiMklZvxTw2lfekcfMwUda72eA1r30petZraZpU9x1Jx
 EbzIG9kqjQGo1DxDtapmjjIH1wZjSi+o2SVXYHJ1wbEiky0uNUMysvfDDfOADEmIcuKk
 jlww==
X-Gm-Message-State: AOAM531CbhWmwDlUWH0AduRR8GvokrPFKRLyyHpN62IH5nvdiC6Z+keU
 FpUiAWWki1nqU2coTk0ARq1hJg==
X-Google-Smtp-Source: ABdhPJzo3Sl5fUx8Qi/6EYnHGAxE+k1bLzfc5NncwRaZTmDLhqIzJdNQsVWHVqkZgW9+wr0z5z9Gsg==
X-Received: by 2002:a05:6512:3182:: with SMTP id
 i2mr18660983lfe.673.1640737780312; 
 Tue, 28 Dec 2021 16:29:40 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 18sm2037364ljj.119.2021.12.28.16.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 16:29:39 -0800 (PST)
Message-ID: <826279c5-697c-dca7-0b7c-33857bbba57a@linaro.org>
Date: Wed, 29 Dec 2021 03:29:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
 <20211126023516.1108411-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211126023516.1108411-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dp: rewrite dss_module_power
 to use bulk clock functions
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Kuogee,

Some time ago you volonteered to check these two patches on a DP hosts. 
Any progress?

On 26/11/2021 05:35, Dmitry Baryshkov wrote:
> In order to simplify DP code, drop hand-coded loops over clock arrays,
> replacing them with clk_bulk_* functions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Makefile         |   1 -
>   drivers/gpu/drm/msm/dp/dp_clk_util.c | 120 ---------------------------
>   drivers/gpu/drm/msm/dp/dp_clk_util.h |  38 ---------
>   drivers/gpu/drm/msm/dp/dp_ctrl.c     |  19 ++---
>   drivers/gpu/drm/msm/dp/dp_parser.c   |  21 ++++-
>   drivers/gpu/drm/msm/dp/dp_parser.h   |  17 +++-
>   drivers/gpu/drm/msm/dp/dp_power.c    |  81 +++++++++---------
>   7 files changed, 83 insertions(+), 214 deletions(-)
>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.c
>   delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.h
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index b6637da219b0..ccacf604881a 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -104,7 +104,6 @@ msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
>   
>   msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_catalog.o \
> -	dp/dp_clk_util.o \
>   	dp/dp_ctrl.o \
>   	dp/dp_display.o \
>   	dp/dp_drm.o \
> diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.c b/drivers/gpu/drm/msm/dp/dp_clk_util.c
> deleted file mode 100644
> index 44a4fc59ff31..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_clk_util.c
> +++ /dev/null
> @@ -1,120 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2012-2015, 2017-2018, The Linux Foundation.
> - * All rights reserved.
> - */
> -
> -#include <linux/clk.h>
> -#include <linux/clk/clk-conf.h>
> -#include <linux/err.h>
> -#include <linux/delay.h>
> -#include <linux/of.h>
> -
> -#include <drm/drm_print.h>
> -
> -#include "dp_clk_util.h"
> -
> -void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk)
> -{
> -	int i;
> -
> -	for (i = num_clk - 1; i >= 0; i--) {
> -		if (clk_arry[i].clk)
> -			clk_put(clk_arry[i].clk);
> -		clk_arry[i].clk = NULL;
> -	}
> -}
> -
> -int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk)
> -{
> -	int i, rc = 0;
> -
> -	for (i = 0; i < num_clk; i++) {
> -		clk_arry[i].clk = clk_get(dev, clk_arry[i].clk_name);
> -		rc = PTR_ERR_OR_ZERO(clk_arry[i].clk);
> -		if (rc) {
> -			DEV_ERR("%pS->%s: '%s' get failed. rc=%d\n",
> -				__builtin_return_address(0), __func__,
> -				clk_arry[i].clk_name, rc);
> -			goto error;
> -		}
> -	}
> -
> -	return rc;
> -
> -error:
> -	for (i--; i >= 0; i--) {
> -		if (clk_arry[i].clk)
> -			clk_put(clk_arry[i].clk);
> -		clk_arry[i].clk = NULL;
> -	}
> -
> -	return rc;
> -}
> -
> -int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk)
> -{
> -	int i, rc = 0;
> -
> -	for (i = 0; i < num_clk; i++) {
> -		if (clk_arry[i].clk) {
> -			if (clk_arry[i].type != DSS_CLK_AHB) {
> -				DEV_DBG("%pS->%s: '%s' rate %ld\n",
> -					__builtin_return_address(0), __func__,
> -					clk_arry[i].clk_name,
> -					clk_arry[i].rate);
> -				rc = clk_set_rate(clk_arry[i].clk,
> -					clk_arry[i].rate);
> -				if (rc) {
> -					DEV_ERR("%pS->%s: %s failed. rc=%d\n",
> -						__builtin_return_address(0),
> -						__func__,
> -						clk_arry[i].clk_name, rc);
> -					break;
> -				}
> -			}
> -		} else {
> -			DEV_ERR("%pS->%s: '%s' is not available\n",
> -				__builtin_return_address(0), __func__,
> -				clk_arry[i].clk_name);
> -			rc = -EPERM;
> -			break;
> -		}
> -	}
> -
> -	return rc;
> -}
> -
> -int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable)
> -{
> -	int i, rc = 0;
> -
> -	if (enable) {
> -		for (i = 0; i < num_clk; i++) {
> -			DEV_DBG("%pS->%s: enable '%s'\n",
> -				__builtin_return_address(0), __func__,
> -				clk_arry[i].clk_name);
> -			rc = clk_prepare_enable(clk_arry[i].clk);
> -			if (rc)
> -				DEV_ERR("%pS->%s: %s en fail. rc=%d\n",
> -					__builtin_return_address(0),
> -					__func__,
> -					clk_arry[i].clk_name, rc);
> -
> -			if (rc && i) {
> -				msm_dss_enable_clk(&clk_arry[i - 1],
> -					i - 1, false);
> -				break;
> -			}
> -		}
> -	} else {
> -		for (i = num_clk - 1; i >= 0; i--) {
> -			DEV_DBG("%pS->%s: disable '%s'\n",
> -				__builtin_return_address(0), __func__,
> -				clk_arry[i].clk_name);
> -
> -			clk_disable_unprepare(clk_arry[i].clk);
> -		}
> -	}
> -
> -	return rc;
> -}
> diff --git a/drivers/gpu/drm/msm/dp/dp_clk_util.h b/drivers/gpu/drm/msm/dp/dp_clk_util.h
> deleted file mode 100644
> index 6288a2833a58..000000000000
> --- a/drivers/gpu/drm/msm/dp/dp_clk_util.h
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2012, 2017-2018, The Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef __DPU_IO_UTIL_H__
> -#define __DPU_IO_UTIL_H__
> -
> -#include <linux/platform_device.h>
> -#include <linux/types.h>
> -
> -#define DEV_DBG(fmt, args...)   pr_debug(fmt, ##args)
> -#define DEV_INFO(fmt, args...)  pr_info(fmt, ##args)
> -#define DEV_WARN(fmt, args...)  pr_warn(fmt, ##args)
> -#define DEV_ERR(fmt, args...)   pr_err(fmt, ##args)
> -
> -enum dss_clk_type {
> -	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
> -	DSS_CLK_PCLK,
> -};
> -
> -struct dss_clk {
> -	struct clk *clk; /* clk handle */
> -	char clk_name[32];
> -	enum dss_clk_type type;
> -	unsigned long rate;
> -	unsigned long max_rate;
> -};
> -
> -struct dss_module_power {
> -	unsigned int num_clk;
> -	struct dss_clk *clk_config;
> -};
> -
> -int msm_dss_get_clk(struct device *dev, struct dss_clk *clk_arry, int num_clk);
> -void msm_dss_put_clk(struct dss_clk *clk_arry, int num_clk);
> -int msm_dss_clk_set_rate(struct dss_clk *clk_arry, int num_clk);
> -int msm_dss_enable_clk(struct dss_clk *clk_arry, int num_clk, int enable);
> -#endif /* __DPU_IO_UTIL_H__ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 62e75dc8afc6..e9a4d6c32f57 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1289,20 +1289,19 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>   static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
>   			enum dp_pm_type module, char *name, unsigned long rate)
>   {
> +	u32 i;
>   	u32 num = ctrl->parser->mp[module].num_clk;
> -	struct dss_clk *cfg = ctrl->parser->mp[module].clk_config;
> -
> -	while (num && strcmp(cfg->clk_name, name)) {
> -		num--;
> -		cfg++;
> -	}
>   
>   	DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
>   
> -	if (num)
> -		cfg->rate = rate;
> -	else
> -		DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
> +	for (i = 0; i < num; i++) {
> +		if (!strcmp(ctrl->parser->mp[module].clocks[i].id, name)) {
> +			ctrl->parser->mp[module].clk_config[i].rate = rate;
> +			return;
> +		}
> +	}
> +
> +	DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
>   				name, rate);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index a7acc23f742b..0fe726913b4e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -162,6 +162,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
>   	}
>   
>   	core_power->num_clk = core_clk_count;
> +	core_power->clocks = devm_kcalloc(dev,
> +			core_power->num_clk, sizeof(struct clk_bulk_data),
> +			GFP_KERNEL);
> +	if (!core_power->clocks)
> +		return -ENOMEM;
>   	core_power->clk_config = devm_kzalloc(dev,
>   			sizeof(struct dss_clk) * core_power->num_clk,
>   			GFP_KERNEL);
> @@ -175,6 +180,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
>   	}
>   
>   	ctrl_power->num_clk = ctrl_clk_count;
> +	ctrl_power->clocks = devm_kcalloc(dev,
> +			ctrl_power->num_clk, sizeof(struct clk_bulk_data),
> +			GFP_KERNEL);
> +	if (!ctrl_power->clocks)
> +		return -ENOMEM;
>   	ctrl_power->clk_config = devm_kzalloc(dev,
>   			sizeof(struct dss_clk) * ctrl_power->num_clk,
>   			GFP_KERNEL);
> @@ -190,6 +200,11 @@ static int dp_parser_init_clk_data(struct dp_parser *parser)
>   	}
>   
>   	stream_power->num_clk = stream_clk_count;
> +	stream_power->clocks = devm_kcalloc(dev,
> +			stream_power->num_clk, sizeof(struct clk_bulk_data),
> +			GFP_KERNEL);
> +	if (!stream_power->clocks)
> +		return -ENOMEM;
>   	stream_power->clk_config = devm_kzalloc(dev,
>   			sizeof(struct dss_clk) * stream_power->num_clk,
>   			GFP_KERNEL);
> @@ -236,21 +251,21 @@ static int dp_parser_clock(struct dp_parser *parser)
>   				core_clk_index < core_clk_count) {
>   			struct dss_clk *clk =
>   				&core_power->clk_config[core_clk_index];
> -			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
> +			core_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
>   			clk->type = DSS_CLK_AHB;
>   			core_clk_index++;
>   		} else if (dp_parser_check_prefix("stream", clk_name) &&
>   				stream_clk_index < stream_clk_count) {
>   			struct dss_clk *clk =
>   				&stream_power->clk_config[stream_clk_index];
> -			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
> +			stream_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
>   			clk->type = DSS_CLK_PCLK;
>   			stream_clk_index++;
>   		} else if (dp_parser_check_prefix("ctrl", clk_name) &&
>   			   ctrl_clk_index < ctrl_clk_count) {
>   			struct dss_clk *clk =
>   				&ctrl_power->clk_config[ctrl_clk_index];
> -			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
> +			ctrl_power->clocks[i].id = devm_kstrdup(dev, clk_name, GFP_KERNEL);
>   			ctrl_clk_index++;
>   			if (dp_parser_check_prefix("ctrl_link", clk_name) ||
>   			    dp_parser_check_prefix("stream_pixel", clk_name))
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 094b39bfed8c..f16072f33cdb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -10,7 +10,6 @@
>   #include <linux/phy/phy.h>
>   #include <linux/phy/phy-dp.h>
>   
> -#include "dp_clk_util.h"
>   #include "msm_drv.h"
>   
>   #define DP_LABEL "MDSS DP DISPLAY"
> @@ -106,6 +105,22 @@ struct dp_regulator_cfg {
>   	struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
>   };
>   
> +enum dss_clk_type {
> +	DSS_CLK_AHB, /* no set rate. rate controlled through rpm */
> +	DSS_CLK_PCLK,
> +};
> +
> +struct dss_clk {
> +	enum dss_clk_type type;
> +	unsigned long rate;
> +};
> +
> +struct dss_module_power {
> +	unsigned int num_clk;
> +	struct clk_bulk_data *clocks;
> +	struct dss_clk *clk_config;
> +};
> +
>   /**
>    * struct dp_parser - DP parser's data exposed to clients
>    *
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index b48b45e92bfa..87683071868d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -105,72 +105,69 @@ static int dp_power_clk_init(struct dp_power_private *power)
>   	ctrl = &power->parser->mp[DP_CTRL_PM];
>   	stream = &power->parser->mp[DP_STREAM_PM];
>   
> -	rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
> +	rc = devm_clk_bulk_get(dev, core->num_clk, core->clocks);
>   	if (rc) {
>   		DRM_ERROR("failed to get %s clk. err=%d\n",
>   			dp_parser_pm_name(DP_CORE_PM), rc);
>   		return rc;
>   	}
>   
> -	rc = msm_dss_get_clk(dev, ctrl->clk_config, ctrl->num_clk);
> +	rc = devm_clk_bulk_get(dev, ctrl->num_clk, ctrl->clocks);
>   	if (rc) {
>   		DRM_ERROR("failed to get %s clk. err=%d\n",
>   			dp_parser_pm_name(DP_CTRL_PM), rc);
> -		msm_dss_put_clk(core->clk_config, core->num_clk);
>   		return -ENODEV;
>   	}
>   
> -	rc = msm_dss_get_clk(dev, stream->clk_config, stream->num_clk);
> +	rc = devm_clk_bulk_get(dev, stream->num_clk, stream->clocks);
>   	if (rc) {
>   		DRM_ERROR("failed to get %s clk. err=%d\n",
>   			dp_parser_pm_name(DP_CTRL_PM), rc);
> -		msm_dss_put_clk(core->clk_config, core->num_clk);
>   		return -ENODEV;
>   	}
>   
>   	return 0;
>   }
>   
> -static int dp_power_clk_deinit(struct dp_power_private *power)
> +static int dp_power_clk_set_link_rate(struct dp_power_private *power,
> +			struct dss_clk *clk_arry, int num_clk, int enable)
>   {
> -	struct dss_module_power *core, *ctrl, *stream;
> -
> -	core = &power->parser->mp[DP_CORE_PM];
> -	ctrl = &power->parser->mp[DP_CTRL_PM];
> -	stream = &power->parser->mp[DP_STREAM_PM];
> +	u32 rate;
> +	int i, rc = 0;
>   
> -	if (!core || !ctrl || !stream) {
> -		DRM_ERROR("invalid power_data\n");
> -		return -EINVAL;
> +	for (i = 0; i < num_clk; i++) {
> +		if (clk_arry[i].type == DSS_CLK_PCLK) {
> +			if (enable)
> +				rate = clk_arry[i].rate;
> +			else
> +				rate = 0;
> +
> +			rc = dev_pm_opp_set_rate(power->dev, rate);
> +			if (rc)
> +				break;
> +		}
>   	}
> -
> -	msm_dss_put_clk(ctrl->clk_config, ctrl->num_clk);
> -	msm_dss_put_clk(core->clk_config, core->num_clk);
> -	msm_dss_put_clk(stream->clk_config, stream->num_clk);
> -	return 0;
> +	return rc;
>   }
>   
> -static int dp_power_clk_set_link_rate(struct dp_power_private *power,
> -			struct dss_clk *clk_arry, int num_clk, int enable)
> +static int dp_clk_set_rate(struct dss_module_power *mp)
>   {
> -	u32 rate;
>   	int i, rc = 0;
> +	struct dss_clk *clk_arry = mp->clk_config;
>   
> -	for (i = 0; i < num_clk; i++) {
> -		if (clk_arry[i].clk) {
> -			if (clk_arry[i].type == DSS_CLK_PCLK) {
> -				if (enable)
> -					rate = clk_arry[i].rate;
> -				else
> -					rate = 0;
> -
> -				rc = dev_pm_opp_set_rate(power->dev, rate);
> -				if (rc)
> -					break;
> +	for (i = 0; i < mp->num_clk; i++) {
> +		if (clk_arry[i].type != DSS_CLK_AHB) {
> +			rc = clk_set_rate(mp->clocks[i].clk, mp->clk_config[i].rate);
> +			if (rc) {
> +				DRM_ERROR("%pS->%s: %s failed. rc=%d\n",
> +						__builtin_return_address(0),
> +						__func__,
> +						mp->clocks[i].id, rc);
> +				break;
>   			}
> -
>   		}
>   	}
> +
>   	return rc;
>   }
>   
> @@ -189,7 +186,7 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
>   	} else {
>   
>   		if (enable) {
> -			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
> +			rc = dp_clk_set_rate(mp);
>   			if (rc) {
>   				DRM_ERROR("failed to set clks rate\n");
>   				return rc;
> @@ -197,10 +194,14 @@ static int dp_power_clk_set_rate(struct dp_power_private *power,
>   		}
>   	}
>   
> -	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
> -	if (rc) {
> -		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
> -		return rc;
> +	if (enable) {
> +		rc = clk_bulk_prepare_enable(mp->num_clk, mp->clocks);
> +		if (rc) {
> +			DRM_ERROR("failed to enable clks, err: %d\n", rc);
> +			return rc;
> +		}
> +	} else {
> +		clk_bulk_disable_unprepare(mp->num_clk, mp->clocks);
>   	}
>   
>   	return 0;
> @@ -336,9 +337,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
>   
>   	power = container_of(dp_power, struct dp_power_private, dp_power);
>   
> -	dp_power_clk_deinit(power);
>   	pm_runtime_disable(&power->pdev->dev);
> -
>   }
>   
>   int dp_power_init(struct dp_power *dp_power, bool flip)


-- 
With best wishes
Dmitry
