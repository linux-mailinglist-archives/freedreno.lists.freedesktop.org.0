Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A459F7D8A0F
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 23:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAC210E8AF;
	Thu, 26 Oct 2023 21:08:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E90A10E8AF
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 21:08:58 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso2081459a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698354537; x=1698959337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bMfPZQG3/ucH8AVq/i3Ub3YrK7tt+d1+4bgiELGiq+Q=;
 b=FcnTEkuIUt+nafs+nu1j8dofnn/xINBZzjkwf+1LbG5ZS0mtB5Z2Z7L9HnuoabbOQj
 4TJvN8MdKGnmu4kHfjHjlyq2Q4thJHJnOoQP735aBSCE0SCwKF2i19YHGQHHqeIwn26q
 ykpGZ6fuKKhctfBF870J9++DlPQhaQ39quPq5L3BlfTCd8m/Fg4tDIOGykVBV2yGgK7k
 bPM08ftHrSCNvP8xrwXTp1lqlL6ITDOpeJyvpfIxDVMxO1vuAnWZIvNR6i97VHGP42If
 kbZr81N1vTiyjYdp1stb6lRUtSnyL1+dKsLC1PGBb+DtTOLs+RJYS56U3jfudz2Aj1vG
 YORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698354537; x=1698959337;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bMfPZQG3/ucH8AVq/i3Ub3YrK7tt+d1+4bgiELGiq+Q=;
 b=ka2yJoOIE9JhGSPr5bpcCza9y0iaoUVNcwJhaNT8Dtc7JQfmOq84pbn5U4S6ViBU9f
 hpLWXPOsElc050CQs96O+36CYZjUlo7kAIA5AJ8pFbvKSZtPzwf8ppwcjD0ZXmmoESb9
 BLQaCsVEF0hBx6xI5VzMMK9VrktQER4MBbhKyhDqxg+N/Xho9uzaaxz8H39hE0NEGoUj
 W02DVf8TNzxbTelYA63+2HSsVMDlPERpYsVVgW7939EJCayzkFS4FgN/OgTeYjxVTSAN
 Voa7OmuUuwfBvg5/VSU3cuSHi/OPyOP650+ALj8S+ZyVzZU6pLY4jq1C7viF9D/ShFgu
 LksQ==
X-Gm-Message-State: AOJu0YzRcc4v99xnrzR0f8aS/6Pwm3lXjEl0zFx37tlqxbdsZ0ahrO7D
 WM1KjK/IBhkxcOe32yY9ognuRg==
X-Google-Smtp-Source: AGHT+IHpOWLcn7w5EuLJRpdXs6AF75XUE7TiA9NDj5B80gxhszVR/o2uDb+GN+7c1/0kxpF8rKNm6A==
X-Received: by 2002:a05:6402:1a35:b0:53e:467c:33f8 with SMTP id
 be21-20020a0564021a3500b0053e467c33f8mr799145edb.20.1698354536903; 
 Thu, 26 Oct 2023 14:08:56 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 g27-20020a50d5db000000b005402c456892sm167715edj.33.2023.10.26.14.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 14:08:56 -0700 (PDT)
Message-ID: <cd3df2b1-f384-4d26-99a1-e53ecf9f332e@linaro.org>
Date: Thu, 26 Oct 2023 23:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-6-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 05/15] phy: qualcomm: add legacy HDMI PHY
 driver
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> Add the driver for pre-QMP Qualcomm HDMI PHYs. Currently it suppports
> Qualcomm MSM8960 / APQ8064 platforms, other platforms will come later.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]


> +{
> +	unsigned int pixclk = hdmi_phy->hdmi_opts.pixel_clk_rate;
> +        unsigned int int_ref_freq;
there's some misaligned things

[...]

> +	lf_cfg0 = dc_offset >= 30 ? 0 : (dc_offset >= 16 ? 0x10 : 0x20);
some unreadable things

[...]

> +	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG2,
> +		       sdm_freq_seed & 0xff);
> +
> +	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG3,
> +		       (sdm_freq_seed >> 8) & 0xff);
> +
> +	hdmi_pll_write(hdmi_phy, REG_HDMI_8960_PHY_PLL_SDM_CFG4,
> +		       sdm_freq_seed >> 16);
and a lot of magic bits in this submission

and some non-reverse-Christmas-trees

and some leftover comments like /* XXX: 19.2 for qcs404 */

I see a lot of RMW, maybe regmap could help make this more readable

on the !style front, it looks sane to an unknowing eye, so I guess
that's the end of my complaints

Konrad
