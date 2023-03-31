Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CC6D1A88
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 10:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C48410F125;
	Fri, 31 Mar 2023 08:40:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1221410E31B
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 08:40:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id k37so27998365lfv.0
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 01:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680252043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gjXQ5aQpqa9dtTjZKu9qBegMD76XnvSRVVOgnd82YkA=;
 b=vltQKUL3hd9OWaeRLdVX83lC9n5JnQDc4llvdPRGU22FvnP96K9I88V0ANxqtlRKXP
 t2DmmsASCcz5z3tr/h3gtvUX7GSjKy6VuQqYaooHwqPN/PlkdqzDVjHfr9QllImsWqG5
 aW01Olub4vZc6jwBtji2t4P4F2tCSgGweFusFG7gLbcqvrtfsyzpJZUW2t1w4itI7lYY
 47P7raJ7QtH3W7Zpoju4a2yE1Q18SO4+D3PXoYZLYj4tWCoN0yk6BKQMn0plL07ByDl7
 wgkjePVTUHMk4BpyMvopnikvt1g6Q11/AEd/quexyX20zkVSNJEkABjPOrXEs/zutbMX
 9NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680252043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gjXQ5aQpqa9dtTjZKu9qBegMD76XnvSRVVOgnd82YkA=;
 b=d63YXlNfLoe9KeBByHYHCygLYy97YBuXAuKJvf4YmfrzYqF9YGgSxJ08Hpwv2EzvS9
 D+rfj4nMko6zTDCiIHtFueNTYgVLvVsZFFi2lwwxEcjPY51zPsdEUeD0c5q3cqULSoV3
 ep3tUkqwnDhpmk1t8mPK4B39h/ETx07Tpq1qj74k5GlBfG/voxA3MMaNojmEUXAd3HKr
 LGhXKsqff9mVf6oongQZ9EXrsGQqcYGHrv1yrVKZSuaPHUKmmAsbOAj1JfzVjN+nZsbd
 ksw68F0IaVrU74i8LTxPlCVX2r/oj8baGsd7Fa6sfEKx9X9jgVVmaF0vndzJQ5FGuIoA
 Ir3w==
X-Gm-Message-State: AAQBX9cJ3dsyP9BmTTdQ7+oypVUovBPl9WX9dXCCBTwRXitlEhKuZMsY
 2whQu/A+wBYOgV6a+ih3WzTQwg==
X-Google-Smtp-Source: AKy350ZF4EPLm2KOd54BriJCTJPExfvm5KVPdSmGedrby3dOniEiFQ93phf7NAJWdI34ReDhM3A7ZA==
X-Received: by 2002:ac2:5482:0:b0:4b5:8f03:a2bc with SMTP id
 t2-20020ac25482000000b004b58f03a2bcmr7517722lfk.9.1680252043253; 
 Fri, 31 Mar 2023 01:40:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s5-20020a19ad45000000b004e845b49d81sm289545lfd.140.2023.03.31.01.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 01:40:42 -0700 (PDT)
Message-ID: <bdb9c715-3cc9-73b8-e500-d2e34075b53e@linaro.org>
Date: Fri, 31 Mar 2023 10:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
 <20230329222500.1131836-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329222500.1131836-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/3] dt-bindings: display/msm/gpu: allow
 specifying MX domain A5xx
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/03/2023 00:24, Dmitry Baryshkov wrote:
> Some a5xx Adreno devices might need additional power domains to handle
> voltage scaling. While we do not (yet) have support for CPR3 providing
> voltage scaling, allow specifying MX domain to scale the memory cell
> voltage.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

