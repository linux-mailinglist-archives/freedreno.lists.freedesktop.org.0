Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDC3666DFC
	for <lists+freedreno@lfdr.de>; Thu, 12 Jan 2023 10:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEA110E8B2;
	Thu, 12 Jan 2023 09:24:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DB510E8B2
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 09:24:32 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h16so17426792wrz.12
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jan 2023 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8y93oKqpxvzE8rWdKpZl4lXsP+t5rguSGLhBVaBJc0g=;
 b=WThEKA9gNJkYP7HmfQRADIQADz/supXgAp8M0Ch0b6QgcTSLJkoTNqCmwTRX5X0SFi
 kWLSC9p7vL1U7COb9FN0upXxHQvW1YaHNZG0Rm/3K39kC1FmfT++a58cAQvSdEXcOz3l
 byKBbuHvDH/zGgVyrfqHwjMAtcMbF8MIWinhnfGRb2gx20+ScqjVIky1aQL1mQvrHKfk
 dFNmAr/uC27SuThkEmoqIE7eIvkZn1E8UBGpko8Y80IroOFuTCCC87rbaRDFOT/BvHoa
 0rZIGLbPgWEAI6r3Uj7Y/KSbN5KKovXNJeU+KSlU6IYGe6Se5dvi9Il2t9xC8MMw+al1
 SFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8y93oKqpxvzE8rWdKpZl4lXsP+t5rguSGLhBVaBJc0g=;
 b=hxzyFG+J+hCv7JgH/qip3tdVXj1QCTswiXbiGgz/3peYjNEqneM8eTijFm9/tyWmB5
 BeRVKeMHJeRA1qXzyYlKE2i0Vlp62kcSKd8SYspcIMT/dbHb+cBLqimEtQoCmpqd6nXh
 ruYx5USzNXUS3QUcR59p8610A6s+vGgsSn0yOmMua3ovMzR8A190jeiBqyQvWKSahTi9
 wuSoOWmzNqYqFeOxYZE6f45DxKnSysOL7eVJttWH2gjpVqy9YuA7A5HMStbdg0Iejw4s
 PV/zhZYSpvj7aJeNKIc4vxRuTOeDSfEpaqLcqaQGqscMGT+BxaikU+6iG33ceXx4zJk9
 pqVA==
X-Gm-Message-State: AFqh2kqEcDxJRin1r3bPiNrBt+wodXlwnp+WUYlnQd2yNRtrjWCnPege
 +jf1Umq+1cKEd7Z2g8RSIskiuA==
X-Google-Smtp-Source: AMrXdXuXd7dZBWw2m7FDxQZJt+AcbAClVVx1WZ3nCqqtcl5YstgfIvERZe4/zGu+w87qgXyMfElBYw==
X-Received: by 2002:a05:6000:54a:b0:2bd:6490:8c5f with SMTP id
 b10-20020a056000054a00b002bd64908c5fmr6062877wrf.23.1673515471297; 
 Thu, 12 Jan 2023 01:24:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59?
 ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adff642000000b002a01e64f7a1sm16255730wrp.88.2023.01.12.01.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:24:30 -0800 (PST)
Message-ID: <ed9eb076-7a81-8892-a509-9105cbc3c128@linaro.org>
Date: Thu, 12 Jan 2023 10:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
 <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 02/13] drm/bridge: lt9611: fix HPD
 reenablement
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/01/2023 17:56, Dmitry Baryshkov wrote:
> The driver will reset the bridge in the atomic_pre_enable(). However
> this will also drop the HPD interrupt state. Instead of resetting the
> bridge, properly wake it up. This fixes the HPD interrupt delivery after
> the disable/enable cycle.
> 
> Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 2714184cc53f..58f39b279217 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
>   static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
>   {
>   	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
> +	static const struct reg_sequence reg_cfg[] = {
> +		{ 0x8102, 0x12 },
> +		{ 0x8123, 0x40 },
> +		{ 0x8130, 0xea },
> +		{ 0x8011, 0xfa },
> +	};
>   
>   	if (!lt9611->sleep)
>   		return;
>   
> -	lt9611_reset(lt9611);
> -	regmap_write(lt9611->regmap, 0x80ee, 0x01);
> +	regmap_multi_reg_write(lt9611->regmap,
> +			       reg_cfg, ARRAY_SIZE(reg_cfg));
>   
>   	lt9611->sleep = false;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
