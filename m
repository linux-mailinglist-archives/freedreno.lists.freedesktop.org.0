Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01748693223
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 16:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3BA10E327;
	Sat, 11 Feb 2023 15:52:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3004310E327
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:52:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hx15so22479842ejc.11
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RD3LGvNcItKoh4Qy+WFoB4i2+xC3g4uw9rhyGD8W28c=;
 b=z2tMtZb9pdV3ozSIItY3sh4Hbj7i+1tcyEAoNrsfUIDB0c7Ss2rXGYYdn8Mq2KSTy3
 Xb5wMHvVEfaxwOsMDcGrk1mn3jjeSYQECICLGNRfBQS9JVKL5c543t92SQwRMKLcHTF+
 LAw8DM1HSHjjWO2D01w0SNu1iIj0Ff54yWMa+1N6BAAJczImOJasdDaMZ/2k7SGgLs2I
 Q1lrl5wbuV32GL5bdH2XAZ4IIys//H30iLPDENZ4Umjta3Zhv/T2Bi93Ht1TZnfeED7u
 H4orQzqJXcr+uCQ4IwmuKx3gdUgFTkSHPdyOtejPhmNz9I8BbmgDhsPBcvej+ia8/yOX
 m2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RD3LGvNcItKoh4Qy+WFoB4i2+xC3g4uw9rhyGD8W28c=;
 b=fG70eJf1eG0+szQOxnyVnIuSHY7yWJINgyrs+vjceZJ/fy8qm7kKTcAy29MCWm3q4e
 A5+rYaN5XudEZ9OxtbcsF9iWfouT0S/VtAw8DtSBVhDMmjTiRwo/xGQfA/3TZmnMu1+f
 fvb2F4gL5TlxipBO5WXUNG/M+gYPswebzwnFHikN/+miopFR/BzZGPXiVPvaPpckuOaP
 LyxKJppiGrAUr4PyXmZ8JpFsjBvl7ulOJ5F9gEQRBH+HM2XUHp3bQI+/f1/ClSltqCBK
 g8sAQOUanWNuLMivZvfwzkEwvaJVkY5i+4YSVbaHfGbEWPqlcba4VfG3SfaPo40Ppt6G
 zAbw==
X-Gm-Message-State: AO0yUKX+uuHvAWZzfyN6qaNknPnUmMVZPd24I1o7mMfhoDMbQj5BHidn
 mHHoV9AxG99Say9sz3gc4uYsIA==
X-Google-Smtp-Source: AK7set8TM3yDzTZOS10jMd62fzS8ZpnkBCiVfUnEU061UOhji5P2sNCeuSTzUL7yOIo7JdT80eoXIA==
X-Received: by 2002:a17:907:608b:b0:8aa:c105:f0bf with SMTP id
 ht11-20020a170907608b00b008aac105f0bfmr20636268ejc.17.1676130770757; 
 Sat, 11 Feb 2023 07:52:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 uj9-20020a170907c98900b00884c611145fsm4021992ejc.62.2023.02.11.07.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 07:52:49 -0800 (PST)
Message-ID: <d8d13ded-9f37-e96a-e34f-4e885fd15c0d@linaro.org>
Date: Sat, 11 Feb 2023 17:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-7-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211115110.1462920-7-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 06/10] drm/msm/dsi: dsi_cfg: Merge SC7180
 config into SDM845
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
 Loic Poulain <loic.poulain@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/02/2023 13:51, Konrad Dybcio wrote:
> The configs are identical, other than the number of *maximum* DSI
> hosts allowed. This isn't an issue, unless somebody deliberately
> tries to access the inexistent host by adding a dt node for it.
> 
> Remove the SC7180 struct and point the hw revision match to the
> SDM845's one. On a note, this could have been done back when
> 7180 support was introduced.
> 
> Fixes: 6125bd327e16 ("drm/msm: add DSI support for sc7180")

Same comment regarding Fixes

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 860681bfc084..142a0f1e2576 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>   	.bus_clk_names = dsi_v2_4_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>   	.io_start = {
> -		{ 0xae94000, 0xae96000, 0 },
> +		{ 0xae94000, 0xae96000, 0 }, /* SDM845 / SDM670 / SC7180 */
>   	},
>   };
>   
> @@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>   	},
>   };
>   
> -static const struct msm_dsi_config sc7180_dsi_cfg = {
> -	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = dsi_v2_4_regulators,
> -	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> -	.bus_clk_names = dsi_v2_4_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> -	.io_start = {
> -		{ 0xae94000, 0 },
> -	},
> -};
> -
>   static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>   	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
>   };
> @@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>   		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> -		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
>   		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,

-- 
With best wishes
Dmitry

