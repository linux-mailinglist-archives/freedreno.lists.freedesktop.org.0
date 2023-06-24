Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B882673CB16
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 15:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693DE10E13D;
	Sat, 24 Jun 2023 13:48:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F9C10E139
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 13:48:45 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so2048949e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687614523; x=1690206523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9YJLCIpYToQE57X7+5G5EtcnZ1RMPAgUeTIP11pd3U=;
 b=yHPJtC7Mp2cKx/Prulu7JGSmBR2bUP0DTFHIsXsdA5OrKiie2bdUh3DlzVcyickWop
 BrP9M9h3zu3fXX2393zawF/mVYsSPomYUzmEnxwy5CSLSa35xCek3z8sovdA7k1cyaSt
 95R8yiJ7phSb/skwB+BYeVTtus5kcH38LmZzGscMFWb0KIdWXrEDKZZOgr1LrVMCqqx0
 nhGTvmDPk4L+zv4yxSbzGg1OrVpAS2waKKVPVwSeXe6PCUhzZ1TU6zWgoC5NrutHz4yg
 5cpEvcNJVmDF2o+6GEjdfvsfarw2HIj7vS0HsSoTWELYkjYX7QwiXrvVsQ9GPsW8VTtO
 B4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687614523; x=1690206523;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9YJLCIpYToQE57X7+5G5EtcnZ1RMPAgUeTIP11pd3U=;
 b=jwVPxFpgGjTFRbM3hu5JwjFsrTXiT2NBXM7EY4Akbjv93b1hVQGjXPHs9COk+8xDrf
 8iIKFzdBuCPRMr8XaA8NAbFAUfg8dchLLsjCJUBPpb/NJBO2+NkCsZ+EujdTXTRk6mYl
 TAlTw1vbAwaLfRgSynfNKUH1j7MO0x3mWPaZVAgaOkOkKLcD2gATiFJg1tzCII2TRwAp
 Zf96ML8BZROSRoOzAmPJWIJb4Q+PUYZ/MBhHQD526Wy0MxJgq0yfd1l6LvzADiSluQ0h
 lz7w6mWPDWAgduv0URi5roJDKg0sRQ2P10T8rKb3RLOr9SKI6xfwl1wpf70nx6grJ/c3
 zjIQ==
X-Gm-Message-State: AC+VfDxR/M3USWmYYbLWf+TAVHSw5oAUcVzgZMyQGT/uIUxCXuJFBpEt
 j7TTPaBckavQFraFIX4UNnTpow==
X-Google-Smtp-Source: ACHHUZ42jKtX7W+P46oaiEZR1+/HWcRGkV+LXkEy7ADI+/OMe3SZiS9nVNJQHkJyEVtg3yvpJlSVwg==
X-Received: by 2002:a19:5007:0:b0:4f8:52a8:d123 with SMTP id
 e7-20020a195007000000b004f852a8d123mr8242945lfb.12.1687614523211; 
 Sat, 24 Jun 2023 06:48:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x11-20020ac259cb000000b004f873e3282asm284858lfn.63.2023.06.24.06.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 06:48:42 -0700 (PDT)
Message-ID: <1b40b16e-025a-c10b-e99b-404246de73fe@linaro.org>
Date: Sat, 24 Jun 2023 16:48:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 10/15] dt-bindings: msm: dsi-phy-14nm:
 Document SM6125 variant
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/06/2023 03:41, Marijn Suijten wrote:
> Document availability of the 14nm DSI PHY on SM6125.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index a43e11d3b00d..60b590f21138 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -18,6 +18,7 @@ properties:
>         - qcom,dsi-phy-14nm
>         - qcom,dsi-phy-14nm-2290
>         - qcom,dsi-phy-14nm-660
> +      - qcom,dsi-phy-14nm-6125

Should we start using standard scheme, so "qcom,sm6125-dsi-phy-14nm" ?

>         - qcom,dsi-phy-14nm-8953
-- 
With best wishes
Dmitry

