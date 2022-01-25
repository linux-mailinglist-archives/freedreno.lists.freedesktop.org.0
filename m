Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B761B49A233
	for <lists+freedreno@lfdr.de>; Tue, 25 Jan 2022 02:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560BB10E8AA;
	Tue, 25 Jan 2022 01:56:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E281210E8B1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jan 2022 01:56:50 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id t14so13031818ljh.8
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 17:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vl7zRt7CzWsP5dsK8jjPyozz1f+nDjiiAEcQBupI+gg=;
 b=n9wQmxV93FBjl1p6UWAnsR/Rp4I78wtTrlfGHx2HeDJvo28sEJ3Ui/yv/jSLo4OkTG
 itA+Z96FdTg7IqxtkVMyEUrAn80XGgC428mPsYkUzqOljwTg6O8NJ+iyMdieCWRi1nu9
 sh4JrOqePDuMC+5iw0mOkb2LuYDCSJgzjiQllRYSTB5bk8coihMSwkqQibGyeJm5h8C6
 5E0nkFOjRLe3vSC+lKGnA98V0sj51CEJ7yFiI9AqYgG50MwMhT7TrGZhHHRuAkswRbv+
 0TSMJAnk9PBntohIujBiATwlDwISz5tX0ggyfMVBmcFHJW0zFNrq4djqIjZZ5fb9dI1+
 Mydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vl7zRt7CzWsP5dsK8jjPyozz1f+nDjiiAEcQBupI+gg=;
 b=unQQfdwSQNcFZCzxakNMKgpu7hFwbW9GCA6wvZGIWAM7pJ1aRptr0ethZt++T2TyZ8
 75MhcwsfPebI1ZI8Yyb2HsZzPvKnnRW2EHaH+H7y3+c0QbgCuhOz2YtR7GnMSLlBZfX0
 s0663t16AKK+ZY0HkWcz0IDWYDh77GR5mGJj22r7JePSifk/9mV9u9LVSySSe3KWhDYP
 +694ARwimDEm2bM5tYhBg3VhWXvSbC21QKw+xDNt4P/vUpqRX7/Xwy10s8pM6kxVXTne
 lIvggl/BY5gtXEhbv6YzearEFP3b7BLNi1fkYq9uYAr4CRzAWQjlbQ8Q+KTv2yxu7MBO
 eVVg==
X-Gm-Message-State: AOAM530YnjomJn6ouSNnNB4Hi1Ntp5r2c9vYIyIYkBTEOrxKM3al2v9w
 KPQPNWNvqYSggD/1PWUMna0X9w==
X-Google-Smtp-Source: ABdhPJyGoLMRs00RgcJNojAwWsrQUnnYJ9BDZG0uXkgal8iXcUoDVBKfNsOhG8xLGfNq7k8uCISjgw==
X-Received: by 2002:a2e:8551:: with SMTP id u17mr3356586ljj.35.1643075809221; 
 Mon, 24 Jan 2022 17:56:49 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w16sm474939ljg.14.2022.01.24.17.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 17:56:48 -0800 (PST)
Message-ID: <e3ef9c30-ffc2-b7c1-a361-09a6d35da03d@linaro.org>
Date: Tue, 25 Jan 2022 04:56:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Rajeev Nandan <quic_rajeevny@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
 <1642538320-1127-3-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1642538320-1127-3-git-send-email-quic_rajeevny@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v3 2/3] drm/msm/dsi: Add dsi phy tuning
 configuration support
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
Cc: quic_kalyant@quicinc.com, robh@kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
 robdclark@gmail.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 daniel@ffwll.ch, swboyd@chromium.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/01/2022 23:38, Rajeev Nandan wrote:
> Add support for MSM DSI PHY tuning configuration. Current design is
> to support drive strength and drive level/amplitude tuning for
> 10nm PHY version, but this can be extended to other PHY versions.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes in v2:
>   - New.
>   - Split into generic code and 10nm-specific part (Dmitry Baryshkov)
> 
> Changes in v3:
>   - s/ops.tuning_cfg_init/ops.parse_dt_properties
>     To parse phy version specific DT properties (Dmitry Baryshkov)
>   - Address comments for phy tuning data structure (Dmitry Baryshkov)
> 
> 
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 6 ++++++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h | 4 ++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 8c65ef6..fcbca76 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -739,6 +739,12 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	if (phy->cfg->ops.parse_dt_properties) {
> +		ret = phy->cfg->ops.parse_dt_properties(phy);
> +		if (ret)
> +			goto fail;
> +	}
> +
>   	ret = dsi_phy_regulator_init(phy);
>   	if (ret)
>   		goto fail;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index b91303a..9e08081 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -25,6 +25,7 @@ struct msm_dsi_phy_ops {
>   	void (*save_pll_state)(struct msm_dsi_phy *phy);
>   	int (*restore_pll_state)(struct msm_dsi_phy *phy);
>   	bool (*set_continuous_clock)(struct msm_dsi_phy *phy, bool enable);
> +	int (*parse_dt_properties)(struct msm_dsi_phy *phy);
>   };
>   
>   struct msm_dsi_phy_cfg {
> @@ -81,6 +82,8 @@ struct msm_dsi_dphy_timing {
>   #define DSI_PIXEL_PLL_CLK		1
>   #define NUM_PROVIDED_CLKS		2
>   
> +#define DSI_LANE_MAX			5
> +
>   struct msm_dsi_phy {
>   	struct platform_device *pdev;
>   	void __iomem *base;
> @@ -98,6 +101,7 @@ struct msm_dsi_phy {
>   
>   	struct msm_dsi_dphy_timing timing;
>   	const struct msm_dsi_phy_cfg *cfg;
> +	void *tuning_cfg;
>   
>   	enum msm_dsi_phy_usecase usecase;
>   	bool regulator_ldo_mode;


-- 
With best wishes
Dmitry
