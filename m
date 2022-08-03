Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB1F5887B1
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 09:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC70010F5F8;
	Wed,  3 Aug 2022 07:02:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014A810FD6F
 for <freedreno@lists.freedesktop.org>; Wed,  3 Aug 2022 07:02:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z20so10828814ljq.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 00:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ERBLD//5Rxus/cD9VPLqlwRlILuoKA5rTudtuRc8t+k=;
 b=fgmIvjvkdynK95/GPR1fzwSA1Q6P3h4BOHxxY08oHzP0oUcHLOorxwuK6+q/6dPfCq
 vEqE/vIOU5yX6CaOAQz3pbm8AVR4cwULgb2bqwP4C7aksbdDI27wQ/7dm6Y0RsbPaOR5
 2MFfhcK2dxkX9STfoHVK+5bzOXlqdqmeuaVGt8iCgW0CwXmcdyMtNjyx0U6dPyAsJi49
 7UHSM5Ly0iWY/P7uEFQTM3LLKUW2ozvIPCzbUqrzGu3EokqLgroqZ+nzA68Y9RCxsLVQ
 RHcDjW30zXL5ABQAQduDFgcOqoBxkKG8oaiyPxOp5vnDi6hBAZCd8HaLxq/Rd+ZFRTPv
 53uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ERBLD//5Rxus/cD9VPLqlwRlILuoKA5rTudtuRc8t+k=;
 b=esXD0lAKhbR6h62YK5GxmWmu7rTvC+hrvUPAppImK6iPV4dhcx/eNP6ILD5PWQcnnI
 grsxJ1oyymdt6R+5L6tDhJYGq1c9NrwHykUu9RA6Z/V6ECU9qu44HRXJROZ4yk32vLY5
 2+yC9L/dhhWMLv01TrryERIEII3Z2seTwZsS8LnKhmcJ98Of7remvdtV3QEaHPBETV7A
 olAFllqO6ESxzz6s727MPW5PmQLCcph7/tpOWXXann/4AsJpqTmotdT/6vmGF+Ki3Y7P
 lpojOdMX8ZtYHU37UtUMGIIip3yBCb2gQZNpoNdaE0caYSL7epTEUXM5ZGf5NUeWwlpo
 i9mw==
X-Gm-Message-State: ACgBeo26ATRTDXSHBshU7KKr0M9qoPMRRPu3BbCccn6cfL8uSDpiUeOh
 TOJ1o5F8KBBKoR3zEHaEYSMzLg==
X-Google-Smtp-Source: AA6agR4jON1tKEksi3I4Vq4PlB22Ex/PiBV2zVW/0xnyca+mCjolZrKI4ojvPaOe4SLUdWU9n8Tc2A==
X-Received: by 2002:a2e:5455:0:b0:25e:4b87:9714 with SMTP id
 y21-20020a2e5455000000b0025e4b879714mr4560693ljd.463.1659510154998; 
 Wed, 03 Aug 2022 00:02:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a056512053800b00489d1896c06sm1436681lfc.125.2022.08.03.00.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 00:02:34 -0700 (PDT)
Message-ID: <b375ac1e-312d-d669-48a8-bef2e7e0e424@linaro.org>
Date: Wed, 3 Aug 2022 10:02:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220802223738.898592-1-dianders@chromium.org>
 <20220802153434.v3.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220802153434.v3.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 2/6] drm/msm/dsi: Fix number of
 regulators for SDM660
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/08/2022 01:37, Douglas Anderson wrote:
> 1 regulators is specified listed but the number 2 is specified. This
> presumably means we try to get a regulator with no name. Fix it.
> 
> Fixes: 033f47f7f121 ("drm/msm/dsi: Add DSI configuration for SDM660")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - ("Fix number of regulators for SDM660") new for v2.
> 
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 02000a7b7a18..72c018e26f47 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
>   static const struct msm_dsi_config sdm660_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
>   	.reg_cfg = {
> -		.num = 2,
> +		.num = 1,
>   		.regs = {
>   			{"vdda", 12560, 4 },	/* 1.2 V */

We should find some time and switch the reg_cfg.regs to be the external 
array, so that we can use ARRAY_SIZE for the amount of regs. However it 
is definitely not a showstopper for this series.



-- 
With best wishes
Dmitry

