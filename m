Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC5679268
	for <lists+freedreno@lfdr.de>; Tue, 24 Jan 2023 08:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9510E61D;
	Tue, 24 Jan 2023 07:57:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A552C10E61B
 for <freedreno@lists.freedesktop.org>; Tue, 24 Jan 2023 07:57:23 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x10so17333155edd.10
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jan 2023 23:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I3bszTCkD+kw+1Y7L2uGsYTJlWqLn8lcFGeHp2xVzYs=;
 b=Yd3Me3+cKdqdLlAwp8AvD/tWrYtVn7tB/vvQyHiQc6PUX4I2VrddOvyS5s8MGqIchI
 wCdXjpZV9dYY6eIplbatXT7nWd/2599Xm1FMAUOvMbT2owgt/d0ABiNlVVpUOV64X7vb
 SgTHamw4hskUtfa1XGl99c3AhXE6sDn4cNfA8CivcJ5FEP2PXV+2krL+yJagNfHFz41h
 dI0bN/51xhbwTUg6Aahm+pdXV285AIbcPco1FW/CNJmrxWnr0lcjM7hRkGV8j4SSQFxA
 UmspSpS24H62B+6vbzJtGX/Mh5l6Y9b+RVEJzdhZNrIA8nbxv/V2m1rZ1vDLuGgAZG2j
 lSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3bszTCkD+kw+1Y7L2uGsYTJlWqLn8lcFGeHp2xVzYs=;
 b=5sLkhNaJCjqsCCn/xiID9h4dWHIavquLi9JDktEcbS6W7qgUwPg9HzYuGBt/BxS+mX
 D1N+KcuJg4xS5PczwlpLrfUYMedLHC2GYsv6qxv+pQ+AOcCrERS5dmpxmpdmV2ataAjP
 z0j/s0roO9J09gfj/yQ33gLcTGOooXmhtgtc5dVI8xBH7MK8epuDiiwbrGP3CSptwLSi
 A8jhqRqL2KcmzcmxqkOUtpViU1/ThTTw2Jxf5ZzwPttDNFD5CFpDKenzAzKiBJaYSn7W
 RCk2rw8mR27gZIkvP1GbBoGOPEuUaERW/p0LSt2QAeFbmbN4Fr3m7jO7INEa/gk8bPQi
 13yg==
X-Gm-Message-State: AFqh2kpWzciCCF48rhvSJaP7VWbgRuTD9Sw+0zlmUkxNTK+sGBIGx0VA
 KpnVfMi3fDvpAA+SGvk088NPHA==
X-Google-Smtp-Source: AMrXdXt+1GGRxvTU201N0GgA/ANjRYl0kMjG+dTlxFaG95i9L3Q80YyqWCvwwDwBnIPn0Lwak3CV6A==
X-Received: by 2002:a05:6402:28cb:b0:49e:db43:1722 with SMTP id
 ef11-20020a05640228cb00b0049edb431722mr14083304edb.18.1674547042151; 
 Mon, 23 Jan 2023 23:57:22 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a50c052000000b0049ebbee7134sm698378edd.94.2023.01.23.23.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:57:21 -0800 (PST)
Message-ID: <76500be3-08c8-311b-6f9c-ad9e2feaf2ae@linaro.org>
Date: Tue, 24 Jan 2023 09:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
 <20230118010428.1671443-2-dmitry.baryshkov@linaro.org>
 <2a5c8934-a479-6ea7-4236-9e156e26b29a@quicinc.com>
 <CAA8EJpp4h1Pt2cNuQi94ShvERmDKTrui_brJORqzx6_wT=KC8Q@mail.gmail.com>
 <4b0d0fcd-ddbc-5806-0ed9-e674d965d7cc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4b0d0fcd-ddbc-5806-0ed9-e674d965d7cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/3] drm/msm/mdss: convert UBWC setup to
 use match data
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/01/2023 03:48, Abhinav Kumar wrote:
> 
> 
> On 1/19/2023 9:26 PM, Dmitry Baryshkov wrote:
>> On Fri, 20 Jan 2023 at 00:54, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 1/17/2023 5:04 PM, Dmitry Baryshkov wrote:
>>>> To simplify adding new platforms and to make settings more obvious,
>>>> rewrite the UBWC setup to use the data structure to pass platform 
>>>> config
>>>> rather than just calling the functions direcly.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> I was reviewing this series and
>>> https://patchwork.freedesktop.org/series/111732/ together.
>>>
>>> More I think about it, it seems like we are duplicating the same values
>>> here and in the catalog.
>>>
>>> Yes, these two are different drivers.
>>>
>>> But now that you are adding the UBWC entries here using the compatible
>>> string so you are creating something like a "catalog" here.
>>>
>>> In that case, why dont we remove the entries from dpu catalog and in the
>>> DPU driver get the parent's match data as we know that the msm_mdss is
>>> the parent of DPU driver
>>
>> I should give it a thought, especially since we are trying to clean up
>> the DPU catalog.
> 
> I just went through the cover letter of 
> https://patchwork.freedesktop.org/patch/519752/ and it mentions
> 
> "My itent is to land both series and then to make
> DPU request this data from the MDSS driver"
> 
> This means that the parent data suggestion will be implemented?

Yes, at some point. You probably saw the dpu_ubwc_cfg structure. As I 
wrote, I'd like to get it from MDSS. Just looking for a best way to do this.


-- 
With best wishes
Dmitry

