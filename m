Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA1E64799A
	for <lists+freedreno@lfdr.de>; Fri,  9 Dec 2022 00:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E5410E1FA;
	Thu,  8 Dec 2022 23:15:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC9F10E204
 for <freedreno@lists.freedesktop.org>; Thu,  8 Dec 2022 23:15:06 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id p36so4346582lfa.12
 for <freedreno@lists.freedesktop.org>; Thu, 08 Dec 2022 15:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7MLWqHmXw3e31A19JR59i7HY0RQ5DxjozWj3XhLsrl8=;
 b=Rc9ZeeWN3T4pFCyd8oR4JeEfHi+caKb82imwtttTViOt1NE7dQHgPsOR4BDnEG1D1z
 d7IdDrM1gTVuriCshf4VteM1/hJT7noha6pzIQpo+GlqTL6mQ6hDAH35HG2JnKLGO/NG
 egVsBGp9vQxb4M1hFQrvO1KnwFJ1RvfGLNuy4Dgjs4yTvbFRNMzLbmn0n5eCDrkuSkbj
 yRS1YO+3VOYgveiUHmHKV+5qx/TB+iXO3hQd0WjCLGMAUVnS9aChTMyCTE5Rvb1kRHdP
 EUNEM0cecqrdbNhxVx8xkMP6i0U1uLAv6peoDl9dG4P7KVkgIvEE52FBGUHloHPQ6al8
 yYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7MLWqHmXw3e31A19JR59i7HY0RQ5DxjozWj3XhLsrl8=;
 b=0augAApeOzQ0Mc9K+7X99zKKtwbh70if8+bG551LZnJS4CmX633h1OndVnapwfYE28
 5UwuWmWjPxozBCLSxsQnjgHZH95vMSMIt5aimJnhD4MGFBgb+28bOxqlTSdFfor5BF+v
 k3F0IHmyYU9OlDWECK3PotZ3Rb300Loqhip8WrFA2KbAzXyaBf4zUJDbq2ceeqpOed2s
 tCn4EiCixHAAeBGLReNXUjJh4DVRAQkr/7pGcUNPPaseKxUIHY/e6TE88PrrZLbNa2QR
 EdIQVOHZEESPQy/zU5KGOGRKOs8s1HYuFSlsk187w4UMigwTDK9YLeMqPaVXDPPCWmrz
 ZRVg==
X-Gm-Message-State: ANoB5pkY20fBlYvq8KyxDtrUvTL6KECuf4LJKVp975YfTftqwHqX0Xxg
 XgjtLhuLD3AwZM+4GRkzCu2DHA==
X-Google-Smtp-Source: AA0mqf6siW3890I1w3DufKwd9C/HMgXgs7NHanLd8th0sy7Rd98xbdw8OKUW1b7TN1BAj2kJyozw7w==
X-Received: by 2002:a05:6512:e96:b0:4b5:1bbd:3a64 with SMTP id
 bi22-20020a0565120e9600b004b51bbd3a64mr1192539lfb.21.1670541304622; 
 Thu, 08 Dec 2022 15:15:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n10-20020ac2490a000000b004b58d457f2dsm1123994lfi.61.2022.12.08.15.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 15:15:04 -0800 (PST)
Message-ID: <40327ddc-dc6e-e803-acb0-310aad63515e@linaro.org>
Date: Fri, 9 Dec 2022 01:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-5-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221207220012.16529-5-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 04/12] dt-bindings: msm/dp: Add SDM845
 and SC8280XP compatibles
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/12/2022 00:00, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes since v4:
> - None
> 
>   .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af8256f..a1dc3a13e1cf 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -21,6 +21,9 @@ properties:
>         - qcom,sc7280-edp
>         - qcom,sc8180x-dp
>         - qcom,sc8180x-edp
> +      - qcom,sc8280xp-dp
> +      - qcom,sc8280xp-edp

This also should be added to the eDP conditional, to allow the aux-bus 
child node (and disallow #sound-dai-cells).

> +      - qcom,sdm845-dp
>         - qcom,sm8350-dp
>   
>     reg:

-- 
With best wishes
Dmitry

