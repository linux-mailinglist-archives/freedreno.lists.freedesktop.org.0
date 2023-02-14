Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F169551D
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 01:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3E810E79B;
	Tue, 14 Feb 2023 00:02:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868D810E6C4
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 00:02:04 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id qw12so36140014ejc.2
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 16:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/GwxUMyhcUkJOiEorsMtvT9Ot73fs4DVHuCKy2ae0LY=;
 b=r3ccNo6x99wERibYLaLh8KMX4VXb/ZZBnUZE7LUZDRU1a/M/w5NxRJER/CBnlDnp7y
 2pYRR2Bvyq2Pfmb2m0eMcyaNy25SsVt2GHLu336RnSfp5R8KeWhHT9bdxVqHg7SZtwI2
 BHHXJtaHgTsnwcW6WSLJxVDgvWp/oO00DUnECWcZWYRjEBqU1OQFlvyeBF14nkcEUDYt
 +2blSe2DfP8f1z9b2/SUgbn1a9bqYerhVVoz87bdxvz3+1bEpSeB+dHLDd0K0UfQDDo1
 7V/QvL8eVTFb1Z2QKtXcHn/zQrTM+kq1LhXtJ3BHogFDMfuwFOQKUo38UbUzdhikjKyM
 ukiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GwxUMyhcUkJOiEorsMtvT9Ot73fs4DVHuCKy2ae0LY=;
 b=D0HnWZSJjrzsycXyR/Xc4bvpliQ/khkfUavmVqPcTOhoufBotzhwzYb7RFLlShieNG
 wNPndoO0RmlK/ycC3f4ssOEqiuzrws6gEwX13C60rkg+TeaX83bNNpy9vYK88fEvV6Ag
 xu3R6ODsp130SY1M+KwlnJePASHyoKCC+qSV37XyL3X4Ml6cV7BJ4vK3Yj/73DoXJ/8K
 tR4tV8HPZEthUNF0uX0IfTBPLLf1Thtd04NaKgGbrO0bZDzeYWB/A0gfXZxemavIawd8
 taeUkLPrjBRrmYW6WK133VSJ89/iQFqgrFEDi0lQ5TwtjruX0GALWcRoHZwW/zSBnksV
 Sn+w==
X-Gm-Message-State: AO0yUKX2zEcP+R45tqMYX8P7AwTwNvOMZKrowM8dtikPxZ/8uHsnbjBQ
 MfCzggnOid9/HrtXM0uWK/CfIw==
X-Google-Smtp-Source: AK7set+371Z/D13l7sLxPSFeRr5/XAP+3WH8iylALqE6KobEx9r/yJQflQy7b77mflN5NZEguX7k5A==
X-Received: by 2002:a17:906:8248:b0:8b1:264d:6187 with SMTP id
 f8-20020a170906824800b008b1264d6187mr821891ejx.46.1676332922931; 
 Mon, 13 Feb 2023 16:02:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 mf6-20020a170906cb8600b00878803d4049sm7548982ejb.93.2023.02.13.16.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 16:02:02 -0800 (PST)
Message-ID: <c5c22875-29c6-971c-da61-bd70db3c3880@linaro.org>
Date: Tue, 14 Feb 2023 02:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
 <af5679a4-93b9-fb9b-cc5f-8669da57b7cf@linaro.org>
 <4c23d2d5-fa6b-7548-d189-5b7a1913e266@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4c23d2d5-fa6b-7548-d189-5b7a1913e266@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [RFC PATCH v3 0/4] Move TE setup to
 prepare_for_kickoff()
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/02/2023 02:01, Abhinav Kumar wrote:
> 
> 
> On 2/13/2023 1:51 PM, Dmitry Baryshkov wrote:
>> On 13/02/2023 21:48, Jessica Zhang wrote:
>>> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
>>> functions in both MDP4 and DPU drivers.
>>>
>>> Changes in V2:
>>> - Added changes to remove empty prepare_commit() functions
>>>
>>> Changes in V3:
>>> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>>>    clarity
>>> - Fixed spelling mistakes and wording issues
>>> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]
>>
>> Is it just me or patch 4/4 is missing? Patchwork also hasn't seen it:
>> https://patchwork.freedesktop.org/series/113967/
>>
> 
> Yes, not sure what happened there. Even i couldnt see it.
> 
> We have posted in-reply-to now.

It was received properly now, thank you!.

> 
>> If you can send it with the proper in-reply-to (set to 
>> 20230213194819.608-1-quic_jesszhan@quicinc.com), that would be great.
>>
>>>
>>> Jessica Zhang (4):
>>>    drm/msm/dpu: Move TE setup to prepare_for_kickoff()
>>>    drm/msm: Check for NULL before calling prepare_commit()
>>>    drm/msm/dpu: Remove empty prepare_commit() function
>>>    drm/msm/mdp4: Remove empty prepare_commit() function
>>>
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++++++---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
>>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 -----
>>>   drivers/gpu/drm/msm/msm_atomic.c              |  3 ++-
>>>   6 files changed, 9 insertions(+), 56 deletions(-)
>>>
>>

-- 
With best wishes
Dmitry

