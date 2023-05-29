Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073CE7146D6
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 11:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AC410E256;
	Mon, 29 May 2023 09:08:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34C110E256
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 09:08:49 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2af2c7f2883so31516891fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685351328; x=1687943328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tSa8aYLGe0eh6zJBgEC1ehDOBlDuDqV/nsz+yCLZGS8=;
 b=JoqnkqFFs6uFRbpaAbkym4gYnhJQCsnnGsqSwDYL/jL5nlLBM1xz+gJ5X0dxp1zrXI
 O/tJTtctTjTyqNVgs5ydIokhsCUjUZ6MLaZnabW5HL89gZDo+3NBUFwCT8kUFd3H6zWl
 kPOun5HSiSYWhM/m/AlGwBhXK7FNMMcr+F0J8kQidRUP9Bh4lLQ07imKQsvlBPcgBpgO
 NEUKGi5kqZ73V91LHAr4ihEjWO79uT96tJRe9v+PuXqYbTCt1PDg+AcQbyVXRTTFVC8J
 FfU5KFOmNBObhRkJldNnsxwrZTdw/T3goyEYKuDbs3lrMOdHwfHGvFO9ulU3uj9g9o3K
 jiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685351328; x=1687943328;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tSa8aYLGe0eh6zJBgEC1ehDOBlDuDqV/nsz+yCLZGS8=;
 b=cvDJ6Z/8ZFYRIOXNY+JXEoRqu4P1FjHtTI14m//Q5OMjo6uKeSo6PcCDRq8btn19tW
 Xgz48RE2vnSGVoKtEffbNheGce+RAvqEnL35z2VjV644Dav/1NvYtbfvAGokrY9KF2az
 AWSS7UdMnk3I02Mdt4EjVa0X1xogj6w8PYqS69gmNPtQVuyf90N2aZX6q7pMzq5FuF5l
 wP8RfvWvfM2KdH3iyu+MeGombq0LHNyzkJNJIbCFrxSTZJ53Avqcql1vJ/+4evr8Wshj
 HisVnwjiezX/yr1KQMZzT/zVFSpRqocY1qSGjQw/5M5f9mRvz1oP5XJsjRZ3cJf98Jnv
 H+IA==
X-Gm-Message-State: AC+VfDxpIFgzW1K/8GRB8IkN8V+obijByOmBBvv7DSchlpPnRI7I7jWt
 A0ImAvo207RNo5da0dhzf/3CNw==
X-Google-Smtp-Source: ACHHUZ5qiEyUTO6pdyeSWqWw0+WfQT0iGbQqMBiKvhlXlAcXdRgSEX7FCWEmso42ecsPEc8eSvdmTw==
X-Received: by 2002:ac2:59cf:0:b0:4ed:d2cf:857b with SMTP id
 x15-20020ac259cf000000b004edd2cf857bmr3019232lfn.5.1685351328124; 
 Mon, 29 May 2023 02:08:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 d11-20020ac2544b000000b004f4e637db2fsm1484450lfn.167.2023.05.29.02.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 02:08:47 -0700 (PDT)
Message-ID: <e99a9fe9-21e4-fc56-d400-4f6e9df2eaed@linaro.org>
Date: Mon, 29 May 2023 11:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <CAA8EJpo8X7KrrXoButyW0d1Lz=a5Stw2inFGt2R7KJ+2NTX6wA@mail.gmail.com>
 <74a817ff-5850-330d-8cac-f551be6fa35c@linaro.org>
 <254cd131-4ad1-44c9-2653-862580503c15@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <254cd131-4ad1-44c9-2653-862580503c15@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/5] MDSS reg bus interconnect
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
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 29.05.2023 10:47, Dmitry Baryshkov wrote:
> On 29/05/2023 10:42, Konrad Dybcio wrote:
>>
>>
>> On 29.05.2023 04:42, Dmitry Baryshkov wrote:
>>> On Mon, 17 Apr 2023 at 18:30, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>>> another path that needs to be handled to ensure MDSS functions properly,
>>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>>
>>>> Gating that path may have a variety of effects.. from none to otherwise
>>>> inexplicable DSI timeouts..
>>>>
>>>> This series tries to address the lack of that.
>>>>
>>>> Example path:
>>>>
>>>> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>>
>>> If we are going to touch the MDSS interconnects, could you please also
>>> add the rotator interconnect to the bindings?
>>> We do not need to touch it at this time, but let's not have to change
>>> bindings later again.
>>>
>> Ack
> 
> Also, several points noted from the mdss fbdev driver:
> 
> - All possible clents vote for the low bw setting. This includes DSI, HDMI, MDSS itself and INTF
As in, "you need NUM_CLIENTS * MIN_VOTE" or as in "any client necessitates
a vote"?

> - SMMU also casts such vote, which I do not think should be necessary, unless there is a separate MDSS SMMU?
There's one on 8996, pre-845 SoCs often have a MMSS MMU, 845 and
later have a MMSS-specific TBU which (theoretically) requires a
vote for access to 0x400-0x7ff SIDs

> - PINGPONG cacsts high bw setting for the sake of speeding up the LUT tables if required.
Hm, I think is would be a separate topic.

Konrad
> 
