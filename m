Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726C693279
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 17:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42F610E149;
	Sat, 11 Feb 2023 16:33:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509B410E16A
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 16:33:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d40so6637856eda.8
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 08:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kx45aI5MoVIFzyTEpOI8RmqbIW54Ij/B0GNnIHLTWaw=;
 b=kAaF12q22GV2jAoFjuxVc17Gxngk9KuA+fuJLgUig0gx6gaMam6BGZ/y+YEyJXVsZ7
 3JjwpZ6rWvQHNyYKtwu1jqja7at/grXLDb94AnRpQxkNV4zcvtv+CbxBulm7HOkYq8Q0
 jotvUZMyTdSNuNfEXcpGguJl4hskq0IW6OwIZ5y0z3W9kuLXOAvomteqlY7ktbFJIdj+
 hdsW08RswAcprTxFBlw9o8EH348n7jr6kdzlGCRUEdEPjn+An593IInWDdamVa4NWHSY
 P6UNYgQOQhIVZ1VSlpALVF375IDml2rWhP8jdbH1Wk43wMHcNjYG6dgNYLIM8XTTVm83
 CwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kx45aI5MoVIFzyTEpOI8RmqbIW54Ij/B0GNnIHLTWaw=;
 b=0F3fyHRwu960lxkL76th9Ki4owEWceYyrrR1I6eNrAnj+aVHs/MpfW1d7VB618iaip
 MR+EWTGqMFqo+b+RZsgXr37RUzn8lby26LL9dGy2CkLhSOQfWfuPctZsP95vZWuavWQi
 jOonvRkm8l14ZlJkFWnmHSqiFXUODxqnLxsg2uyf9qNOByhYszk5mC/0kcqGERjPpS15
 dQryCDN/0VnR9SmhHxdHurfh1VzeRlTlxZowLndOkdhvYQBTuHAX4UQmlI8a1xeJe07w
 E9+l0Emg7TzpPnk6a0GWizcTWWnF1AzJKzY6Nd6spbMysAFyT8g8Uy+o2GU6JvjG2t5v
 DH3g==
X-Gm-Message-State: AO0yUKXQmZoV3dyHFiyTfnuuZ4L+DKscMMxLnCRtX8Blire72E2QhGWK
 Q+XDU/CzCJEUC0pVzlqET4arwg==
X-Google-Smtp-Source: AK7set8IQyTpkJ45KUL+RTTH5sucoHYIkehu7H0vxwYZf81qJBhyEoHmznfYTYPaQr9hV4vDMxGgFA==
X-Received: by 2002:a05:6402:268a:b0:4a3:43c1:843f with SMTP id
 w10-20020a056402268a00b004a343c1843fmr2391061edd.19.1676133224840; 
 Sat, 11 Feb 2023 08:33:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090666c700b0088e5f3e1faesm4041134ejp.36.2023.02.11.08.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 08:33:44 -0800 (PST)
Message-ID: <869e0a8e-f960-afe3-2048-d0a2f2b59588@linaro.org>
Date: Sat, 11 Feb 2023 18:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-4-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211122656.1479141-4-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 03/10] dt-bindings: display/msm: Add SM6350
 DPU & MDSS
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/02/2023 14:26, Konrad Dybcio wrote:
> Document 6350 DPU and MDSS.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   .../bindings/display/msm/qcom,sm6350-dpu.yaml |  94 ++++++++
>   .../display/msm/qcom,sm6350-mdss.yaml         | 213 ++++++++++++++++++
>   2 files changed, 307 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-dpu.yaml
>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6350-mdss.yaml


Could you please split mdss to a separate patch?

-- 
With best wishes
Dmitry

