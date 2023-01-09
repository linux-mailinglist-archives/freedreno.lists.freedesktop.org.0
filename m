Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03DA6621F4
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 10:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50FD10E39F;
	Mon,  9 Jan 2023 09:46:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB3E10E3A0
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 09:46:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6142048wms.4
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 01:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4d8EU52tZaN8G55CHlelx4PLWRYfjxDBelNszuGiEiw=;
 b=KUmkgF4xkeZQoHP9ibXijiP/e/GILo50shdSk89ikoT8/BA8BO2EGXIvIF2WFNTV+1
 JPFX5FIf486s8sSAAiZSDGqsmCE5fYyglloPO16ZWLgLcz+wygyNVbmsAl5nK/aTi7Q3
 kM48oiHgk7u8v8Iq6hzvG97Fn9n2uhoUR0tdX8yl543nHBEmgsI/XZhLMyren44H9vVJ
 cTymjKh5W2UmRTbiGF/TtGYayVDUVOyqHIkMH/agAZ5eQGiWh37YXp7BUQTPjyG6n5nF
 FexF16UWSg8cyJqZbcwXTj2gjMtZ0nimcXGeqQqIFv6ZMg/oyC6j9ncT8qPzoyysDPdc
 XuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4d8EU52tZaN8G55CHlelx4PLWRYfjxDBelNszuGiEiw=;
 b=J4IsZLc5D21Ub3y6SDenrc+TRKJXuqg0VKOp1JkE+wubyQ0G8/PPCz0314GL4ur2pV
 U7AweC8xN3BavfgEaclwMAXmpKObJoozK2hDk23LySwA8mntg702/dheL+9ZylTVP9vv
 QR/LpSJHzcwoegYtUQqYVAFf5CFwlHFMv9CIP8CqOlphYR99VcVFVHt1kmaVXNR1NI1Q
 gmg0/N8j9MazVtI7/GZYqCUwuVFxvlWh25kk0Gu4d3rMHFpwWFJdrFvCN0dPqSqH+Xwb
 3IF+HpttIzCiJK6luLyri/o6TndXokA6DYK1tt3P13j739R48IJKGeipOvkdsIwd6Zuk
 TErg==
X-Gm-Message-State: AFqh2kqJlkx92fSUVkJcmPMEQpk5k7dIIT6eNdHx2LB4NPeboe1ZxUth
 FKPUG5z1OYwAg9MjMPGCT/sfsg==
X-Google-Smtp-Source: AMrXdXsst/5w9cMBLN5E3W/1t7/92DmGAnG7/U8umolo0ZIPW0BiFLAxDkZ52kTSEB1g43ZxaWdssA==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr46167223wms.36.1673257571331; 
 Mon, 09 Jan 2023 01:46:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5186000000b002bbddb89c71sm4219198wrv.67.2023.01.09.01.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:46:10 -0800 (PST)
Message-ID: <fae25e1c-c485-af1c-ae13-1a9e443d932b@linaro.org>
Date: Mon, 9 Jan 2023 10:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-2-87f1c16d7635@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-2-87f1c16d7635@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/7] dt-bindings: display/msm: document
 DPU on SM8550
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/01/2023 10:26, Neil Armstrong wrote:
> Document the DPU hardware found on the Qualcomm SM8550 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 134 +++++++++++++++++++++
>  1 file changed, 134 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

