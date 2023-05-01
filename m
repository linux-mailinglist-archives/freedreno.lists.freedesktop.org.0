Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC56F30EC
	for <lists+freedreno@lfdr.de>; Mon,  1 May 2023 14:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25B810E0E5;
	Mon,  1 May 2023 12:38:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E3210E0E5
 for <freedreno@lists.freedesktop.org>; Mon,  1 May 2023 12:38:03 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2a8aea2a654so23661431fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 01 May 2023 05:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682944680; x=1685536680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/IbVhpk+6YPf6UP0JUxSgmpnmuOZSagBqkf05LKlAxI=;
 b=t+luffE6T+59qh3ntjYNcC3D1SBpx/+RpIpcCQ85pY/H9DOvzmmPnASP8r052HqmLS
 +kzRdc3ATuzCgKbT1UAlQts5r3DdvAAEhgbDYC6F5dACbOvATDkkZUiDDpUo7eUC9tsZ
 F0gQLIJCzriXoyvmlMMBEx4XB3nYgeF7r1DIIQMqzdeTyJifaEFf2z555o9DUFyHy6ad
 e5W7QSlbtoj7qEf3xMe4ENjjMdEtYWNPsyxjUrY1Sp7N/l4iCnIVBRoRU8UqI4spwpST
 vpTpKVb69D56fnwKY+0ANtVg9wg7pQ1tuSS075AEKWW7Sq/miTHoN1s3Qe6J3PPIjhHI
 0yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682944680; x=1685536680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/IbVhpk+6YPf6UP0JUxSgmpnmuOZSagBqkf05LKlAxI=;
 b=ZEObiaqdvDmUq7OyNsdpVgQvtYGT3q7nXRtyBl3x7hrTSJZ8Ok2WK9mFMFoMinCM98
 wKJ6/fhmnK+6w1ISxmosBuOQRnAgmZgiLndAtodtJ+8A840ZHZOfcXPE74RML+nf+vtz
 cJq7xL317tUEL3W39rVKHlCI1lpGtgY2Q4sjJR6Pd4qCDYf/ZgUY32YsGRZ9nVH59gLH
 Hu0Cj3S/dz5KMpL5bQ5j1u3jlFD0ky9QGj62pWAV3nlb6f49F8bQneQC7Hb189Ltdt4Y
 hz2xW82NpYYJPudS7VrpO3ZnWFU5al/0iFauBTJpaog8YITLA0pYubYLLqvIOihi5sna
 GdjQ==
X-Gm-Message-State: AC+VfDyqfZhYWWZGclZFv4WFXIJjY7yKPKFOKYhZaS3kuwiAg5VE62CC
 Qja8L6G11dRoBtZZrSI7VU+2qA==
X-Google-Smtp-Source: ACHHUZ4JrEAVZU7gK3ZcuZgwQYC6Wox623r/U+ysIg9R1y1XMRn7lrpbRiifYov8TJDnd2uPAthOdg==
X-Received: by 2002:a2e:9658:0:b0:2a8:bce4:c712 with SMTP id
 z24-20020a2e9658000000b002a8bce4c712mr3814440ljh.43.1682944680000; 
 Mon, 01 May 2023 05:38:00 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05651238c300b004ec5229092dsm4722852lft.34.2023.05.01.05.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 05:37:59 -0700 (PDT)
Message-ID: <7cf248ee-d966-3aa5-91f1-3d93ab71cd4b@linaro.org>
Date: Mon, 1 May 2023 14:37:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501011257.3460103-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: don't allow enabling 14nm VCO
 with unprogrammed rate
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 1.05.2023 03:12, Dmitry Baryshkov wrote:
> If the dispcc uses CLK_OPS_PARENT_ENABLE (e.g. on QCM2290), CCF can try
> enabling VCO before the rate has been programmed. This can cause clock
> lockups and/or other boot issues. Program the VCO to the minimal PLL
> rate if the read rate is 0 Hz.
> 
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reported-by: Konrad Dybcio <konrad.dybcio@linaro.org>

I think this should also be implemented on other PLL gens.

>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 9f488adea7f5..3ce45b023e63 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -539,6 +539,9 @@ static int dsi_pll_14nm_vco_prepare(struct clk_hw *hw)
>  	if (unlikely(pll_14nm->phy->pll_on))
>  		return 0;
>  
> +	if (dsi_pll_14nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> +		dsi_pll_14nm_vco_set_rate(hw, pll_14nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
VCO_REF_CLK_RATE ---> phy->cfg->min_pll_rate (VCO_MIN_RATE)?

Konrad
> +
>  	dsi_phy_write(base + REG_DSI_14nm_PHY_PLL_VREF_CFG1, 0x10);
>  	dsi_phy_write(cmn_base + REG_DSI_14nm_PHY_CMN_PLL_CNTRL, 1);
>  
