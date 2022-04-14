Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A3501BB4
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 21:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89010E1F8;
	Thu, 14 Apr 2022 19:20:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C96510E1D3
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 19:20:34 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id w19so10737825lfu.11
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 12:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vp0QTlQ+Ul12qwBiTeo6WQhXUXb0oDOX5cKNXB8aPjA=;
 b=vtTVHj80EGxNxKDlWGtszG3FwMg4Ey5uQHChZ2COAtQ3UUZTlIFf0z5PGKPiraBznp
 nlnwtsO3/u7tW7hBz/zuev7xxyVez2a1UV4nWJzEA+tbDF+toFxvgf3oS+Ph+MAcVJqx
 6pLvnc9UJe5jn4SBNdLYPN5Qax2ShWH+dQdCyYir+zNtxeCkS/MloXri0Byr1k6CWrQn
 DIvXAWCR+AUnhw9m8COyU5g0yWa8VV81TuALFXgSzmLsSb/ODZY/kz9XdUipaRxtpkJK
 cqtoJaVQNx9rfchIoRjAhYaGI2BQb5x1lxq0/4EC3hHEbQsLJBz8UJhBvQ6QjuJxevF5
 4v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vp0QTlQ+Ul12qwBiTeo6WQhXUXb0oDOX5cKNXB8aPjA=;
 b=zISazR2wzApBZraezus2HWKDNtQ6y59vcteR7WzhqHmK35a5Gdo5uM3P8K8jeJcy9S
 DhRfrfZmySt+f7Z6bQ7LRBmyK37O4NU4zGvej5YOq/55br9stIjNSO8BPq2JiiOj03f0
 4vDSk8LlwHhGuNKnoD67uWQsLP+/OZWe9xebuHHRB4L/H5jV5QetfImN7WowUYjJ4QoF
 5q2cjv3FHMXQHXwAxKke33Sp3Sou7MOPl3jht8l6ugg0rfoJqLVkVr2FM9mDiObmPC1d
 2dwIMOqzELtcm7Y9nzVtjfZi1SUXvQQcFnWJBOjgybe7A2cNjmfzQu96Cmdlm0e2/IGC
 OjYw==
X-Gm-Message-State: AOAM532QbPmTPbR13TAcjRA7BTkb+GSax08PkzK2KZ87UFK5T1D2XGkh
 kLCv+HOsHOr7YNwArEKXZ7oZbg==
X-Google-Smtp-Source: ABdhPJxo5MHFE963Dq+Wyme7Ct5D7t+GPbOhgBQl/OVd4GpTcR+TbNjtlAMv2Dy5gtjdWO+O9T8iPA==
X-Received: by 2002:a05:6512:4024:b0:46b:fc7e:a455 with SMTP id
 br36-20020a056512402400b0046bfc7ea455mr2937396lfb.156.1649964032785; 
 Thu, 14 Apr 2022 12:20:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a19dc01000000b0046ba600f866sm83561lfg.180.2022.04.14.12.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:20:32 -0700 (PDT)
Message-ID: <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
Date: Thu, 14 Apr 2022 22:20:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 0/4] Add support for the eDP panel over
 aux_bus
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/04/2022 19:40, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
>>
>> This series adds support for generic eDP panel over aux_bus.
>>
>> These changes are dependent on the following series:
>> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*
> 
> You're basically depending on the last two patches of that series.
> What's the plan there? In patchwork they're marked as "Not
> Applicable". If they're good to go, maybe we should land them? If not,
> maybe you should include them (with Dmitry as the author, of course)
> at the beginning of your series?

No, please do not resend patches. The patches in question are marked as 
'Not applicable' as they are really not applicable to Bjorn's tree.
It would be better to point to the correct patchwork:

https://patchwork.freedesktop.org/series/98585/

Note those patches still lack the R-B tag. I can include them anyway, 
basing on Sankeerth's Tested-by tag, but the formal R-B would also be good.


> 
> 
>> Sankeerth Billakanti (4):
>>    drm/msm/dp: Add eDP support via aux_bus
>>    drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
>>    drm/msm/dp: wait for hpd high before aux transaction
>>    Support the eDP modes given by panel
> 
> One of these things is not like the others. One of these things just
> doesn't belong. Can you spot which patch is missing the prefix by
> looking at the subject line of all 4 patches? ;-)

:-)


-- 
With best wishes
Dmitry
