Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15F6A1B50
	for <lists+freedreno@lfdr.de>; Fri, 24 Feb 2023 12:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3141710E873;
	Fri, 24 Feb 2023 11:20:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5684C10E5BE
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 11:20:02 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h16so53644496edz.10
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 03:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Njm30AQBCiZsl1r/A2bbjJBxbIy+rhISCg90BWo/8k=;
 b=mIiZeEsUWzPmwXGwXcmoWAfjzZYvzoqU/vkxax57FwmpV3E5k28nSbg82tY2DhJ3QZ
 xtulBn3jmkKp5RridDbhwmQELXZQ48vcYSp6Nj6q8TagLOxlPH0eBy5EVVvOzfeKRWmW
 C+ERb6aIlJU1QWWVWfEU0HKhyWKqDM5B0HkVx2D80p7Qk1haolAv8j3yqLNOUKim9p+c
 ZOG9iWs+KpRAWE6U/jfRpobjSlek692ZsXJUP0LLI0dmak+QJIfiASNRWYcsJjKpF/Lv
 C+D5kJWzOJbWqaF6UEJuXr1+6qoCZqreQnnfaRPRcHwT+xKwx5e882GvbnuRcUrTDH+3
 9XkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Njm30AQBCiZsl1r/A2bbjJBxbIy+rhISCg90BWo/8k=;
 b=uR/BqMdCsTbIqQfrriul3v+w1CT5SX6X2J+bmPy8BDyPRE1mB/NzpiJNX1E4ZMSyqb
 MC55hjHsD/Yi8Zj5J1fil7kSkr0KiCjl3/a9MtTQ0yXRoPUkneZyKes5h2e+LkEpgM1L
 kAzOl5SUc+02WPlEV4sXlQVSjTwOtAWg2q7HBefFEtDPTigdFWErt/xO8g70OjemA00P
 HakB+foLqzqB8Lv3Hh1SuSAZfflaW3xlfXanqHf+DZfpd21yajTlTiguPeHOU7cPlxwo
 LP0nTP7+7oMRp2p2cDZR12DxyBe3aFBUmLvKyPVYPM4fZhiMejfAJkOldXUE4M+5tYdC
 evtQ==
X-Gm-Message-State: AO0yUKW2a/txtSedS0hst1e1cEM7o/NFcxIIcT8lmmIz+DZDMSIODf3v
 XphJS76O1S9ffPmTMsWImjGA+Q==
X-Google-Smtp-Source: AK7set8K/SNOhJHO32tZQmCDVnK5BSQ+/EUE74ldpMSsptNS/Vnl5kTCOFqgSob/GlzmFjZqj83ZwA==
X-Received: by 2002:a17:906:f0d3:b0:8af:54d2:36af with SMTP id
 dk19-20020a170906f0d300b008af54d236afmr25060935ejb.76.1677237600869; 
 Fri, 24 Feb 2023 03:20:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 my22-20020a1709065a5600b008bc2c2134c5sm8165118ejc.216.2023.02.24.03.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 03:20:00 -0800 (PST)
Message-ID: <2fb0ba58-c011-7896-9792-005d0ed9ad55@linaro.org>
Date: Fri, 24 Feb 2023 12:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-2-5be55a336819@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 02/15] dt-bindings: display/msm/gmu: Add
 GMU wrapper
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/02/2023 13:06, Konrad Dybcio wrote:
> GMU wrapper is essentially a register space within the GPU, which
> Linux sees as a dumbed-down regular GMU: there's no clocks,
> interrupts, multiple regs, iommus and OPP. Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml       | 49 ++++++++++++++++------
>  1 file changed, 37 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index ab14e81cb050..021373e686e1 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -19,16 +19,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> -      - const: qcom,adreno-gmu
> +    oneOf:
> +      - items:
> +          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
> +          - const: qcom,adreno-gmu
> +      - const: qcom,adreno-gmu-wrapper

Why wrapper is part of this binding then? Usually wrapper means there is
wrapper node with a GMU child (at least this is what we call for all
wrappers of custom IP blocks like USB DWC). Where is the child?


Best regards,
Krzysztof

