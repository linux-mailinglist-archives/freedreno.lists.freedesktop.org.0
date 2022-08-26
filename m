Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BFB5A24EB
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08B510E819;
	Fri, 26 Aug 2022 09:49:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0D910E819
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:49:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id bx38so1053285ljb.10
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
 b=d1nSLkhbrdejwMFn1KOzIxhMbISvE9dkw2GzI0Y7U9LKhmPsdU3SRgViqhhXOyeajl
 7MbraVMYy1297njGx4aE0/zxZdRtTjtM/ix23VUqFNWG1/QqkCzPDGHibRE/1koKNa8G
 COui3DNktwzEbduZe8148dNYMkHTph0MFQSTNax21JmV7gEBo5+VKofjV2biZqvWx+oS
 8Zkoda0Gp2ve/81BaS1KhTgVye5s0iS5rRUNj3JgdBtDuZqwFncsQeHVDWQmU89VNoay
 99f5IosEbRYSUU4BgrLEz7D13wuPF7LMD5oauszVP1QRGnXoYjHR/1KP2qmlwkNip4my
 Jz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
 b=3pHDXB86JSZ4yDaFy7nYZBEO6982niRv6hqGX0SDmmvGwnpyJrJM++RK9fICkl7MJ3
 RgLHaTUwI3+wFvCtae29MSWP0WcF+lki1AE1KRZCabYNO+q7DuTgTzmxftlpsaCnxeM/
 vMBxY91fyRezZSgT5up5mBOdh2BH9SnB3d/tbZUP7+pw6zbPOM9N1Y0rzvZJaG5f/7mG
 udbCqkJTnI1ylMUA5XMqZPRD3p+4rEGzlX+FvFewt+iYoJhr4jT5W9KWgSh5off+Hidy
 lWIBoAYaN6hgUORsJnkacIEMmKH4H+W/x8LyAm/Nk7CtZzgdMxLHJB8/xiRoBKl2vPP6
 wCVA==
X-Gm-Message-State: ACgBeo30q50w2UWewCIclvplri0i1chWuiLLJL7YBV2cfdH1kxMNJ9Ql
 sJaNjXx4fEHzkRkGBvkS5aEXqA==
X-Google-Smtp-Source: AA6agR40xBnaJlt4y96z7hQide+xi8Mu/NLv05DSdTOgVzbHuyvjhtAMDPEwIh7iOcbU1H66d7/K2w==
X-Received: by 2002:a05:651c:238c:b0:261:d468:d633 with SMTP id
 bk12-20020a05651c238c00b00261d468d633mr2085578ljb.479.1661507380275; 
 Fri, 26 Aug 2022 02:49:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a056512314600b00492e0be5f4fsm335755lfi.34.2022.08.26.02.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:49:39 -0700 (PDT)
Message-ID: <15a6ca5c-75e4-c901-3813-dce0d1dd0d14@linaro.org>
Date: Fri, 26 Aug 2022 12:49:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-6-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 5/5] dt-bindings: display/msm:
 dpu-sdm845: add missing DPU opp-table
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 3d7a0dd8f39b ("dt-bindings: msm: disp: add yaml schemas for DPU bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

