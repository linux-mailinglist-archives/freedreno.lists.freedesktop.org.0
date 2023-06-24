Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E043F73C5E6
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 03:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD4110E6ED;
	Sat, 24 Jun 2023 01:42:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8E410E0FF
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 01:42:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f870247d6aso1740070e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 18:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687570969; x=1690162969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ABZIpr9ZPthPG5kXqvTW8Rk5Ou0ROoLl20Thcdzgw/c=;
 b=mfNh86M9tQZaO3Vz9auPoZGQgiWExLFjqQ/WsoQHTSh1AQLad+HsUIkiZuVboMwwG5
 CdSu7uJ/8dCsECdjtNblkQNPZbb687SykeJeV1mAzkm9RymqjpgN13ag5p/PwzU7+Qqq
 ITKCMnDMj7dQfWpdANu6zwIPxWjNq+TolwbMC4wwYQZVCJW6Swk55GJLurh3mCBbMVrM
 dXLqZtHyn0pi86fvqsphzeOOc7xJbjsP7IGdUWIB9h8Wg48gY3XCNvN6EF2+0Xlse/5u
 o41/+ldUgtopN+9VIbFxZsM3JyT0Hp/QPLycFAznItkyF48RvF0/ivxhdFqo8LV2pETP
 PGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687570969; x=1690162969;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ABZIpr9ZPthPG5kXqvTW8Rk5Ou0ROoLl20Thcdzgw/c=;
 b=csOBQ8FeNMgq6BElN7bC6A4AweMrv6xb+DIvgG6n321Erzb7O7DQC5LCwUXUE5bRyb
 OpfdqkAw5wsq2mNktX8YOIQVd+X24gyyiyq4iT6+qbSmCfaXrTkh0j3Qj2z2xH3YVBR9
 4b+U+N0zoaqE0K5mUDExjsQdmn92rntW7DoQsNPl6x/39W32VlLS3rLHU6q0bjz4wu0m
 CP9KGr360xT4a68sMIiIy9WCGoJcpYVsAueMgX4A5oiFGnMuJmAH5glXx84S9qMmX+9V
 ibtpbStl+da3bTeOoMUz2XRBYmdKGzVwAyWzzywqHIfpMK/qbati7aDcVdCVges+XwIs
 9A3Q==
X-Gm-Message-State: AC+VfDwsvfmZA5QjUfZtXqJbpB17r7GEIajLKnuDczrOGvLL9e8I0dl6
 wiEXZKgUWpLjD0QlZa6hyWI2+g==
X-Google-Smtp-Source: ACHHUZ6XXA3DQLeAWzirtjDtvmXD+F18W7u2zYLlyKgJF3mFy/ep6QDlKt+rpO04JFu+dKDnag1Gaw==
X-Received: by 2002:a19:670f:0:b0:4f8:7528:50b5 with SMTP id
 b15-20020a19670f000000b004f8752850b5mr9893706lfc.14.1687570968988; 
 Fri, 23 Jun 2023 18:42:48 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f13ca69dc8sm98316lfh.72.2023.06.23.18.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 18:42:48 -0700 (PDT)
Message-ID: <035ffdd2-27e3-99bc-f8a4-41e66685db09@linaro.org>
Date: Sat, 24 Jun 2023 03:42:46 +0200
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
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 00/15] drm/msm: Add SM6125 MDSS/DPU hardware
 and enable Sony Xperia 10 II panel
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

On 24.06.2023 02:40, Marijn Suijten wrote:
> Bring up the SM6125 DPU now that all preliminary series (such as INTF
> TE) have been merged (for me to test the hardware properly)
We should not repeat the same mistake in the future.. Finding a
balance between releasing early and releasing what we can declare
working and tested code is hard, but we waaaaaaaay overstayed on
this one..

Konrad
, and most
> other conflicting work (barring ongoing catalog *improvements*) has made
> its way in as well or is still being discussed.

> 
> The second part of the series complements that by immediately utilizing
> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
> 
> The last patch ("sm6125-seine: Configure MDSS, DSI and panel") depends
> on (an impending v2 of) my Sony panel collection series [1].
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org/
> 
> ---
> Marijn Suijten (15):
>       arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
>       dt-bindings: clock: qcom,dispcc-sm6125: Remove unused GCC_DISP_AHB_CLK
>       dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
>       dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
>       dt-bindings: display/msm: dsi-controller-main: Document SM6125
>       dt-bindings: display/msm: sc7180-dpu: Describe SM6125
>       dt-bindings: display/msm: Add SM6125 MDSS
>       drm/msm/dpu: Add SM6125 support
>       drm/msm/mdss: Add SM6125 support
>       dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
>       drm/msm/dsi: Add 14nm phy configuration for SM6125
>       arm64: dts: qcom: sm6125: Switch fixed xo_board clock to RPM XO clock
>       arm64: dts: qcom: sm6125: Add dispcc node
>       arm64: dts: qcom: sm6125: Add display hardware nodes
>       arm64: dts: qcom: sm6125-seine: Configure MDSS, DSI and panel
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |  17 +-
>  .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
>  .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
>  .../bindings/display/msm/qcom,sc7180-dpu.yaml      |   1 +
>  .../bindings/display/msm/qcom,sm6125-mdss.yaml     | 206 +++++++++++++++++
>  .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   |  59 +++++
>  arch/arm64/boot/dts/qcom/sm6125.dtsi               | 244 +++++++++++++++++++--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 173 +++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  15 ++
>  drivers/gpu/drm/msm/msm_mdss.c                     |   8 +
>  15 files changed, 712 insertions(+), 25 deletions(-)
> ---
> base-commit: 8d2be868b42c08290509c60515865f4de24ea704
> change-id: 20230624-sm6125-dpu-aedc9637ee7b
> 
> Best regards,
