Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC56D7475
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 08:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7AF10E2FF;
	Wed,  5 Apr 2023 06:36:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A21210E2FF
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 06:36:29 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-501df529967so219130a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 23:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680676587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9yvcVihuH9wEZQZUx/B/kZ5+djU5fILXyRrycwbFq1U=;
 b=TvQBbCSWXYhS77wmCXyqApj4VkHr2Zt7VkkaLE4c0orGQF+GzuHRlgay5y0SVMhGhA
 732IXN7OjWQOo7yAqqCoiMawA+DlZr5YRZHkUqmoah2nQB4UzixnQhM3B81Uk0xghNQO
 nD6IDscAJDPRAnqt2sfn6tzpRUQqTsn5mGsMn+RLt8qllPCsF/PT3rih/fDm+xapzJIF
 kUoAELCA0O4FukpwiGXOBIFhY6UGTOSd4BSir5UxAsXW9reiJpfF79FszmSAemr3PotU
 6SKB9DAsDrx79cGo4IdvBAoZXGm5IQBkIwPHIX/scNHyVWxSMVlFSoG1GhQXeY29vhdv
 zhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680676587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9yvcVihuH9wEZQZUx/B/kZ5+djU5fILXyRrycwbFq1U=;
 b=Nk8BE9iGamk+hLqBoYgvTYIkf300LwTEpcMJz70f8JW62TYWCDMcMb8d3nbgCgYFZR
 Y5K45OTTUxroAotEWkJ5T3rd453fYW0CWn8Vq5UA2ldgXZkakzwYIMG5IUoIxCI95Uba
 GI5Xhwflh+28+urVlGDVFKU6FXz5ROacOeGHh7YEszVxHJ5NmTx+IbM9bP+3DbztidPR
 rdem8nl3wEj02xVqovscRGqkbBamYFQ7oy7hu7eStunhv3hysUCvmDAGPC/4sYPyHWpi
 xKwpWEmK/PIp4zvf0X/fJ8sKzTnUF8rjPQqaPXUJsRsrs6l5ENAto/3mCuecm3HuJnMw
 TRUw==
X-Gm-Message-State: AAQBX9fPTicQrBy4UEl654mE5vquPrW8bpPdAFVQ2rOk+FasU1/8Ni6y
 58oStbhtuTWLpPfbiKVcemJRLg==
X-Google-Smtp-Source: AKy350aV0VWB0Xp1TErOrOX/pYnT3FuSj6/R0SDUrLH/kFZPjvTo+/Jt8izFFo5rNtrh7uybTcUEkg==
X-Received: by 2002:a05:6402:496:b0:501:d3a1:9a3a with SMTP id
 k22-20020a056402049600b00501d3a19a3amr747028edv.25.1680676587457; 
 Tue, 04 Apr 2023 23:36:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e?
 ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a50cd17000000b005021c7f08absm6794887edi.29.2023.04.04.23.36.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 23:36:27 -0700 (PDT)
Message-ID: <2b65e60f-6518-6a79-42c0-922d4574d5b2@linaro.org>
Date: Wed, 5 Apr 2023 08:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
 <20230223-topic-gmuwrapper-v6-2-2034115bb60c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-2-2034115bb60c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 02/15] dt-bindings: display/msm: gpu:
 Document GMU wrapper-equipped A6xx
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
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/04/2023 13:54, Konrad Dybcio wrote:
> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
> we'd normally assign to the GMU as if they were a part of the GMU, even
> though they are not". It's a (good) software representation of the GMU_CX
> and GMU_GX register spaces within the GPUSS that helps us programatically
> treat these de-facto GMU-less parts in a way that's very similar to their
> GMU-equipped cousins, massively saving up on code duplication.
> 
> The "wrapper" register space was specifically designed to mimic the layout
> of a real GMU, though it rather obviously does not have the M3 core et al.
> 
> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
> specified under the GPU node, just like their older cousins. Account
> for that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

