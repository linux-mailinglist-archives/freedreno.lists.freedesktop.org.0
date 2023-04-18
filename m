Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA56E65E4
	for <lists+freedreno@lfdr.de>; Tue, 18 Apr 2023 15:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5703410E67A;
	Tue, 18 Apr 2023 13:30:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82AB10E67A
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 13:30:42 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id sz19so16148276ejc.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681824641; x=1684416641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rffFnl7mfjezGYLAktfVaaITh/gwflzEth7uD6ZC/cM=;
 b=I5eEix0qVq0SZl6LePburT2lrcPY9omUYZ8PmE++6NBF67yQ0ze2mpF6wb4Cmgw/pD
 xWQ3ro43dl+zw8hza5uydu/o8vSq++PgPVK98u3A0Wnl5bqZmGyd310bZwWkP0l2sMw5
 z6Yy1SBbFdx7bDyMWYsKVEcaqhj7vQmOjGkGgaANM1pku79ENItxKjp7376/TOeeCGdF
 pjZ85FFvXds7Wx7buAgos6OwLt6OqkOaNvxGaxOlSTWzKPGJ9IlrJeLI5KhaeGhuvLv/
 RpTP/paZReyjbfUlSPraITZm06nQ6fAs77PjQ/DVe1oP8hWzpW+5hmyncPufTmVZFH0Z
 h6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681824641; x=1684416641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rffFnl7mfjezGYLAktfVaaITh/gwflzEth7uD6ZC/cM=;
 b=WH0dsNvbTv5rSlDiyOmYOcPD0ap3Wzc5dZk9yH1vrS+CX+DX30nEJ8tTelJAEHBVsu
 o8CTRXh7tUxlwOZui3htq9BWkWVuTwbM/WRg9wvhzGuci3ae8N45IAAGpk8FlUy/lG0T
 yGKTpifLaPCz2uXTdkWcpHeA2lXgnY4iWjfM+WWlpPRP1RDY4nib923LF2YrJjK8TSqd
 uURCRdrWqsTtYkxVM5Rf8Y4CDOSGAO0UsuS/xVQQ6GTS3NwP01J/l/VI0Z7S9IXFSLMD
 EAn/zUHS0fzrF/QsxN3+I3pE1oX2ZiA1+muWLj6RfoZxj84UjI6N4ietwbSCrLpzMsH2
 ujvg==
X-Gm-Message-State: AAQBX9f79c1CSvLGhKdkhtU7z7Xo0GXAkslh4apJrmMtFBW84m8xPLz3
 oU7N0dwDJXQ7IOUHfzGbGByuZg==
X-Google-Smtp-Source: AKy350ZW4dBad0JSllW5uCiWq3kVnCQW9P3yk9AHbLDu7uN4k47WQuQO54FdCJYumwP+hDNYtSM5ew==
X-Received: by 2002:a17:906:b802:b0:94e:61d3:d13b with SMTP id
 dv2-20020a170906b80200b0094e61d3d13bmr10632661ejb.75.1681824640821; 
 Tue, 18 Apr 2023 06:30:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77?
 ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
 by smtp.gmail.com with ESMTPSA id
 kt2-20020a170906aac200b0094f6458157csm3523268ejb.223.2023.04.18.06.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 06:30:40 -0700 (PDT)
Message-ID: <b781b14a-0bc0-3e3a-e803-a54f24cd58d3@linaro.org>
Date: Tue, 18 Apr 2023 15:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
 <20230417-topic-dpu_regbus-v2-1-91a66d04898e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-1-91a66d04898e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/5] dt-bindings: display/msm: Add reg
 bus interconnect
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/04/2023 14:10, Konrad Dybcio wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
> 
> Describe it in bindings to allow for use in device trees.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

