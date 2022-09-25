Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190D5E9182
	for <lists+freedreno@lfdr.de>; Sun, 25 Sep 2022 09:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A5E10E1AB;
	Sun, 25 Sep 2022 07:47:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEFC10E1AB
 for <freedreno@lists.freedesktop.org>; Sun, 25 Sep 2022 07:47:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d42so6506897lfv.0
 for <freedreno@lists.freedesktop.org>; Sun, 25 Sep 2022 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IqTYUttp9fReFBo4Q6fCWj5y3UNld99XW4zScIAoz5g=;
 b=jtkTBfZ4MxDYpQ+w+N9ZVw60L4P1+O2El3APHzeCD9adF309Z8MbaLxB45Q+Js/vUl
 yS1IOS1F7uRIZPcmry6p2qTRhqLFCIEsaDh6eoqKTPK3hcDvf/eVklA7ZjwbbYGKRf60
 6GmwAr6JuYBFWV5MUbMk2yoOP6QZAdzjUk43ym0DoJPN5PfoCpPJBDTk8eRyyIt71K3X
 w/DLzaMC/XKpGPkKwidtoDUE51k9CzkuPrYI+KTnjP+wvlbwgnRvw/iCWGziU4I87ylq
 S8UG7TRrLmpeEYATPuPeyECjgMzyrThP6oWuRVT2fNeBaxHIoOP5UzKmd/fcsK/pOnfq
 JKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IqTYUttp9fReFBo4Q6fCWj5y3UNld99XW4zScIAoz5g=;
 b=XphsJtIJR+AuCJKFl3kR0fbXEV4nZi7MmhHL0KzuYWoPVFx1IH8RxjeT1rOUynnrBr
 v5GNmu1jG5U1GC+NgYz4FIsCdpLsy/ISByYFitX5FVQLCDOIiRk68fhdlT/lCGkNZtOB
 VqT6Iw9fBPUQPcO/cxQEejFTK8P99+8FMX3eZ/4rzqaBY76hypMRj7x/U9l4T8CbsZ1y
 NAeiy5ZN49VB1gGyzY+IUmG3Hfu9fEHsfq20ZhMdbh2qAzEpkBtmgwDk65adUV+tYSSA
 YZfBUd4OPkAdmXUCesZMtW9007BdZnkgopnNbrMca3PlYh1jp0fx7qEWjh82bWflongH
 95ZA==
X-Gm-Message-State: ACrzQf1DcnZIj+DBz1ioCCG7KfRYvuQBcgf60ewd9P9ym3WILPxbFbJl
 +JeRvZUvB76DQIOrPD0nw/RJNg==
X-Google-Smtp-Source: AMsMyM4T57GirHiC3ezKRkXiCLFXVFvPN1348MhCGX7DSVE0hJA3Y1lQouWYBSor0mRzUs7czw3T+A==
X-Received: by 2002:a05:6512:3986:b0:49f:480f:c9d5 with SMTP id
 j6-20020a056512398600b0049f480fc9d5mr6140605lfu.445.1664092020016; 
 Sun, 25 Sep 2022 00:47:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o4-20020a198c04000000b0049f54a976efsm2135038lfd.29.2022.09.25.00.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 00:46:59 -0700 (PDT)
Message-ID: <c83700ef-c653-b155-c3f4-e44f3b80e6ee@linaro.org>
Date: Sun, 25 Sep 2022 09:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
 <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
 <f6ed6e44-ab28-9f13-4193-517eef0edea1@linaro.org>
 <3a14c5a3-e4f2-a89d-815b-8923d1d189c1@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3a14c5a3-e4f2-a89d-815b-8923d1d189c1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm: Add
 QCM2290 DSI phy
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/09/2022 11:15, Dmitry Baryshkov wrote:
> On 24/09/2022 12:12, Krzysztof Kozlowski wrote:
>> On 24/09/2022 10:51, Dmitry Baryshkov wrote:
>>> From: Loic Poulain <loic.poulain@linaro.org>
>>>
>>> QCM2290 platform uses the 14nm DSI PHY driver.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>>> [DB: changed compat to follow the agreed scheme]
>>
>> Bjorn asked to keep consistency in other case:
>> https://lore.kernel.org/all/20220829210408.gxbv6szxfwiiwrbv@builder.lan/
> 
> Ack. Should I use qcom,dsi-phy-14nm-2290 or qcom,dsi-phy-14nm-qcm2290?

Ugh, no clue, but existing pattern would indicate without qcm.


Best regards,
Krzysztof

