Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51EB6254B9
	for <lists+freedreno@lfdr.de>; Fri, 11 Nov 2022 08:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2E510E782;
	Fri, 11 Nov 2022 07:56:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849D610E782
 for <freedreno@lists.freedesktop.org>; Fri, 11 Nov 2022 07:56:25 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id x21so3643961ljg.10
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 23:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w/Iu4CEI39UAfFhQsd226xNTRIuJLpZNpM7aahMWDJI=;
 b=YLAMmPR8XvFijVBooaEVEjc7fGWjM7VcDGaePHyH9FX1PSQZLq6gmxDD5xY/Zx6VUJ
 qMVwx7Rfswu9pwAofNTTULIiUVirrNtZ9iZU42OGoQqxZUkv/vwMVhkJBi5guLi+2v5C
 weUM/HZ4vSypxstT8j3HcjyTHmfI+hdfIkmQRJzsXS8ZO0eM4dNFdOiEAc9O+vHOt3xt
 iR8H4zytTyiUGJc/YiygBY4Kgp+RHMvcPi46xgX0oWRpTkvrNwIlR6fFxdOcUvhaVE9A
 fYoFuoJ0fFJ+iRrnQqhE9jHx8kM56MgxaDBIjTkrlcwrgkWVftYoSaIjjJVGOFrUEJ/A
 nhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w/Iu4CEI39UAfFhQsd226xNTRIuJLpZNpM7aahMWDJI=;
 b=hilR5sfq3c6Qi+AB17YhQBLfu89jTEnSz3sC03f5Wfq8GIvwa5r/O+CpZfnLUg1l6E
 3j0GIvb4RT2k2ExLE4Lp6ZxAK0xGsTFZtf/J5al4ZG2r7VgWdKNjvRYgm3PzMGD0fXtk
 JFZnK5uzXrdkMagVHJ15f8/uHjMpc+FMierY7xAdla99NsYPx9c5Og8EDWqJ43QsrcTb
 VKBxRSCaFIBfxBw/qwrQmlA8Cq/LK9A8NWnJJpkg+mnX9KJBmG7zSiyCkKD64HbrBrr9
 hVRZwRHzQv+Ol/8o3sSraGS4yq1zMBh4qxjOwG3dXnoPgJ02+yrQubC6+SNY/pWn0EdE
 5GLg==
X-Gm-Message-State: ANoB5pn975yDT7DAB6XVQeTSsLcDbAExzp98niGXFkf8JyYcDUSW0Gzu
 RaUtlYmd8h7C1dvNcorIOsScEg==
X-Google-Smtp-Source: AA0mqf4CXgp6RSjsayp7+lJEN8b658DQOYP1PwWFxEKDrjbMnsfX43KI8kyV2Q+vJJahTAHG9L8cQA==
X-Received: by 2002:a2e:908f:0:b0:277:328:affd with SMTP id
 l15-20020a2e908f000000b002770328affdmr283115ljg.517.1668153383421; 
 Thu, 10 Nov 2022 23:56:23 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a0565120b8700b004a240eb0217sm199790lfv.251.2022.11.10.23.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 23:56:22 -0800 (PST)
Message-ID: <a187db7b-1f42-af79-f50d-3f71f378c010@linaro.org>
Date: Fri, 11 Nov 2022 08:56:21 +0100
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
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
 <20221024164225.3236654-6-dmitry.baryshkov@linaro.org>
 <f72aeaa0-0c0a-86d9-0b9b-db3810c35fad@linaro.org>
 <b62e7239-0fef-e19c-5653-96f72b7b89b5@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b62e7239-0fef-e19c-5653-96f72b7b89b5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v9 05/12] dt-bindings: display/msm: move
 common MDSS properties to mdss-common.yaml
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/11/2022 22:45, Dmitry Baryshkov wrote:
>>
>>> +  - reg
>>> +  - reg-names
>>> +  - power-domains
>>> +  - clocks
>>> +  - interrupts
>>> +  - interrupt-controller
>>> +  - iommus
>>> +  - ranges
>>
>> Keep the same order as in list of top-level properties.
> 
> But the order is the same.

Yes, you're right.


Best regards,
Krzysztof

