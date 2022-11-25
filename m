Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4EF6384F6
	for <lists+freedreno@lfdr.de>; Fri, 25 Nov 2022 09:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4910E099;
	Fri, 25 Nov 2022 08:06:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF75510E099
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 08:06:05 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id q7so4289172ljp.9
 for <freedreno@lists.freedesktop.org>; Fri, 25 Nov 2022 00:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D49i9+CqzhVncl5C6H/ptIMUdWGDiCQ2jV+wEFz40RA=;
 b=n/PGbygZuJrtVuapZT8bdM1579wHkSd3l9IVakzRsfx7SFDPCr6+z1phHUMbC7MmGe
 l/nsjSlGVD2z4Ql58NgWsJHRrVUzG7RoeQrjMaqM9UONFICqoyR0Tw+00DDFFZvIO7vg
 U28rpMxn0j2YvgpkiiuJk42Vm4yD+JEts2R5QBOzdtuVU/Vp4lKR5MUzEZNqADHAuxOD
 zS0pIKtB9DCjUE87vlRxcwXBWCI1crkRmWZ1MYhAUFyqP+rPp4m+y4/YLGju2vOSYkJU
 UbhqOzmk8husMENiGNoJibHkxoCo8tl3yVs6dAgP54EOQNJgMF3o6IU2j6VLBVx2QXTu
 aNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D49i9+CqzhVncl5C6H/ptIMUdWGDiCQ2jV+wEFz40RA=;
 b=twGD7TRcE563yPvDXy5/onXtfUBrphQbzH0oKqBpRIhHyweev3/vKGWUU06g/CeayT
 OiaHimSb6nZCZS8aPLGPrCaLsM2T8WQbEuavtb6n4xjRJpKANciIAoDhRn8Y4Esuualx
 4fggSPnAwP4iQfChkTOZjn4CUv+WWOKxWtOxCrZtrc3C2ycvD9c3GfG+2uJRdoI/RR0L
 5lIlHCfvLrK92zwroXkkBB5os6rxSJOHFsrDi0E9W5MaXV9dlNuFmSATe2MJ2nUdikt4
 DQyt0PZJrqUv2F+eTT4/d6EBtgpb+kpnr5jG9dbEVb/tEyI2js1FbyOfirDiEO+dnhAm
 PQlQ==
X-Gm-Message-State: ANoB5pl5w6NBh6b2LeBFWguRST9CpBLoHZHGCL0+ue1gFjLYL+iCv3Dx
 WW7O5cTpBC5fMyN6K+ZUtnFJEA==
X-Google-Smtp-Source: AA0mqf6VxT1aEXu7weoSccK7/ISZvPA73NLRVTO6wuY9yZQZBdzrp0PjPI71T4AeNAn5MJj15hwsPw==
X-Received: by 2002:a2e:aa94:0:b0:277:871:5712 with SMTP id
 bj20-20020a2eaa94000000b0027708715712mr11000813ljb.129.1669363563955; 
 Fri, 25 Nov 2022 00:06:03 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a196458000000b004949a8df775sm433304lfj.33.2022.11.25.00.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 00:06:03 -0800 (PST)
Message-ID: <8ad024c8-1284-0f72-91a3-2a8d9b5692fe@linaro.org>
Date: Fri, 25 Nov 2022 09:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221124001708.25720-1-a39.skl@gmail.com>
 <20221124001708.25720-2-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124001708.25720-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm: add
 support for SM6115
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Jason Wang <wangborong@cdjrlc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, David Airlie <airlied@gmail.com>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/11/2022 01:16, Adam Skladowski wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM6115 platform.
> Configuration for DSI/PHY is shared with QCM2290 so compatibles are reused.
> Lack of dsi phy supply in example is intended
> due to fact on qcm2290, sm6115 and sm6125
> this phy is supplied via power domain, not regulator.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

