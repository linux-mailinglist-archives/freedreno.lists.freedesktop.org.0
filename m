Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35116740519
	for <lists+freedreno@lfdr.de>; Tue, 27 Jun 2023 22:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E062D10E329;
	Tue, 27 Jun 2023 20:46:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ADA10E323
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jun 2023 20:46:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso5299962e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jun 2023 13:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687898783; x=1690490783;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7OJ43xoUAaQ7/BbXqVAEGUSQDP14HiDVf0qfii8I1YQ=;
 b=WeHGCh41l5qr7LA+qBes0VVFE2IEvDQx0TD2zppJTkpigfMtHqJ5DjO4nunlnyYAgN
 e7vknMZlOTubu/M7Blxui2QEPnnQsGe/6jOwFGV2AysHqLnjlOabVKf2agqR6i3HAjwk
 qkK6vwq79TQ2JClNzXotgp2cV3TVry7fgaXCm+nawyWONuTgmX5+lXG3Yo4Bf9jCbJlW
 1h5afWMCvkfs07bZ/x4BuK04FTjOv+3h90pdNFyn7jeQMSdrc1HtujiIJWP8lDALyAjC
 1xcynJDR8n3tasM+7zBtMZu4d7pnUGoi69i2N8y9u9eTGkucjIVz+vqfFM7Kyuq18eM0
 FU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687898783; x=1690490783;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7OJ43xoUAaQ7/BbXqVAEGUSQDP14HiDVf0qfii8I1YQ=;
 b=aLRGf+vBWUKKjyeW1y/fxBhHC2aijgE7wXasT+jGUPAuttbC2K1FZ7ZzQu7olAgOGP
 oOlx49/37mSof7SVqNjgwllMxGc7ISNJTP9rXozKV1WCzlIiQ7hIHIp4BPFkoisWqjGF
 sCvZPDMjlAyxP9AgLuqR9T9j2fOCFEFHx79yKUxyJ56PUwe59HfUMS8J3B+tREsldEpK
 y90A50PTDDi0gvyXCM9Aqrrqy2BiqLjR/37YLLcXgHRviB2dMfw82n1+fLv8IFxenCVU
 5HEVu/8kGzXad8HkEIGR3lnZzN620GAQJNlRfsEeMu0EgqeKo6kIsrCrajZ6v0wCEOqO
 LQ5g==
X-Gm-Message-State: AC+VfDwL+FTqbH+to1xAMnAvytLDF42hVMwGWOzQLPq4AYnG85CCdr93
 /lYo///ubp6FDyA+QUVRNgpzpA==
X-Google-Smtp-Source: ACHHUZ5emIXmf1rO07fQAxgUi9BjGsQQr+Z1m68cQ3h8Fv+spImuqKnVYk5Ko6yRkLs2vijoGtJRQQ==
X-Received: by 2002:a19:2d5b:0:b0:4f8:5e49:c613 with SMTP id
 t27-20020a192d5b000000b004f85e49c613mr17229826lft.43.1687898783459; 
 Tue, 27 Jun 2023 13:46:23 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
 by smtp.gmail.com with ESMTPSA id
 eo7-20020a056512480700b004f86c43d615sm1670680lfb.295.2023.06.27.13.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 13:46:23 -0700 (PDT)
Message-ID: <d205b3f1-ae6d-9162-8baa-875f6c44f6be@linaro.org>
Date: Tue, 27 Jun 2023 22:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-11-03e430a2078c@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-11-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 11/15] drm/msm/dsi: Reuse QCM2290 14nm
 DSI PHY configuration for SM6125
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27.06.2023 22:14, Marijn Suijten wrote:
> SM6125 features only a single PHY (despite a secondary PHY PLL source
> being available to the disp_cc_mdss_pclk0_clk_src clock), and downstream
> sources for this "trinket" SoC do not define the typical "vcca"
> regulator to be available nor used.  This, including the register offset
> is identical to QCM2290, whose config struct can trivially be reused.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 9d5795c58a98..05621e5e7d63 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -561,6 +561,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_14nm_660_cfgs },
>  	{ .compatible = "qcom,dsi-phy-14nm-8953",
>  	  .data = &dsi_phy_14nm_8953_cfgs },
> +	{ .compatible = "qcom,sm6125-dsi-phy-14nm",
> +	  .data = &dsi_phy_14nm_2290_cfgs },
>  #endif
>  #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
>  	{ .compatible = "qcom,dsi-phy-10nm",
> 
