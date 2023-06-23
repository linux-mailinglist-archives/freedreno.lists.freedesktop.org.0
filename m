Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482CC73BEFC
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 21:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656D710E02A;
	Fri, 23 Jun 2023 19:40:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0D710E02A
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 19:40:50 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b4745834f3so16798641fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687549247; x=1690141247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zWJ88OU6tMmuDR/xiSHFmRV61FGLBtGACKTZ2xDyMJc=;
 b=LQcv2ZaqsJj750f8Uf1944+6vDdU0LeoyZ0eN4cboLiVcMZMlUqWlGAhk8sg81RuwV
 apRfp9dc2x4qiiCU7mtkVulve+YK+KdiooFIlrWP/rU6pNdgdI+Wu97nBFqzggSxXHN3
 FACCuEdScmmr5FxhG4t3l1+qnUiHK/RtO9TeHaYpsnxYoBe4FDdBALS60PC3zBGpOn00
 V5vPD12B8kEU8/R0RA1tlWApOmT4x1Rt+dUdwKyYKwX0bccu6Lwa3exz21a8ZIsBLsnv
 xZHb2+NySn6fAN69E/TdEmpC3b7GiYi8YTt5EymstKYyp6kvOwq9RhUFZfC/DDQnvt0U
 xIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687549247; x=1690141247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zWJ88OU6tMmuDR/xiSHFmRV61FGLBtGACKTZ2xDyMJc=;
 b=XXy1hFsTZ7e6lZtmiaxqWeS9fFFmcH3w6FyWPqsCkCf0OuJsuZOyGJlVgJKD6W3UsA
 psgyIRAoLsmyXalwa27F4ki2+pZinvPgaT91NM1Kt/VuwTvwR5k5v6hWGAa74mImj66A
 K0RFVJ6CK/EYvnaEWKDuphz0prQnG4RKKhKPQV9ZAOKVZHS+AiqMpk5mqiDHH/yGeRJg
 SMftH/+EK2QHYubjc3tdBvrkUVH1hre7x5IR5Fn1G4yqRRzKGZHWr9CyIyROw88ds+qy
 DgsRcpk0Q9YgCj9kL20Uz77YWkkamyDA/eYFIvmVHuZNdRUfFIrUigzn+LQPEKsvuUT5
 B2Ug==
X-Gm-Message-State: AC+VfDxPBP3/L3Naulj7rqFk0ErPsf6gDfkRMONQ4Je5lBNUrvhfRduA
 VQIRbG63dnmADI1RJ4lp8K2IGA==
X-Google-Smtp-Source: ACHHUZ72FFL4Q4TOC9sjxY8yIW5Ixb6dO8Uj6Wh4176s0tRHONdWfeb/izHn2daQF9X9q3Ff1riFxA==
X-Received: by 2002:a2e:9ad6:0:b0:2b4:78f6:d32b with SMTP id
 p22-20020a2e9ad6000000b002b478f6d32bmr14169315ljj.39.1687549246630; 
 Fri, 23 Jun 2023 12:40:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a2e80d1000000b002b33e954509sm1875373ljg.119.2023.06.23.12.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 12:40:44 -0700 (PDT)
Message-ID: <500e6256-b1bc-35bf-546c-8ed896e3cba7@linaro.org>
Date: Fri, 23 Jun 2023 22:40:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
 <c22f165a-cc5b-2be1-fed9-420f68dbd8b7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c22f165a-cc5b-2be1-fed9-420f68dbd8b7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
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

On 23/06/2023 22:37, Abhinav Kumar wrote:
> 
> 
> On 6/23/2023 4:37 AM, Dmitry Baryshkov wrote:
>> On 23/06/2023 09:54, Marijn Suijten wrote:
>>> On 2023-06-22 22:47:04, Abhinav Kumar wrote:
>>>> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
>>>>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block 
>>>>> length.
>>>>> This includes the common block itself, enc subblocks and some empty
>>>>> space around. Change that to pass 0x4 instead, the length of common
>>>>> register block itself.
>>>>>
>>>>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for 
>>>>> relevant chipsets")
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>> There is no need of a fixes tag for this.
>>>>
>>>> This is not a bug but was intentional.
>>>>
>>>> Till we added sub-block parsing support we had to dump the whole block.
>>>>
>>>> And hence I would suggest this change should be merged after the
>>>> sub-block parsing change otherwise we wont have full register dumps 
>>>> for DSC.
>>>
>>> This was indeed intentional, we discussed it in [1].
>>>
>>> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
>>> the CTL registers, but that change didn't make it through.  0x29c is an
>>> arbitrary number that I have no clue what it was based on.
>>
>> This should have been NAKed. or at least TODOed.
>>
> 
> Its is not an arbitrary number. Thats an incorrect comment.
> 
> Its 4 more than the encoder's last offset which is 0x298 + 0x4 = 0x29c.
> 
> There was nothing to NAK or TODO here.

We do not include sub-blocks in the main block area. The SSPP's SRC 
blocks were cleaned up for this reason. The ENC registers are definitely 
a sub-block (and are described this way). There should have been a 
"TODO: reduce block length to 0x4 after adding sub-blocks to dump" comment.

> 
>>>
>>> [1]: 
>>> https://lore.kernel.org/linux-arm-msm/y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua/
>>>
>>> - Marijn
>>

-- 
With best wishes
Dmitry

