Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D8C619971
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 15:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306C110E814;
	Fri,  4 Nov 2022 14:21:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDE410E818
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 14:20:56 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id x15so3075663qtv.9
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfe4QYAii/msXqogDnhvJDFD5ejC6/JC1TdZ0YZAnVI=;
 b=FyxE3aSUOkrzTK/QGnh5iwhxJxO5xXxYiHBPnlQynz1BLSctcEwCGCNrK6jxH+LRPN
 wi1al9drpsMVRxUoR0smZMxu2j0mE5aDRe63spjQNFBvpSYaL4yGKIkul4xq2Rugb7fZ
 V7qB0ImNu5yFaKKtsEJuh/eNL9JRTut59ys/uYhHfRd4dvXiMmVoa1rOn7plCP9oaH5d
 jkbWivYhY3PKK28TERpxgGsz5NoijL80qEi5BHDFkAD7CvnA69T6mVIPrh/qdzeSLXr4
 yAT+AOvd5JcuxdulYEJoJxCmT8saxJNVW8KLNMH1xnGGBzgKBtMyt5RaiOkaZuw/hqls
 IrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bfe4QYAii/msXqogDnhvJDFD5ejC6/JC1TdZ0YZAnVI=;
 b=hYcsL0uh8EuuehZHrzvTGh50s/oOlhvVWiJhj6h3Kz3+ETpvvTwJZYYCxsslt4MRqs
 +JfSFNN4brj0orVBaRQXHR9cmLMYH9j3x0Pob4tuJCkThU8j0N0GNdPPY5FT+I4BQwfb
 r8lsmAWPVgl8hc20GbLs0U+VdQvy+XHKJb7LK2fdvYQ0AjEQQ96wFRw3C4sJN5tX0JYy
 92ybjBQUrwTNwEhPhQVBnanIEsXWB/tldQ8oM9rbFusDAyHJ8yzWyI2o1c0A67CTF6L/
 mkADJLx8KGIT/8meYu/Uj0iAAv+kuYEJE1L5++WecXISOSg8OQREw05Mxef/5DRkergD
 a/qg==
X-Gm-Message-State: ACrzQf3L9iLZfuRa38ddUnJ9HyZdcyol7+nTrWVCo4XhQba3loIgbNqe
 ZJ/1gA8HjFMTvt1dG07zl3NxAX4umNBF7w==
X-Google-Smtp-Source: AMsMyM7CV19Vj9XYnilruJJvftU1TZeOxpARoRc6S+ODrtdXMN3RA8hrkRGI8BdB7SK5VPuSclcvsg==
X-Received: by 2002:a05:622a:1ba2:b0:39c:ed3c:6310 with SMTP id
 bp34-20020a05622a1ba200b0039ced3c6310mr28888623qtb.516.1667571655926; 
 Fri, 04 Nov 2022 07:20:55 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 ey21-20020a05622a4c1500b003988b3d5280sm2518844qtb.70.2022.11.04.07.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 07:20:55 -0700 (PDT)
Message-ID: <aa1c6223-e56c-b0b3-ed74-25cdeee36fb7@linaro.org>
Date: Fri, 4 Nov 2022 10:20:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1 5/5] arm64: dts: qcom: sm8450-hdk: Enable
 HDMI Display
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/11/2022 09:13, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the HDMI display nodes and link it to DSI. Also enable missing dispcc
> nodes
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +&dispcc {
> +	status = "okay";
> +};
> +
>  &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +

Drop blank line.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

