Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27A6D14D5
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 03:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D3010F0CF;
	Fri, 31 Mar 2023 01:15:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ED910F0DB
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 01:15:18 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id t14so21500677ljd.5
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 18:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680225318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6BmwUHFXtEYfgj+i7XENXy4osQG3AVupjWHWnaVA6Og=;
 b=CQLs4bVuM39FyPTpQXGrV/EeAfJUvDf9eNfn25n75Fh36nMj/TXSEFLdhcVQoPMA/Q
 df6IUoo48UfqE+zwCiwMilAR+5jv2bQ58JLA/pjmGIlZ/2kbfMggG1EsHaifNVOoTeOG
 1lHEgcwv3hk12xjZIJOEPZPcbCOSytDiOhpz7yIiPUV5jCH14VsopSRSKuvHjLOeL5DE
 KIwsqHWiobN3rBDr/jCRigo9BDMf7yxFPZBBxbCHpQ10rzlf1LalfsVegwpDUSXYqyaz
 /32mjmKYCsnpNC78Kj1CDm3puL46Z5R3+0/Dlnoc6h2RewVap7duA4mph3Ctzx6w6e8Q
 hY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680225318;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6BmwUHFXtEYfgj+i7XENXy4osQG3AVupjWHWnaVA6Og=;
 b=K0WinNFAcB6N9LgTzwFHACskIRm0m0c09qZ/wPUFzihIxI4yxgmb9MI3/nD8gV9Xab
 xQNqcSkL4OM/hInUHqxRcm9dN83NHjYtIgCp5CEho/VxeOrQ3XiqpMjuKgzozKz82BkU
 y9CJBuOh/SWLp2xBVaVETnKwtUykcy0Q4tjJgeezGpC8Vh/KNqtdSiApoVgu7aJTxjht
 0svYLVlz5z0pu4T3Rfvg9Wda38um/oogBASBYrJCvUPkpCp82DowgCxl2t3yK04zXVvy
 oi3KqxJ6m0azfY7dAuzidldQfLa5GQtSH09RHeSjFF8m4/Cd9sxjDZIhcDzUlQn+MTxz
 IlIA==
X-Gm-Message-State: AAQBX9d4E0Ec9laQouvEPJUf2QJQUPTrOUervdyFZ0IaKww8KnLvtB2+
 rm6aZPXj/0/ceHKTPyNosyiSkg==
X-Google-Smtp-Source: AKy350bR6P7lEDfTAiZfmi7s3E644OFgiDFMieWSdFEl5Kbd0ffdrPX37s421l8YMkMxScF0XnGiIw==
X-Received: by 2002:a2e:9948:0:b0:298:a8d4:7236 with SMTP id
 r8-20020a2e9948000000b00298a8d47236mr7316622ljj.6.1680225318164; 
 Thu, 30 Mar 2023 18:15:18 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a2e9bce000000b00295a5aa9d05sm130739ljj.120.2023.03.30.18.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 18:15:17 -0700 (PDT)
Message-ID: <d09a9080-c141-02cd-504e-b34e9e68f56f@linaro.org>
Date: Fri, 31 Mar 2023 03:15:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 0/5] SM8[12]50 GPU speedbin
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 31.03.2023 03:14, Konrad Dybcio wrote:
> This series brings SM8[12]50 (A6[45]0) speedbin support along with a
> touch-up for 8150, allowing Adreno to cooperate with the display hw.
> 
> Tested on Xperia 5 II (SM8250 Edo PDX206) and Xperia 5 (SM8150 Kumano
> Bahamut).
> 
> v2 -> v3:
> - Don't swap speedbin 2 (with fuse val 3) and speedbin 3 (with fuse val 2)
>   on SM8250 (no functional change, this is all a software construct but
>   let's stick with the official mapping) [2/5], [5/5]
> 
> I kept all of the tags in good faith.
v2: https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/

Konrad
> 
> v1 -> v2:
> - Drop bindings patches (Applied by Srini)
> - Remove leftover comment about missing speedbin in 8150 DTSI (Marijn)
> - Collect tags
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (5):
>       drm/msm/a6xx: Add support for A640 speed binning
>       drm/msm/a6xx: Add support for A650 speed binning
>       arm64: dts: qcom: sm8150: Don't start Adreno in headless mode
>       arm64: dts: qcom: sm8150: Add GPU speedbin support
>       arm64: dts: qcom: sm8250: Add GPU speedbin support
> 
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 31 +++++++++++++++++++++----------
>  arch/arm64/boot/dts/qcom/sm8250.dtsi    | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 +++++++++++++++++++++++++++++++
>  5 files changed, 84 insertions(+), 11 deletions(-)
> ---
> base-commit: a6d9e3034536ba4b68ac34490c02267e6eec9c05
> change-id: 20230331-topic-konahana_speedbin-abe0c725f244
> 
> Best regards,
