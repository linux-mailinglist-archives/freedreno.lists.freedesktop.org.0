Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507172682C
	for <lists+freedreno@lfdr.de>; Wed,  7 Jun 2023 20:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88AF10E53B;
	Wed,  7 Jun 2023 18:11:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4B10E53B
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jun 2023 18:11:54 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5149aafef44so1791197a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jun 2023 11:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686161512; x=1688753512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=38gFDOgOs7OiOboCZ97J7wgn0Fj+LylW3p4y2EEpitY=;
 b=lpv2yfhVs1ay4EQ/axvCEim0SnJftwinn+5AL4kiudbnjwRCz8+AwbFewKwK0pYXcm
 m4xcxqBrZWkCJNQ5XkGbLldksMjNL9ys+rNBkLDmbLCdIS5ovgRA6+kR91H3dMyS9lkZ
 ROCeEHqh98oSIg6SOUfyHh03KqzwZ64+uehdKviePDHwXNinpPey5n/s09H46aPU7x2t
 +ePVU/JemqY8zfkFP1BUkfD9o8yZ3DFNxS2idpdLqTUCXbei+uyv8Lsar8NP0kdz5ybr
 AL7jEWg4R/F5Cinb+UXx0txTu7jweBEOImKOeeHWgb3fm5EMclTY6D2nAHKp9olqMoUk
 OPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686161512; x=1688753512;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38gFDOgOs7OiOboCZ97J7wgn0Fj+LylW3p4y2EEpitY=;
 b=BYyObflTz86YA9ec5yMDhtr1FFpaw7y0FRllxdIbUT6kGBnGyD4DhMQzOwGC3i4y2G
 aKoJqoFRXB9xWdgglZgIaZWF6yl539qiVRatJjtdD7TwzIqQBIat2Bs9eiOtGqr/38Jd
 VG0FO9toW66CrWjwujEBi+G35qKaVB1ZLfes0jW1cte4Nh5fD8vgQ80WhiPY5zgXWvWK
 LTRBIs/7FtrVo3TVLOzju9wa+2jVIiFTqdMcSLnOQfAz8nmVdl741rE+H0Tuf/IKt5w1
 bPKBI00GlKFZc41QUyP0L6h85T/ep36KDEG5zBGM0SmHDhypCninhiVnv7tjL9API9l1
 HN6Q==
X-Gm-Message-State: AC+VfDwoX+ILffaBxj9oavMRPR2MeuOBjjiUDOXhSoDkkmR2R1BbzTlP
 EPpQJP8EZja4LrtmkwivW5dpQw==
X-Google-Smtp-Source: ACHHUZ6QlGsiXyrJcXM30ikCxTwLf17/dt+bW4ffQAr6CkTuL+AYvsWCQwfGH415M7X/kOv0SIGcWQ==
X-Received: by 2002:aa7:c3da:0:b0:514:7f39:aa80 with SMTP id
 l26-20020aa7c3da000000b005147f39aa80mr4770123edr.18.1686161512431; 
 Wed, 07 Jun 2023 11:11:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a056402181000b005149cb5ee2dsm6427652edy.82.2023.06.07.11.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 11:11:51 -0700 (PDT)
Message-ID: <7107e83a-c607-41da-f606-277400d40010@linaro.org>
Date: Wed, 7 Jun 2023 20:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
 <20230411-topic-straitlagoon_mdss-v6-4-dee6a882571b@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-4-dee6a882571b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 04/12] dt-bindings: display/msm: Add
 SM6350 MDSS
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/06/2023 14:43, Konrad Dybcio wrote:
> Document the SM6350 MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 213 +++++++++++++++++++++
>  1 file changed, 213 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

