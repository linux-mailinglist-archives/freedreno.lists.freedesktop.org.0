Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4276709C13
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 18:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B630510E45E;
	Fri, 19 May 2023 16:11:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6BD10E2BA
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:11:27 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f2510b2b98so3815594e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684512686; x=1687104686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iB4GoJ4t0unqfI6RbJqjJl5q2OVPl3jlWsN9nEHUQOo=;
 b=mGGYCtKMcCRYWZrAd3JcwMw8gc0WbSEVgRzBw7G1RMBgwKK9kBShT8rAmq8A15qES5
 FXuadAbokZPOnPJs52SvX5R1fakXlwPWyINW/gYVt2I7L5UCpXxybW+6RjEkeKi8jF9k
 +e2xmt+YyTYCzkbdAHQUK0pI9/adKprRPczAvw54mwwdTktMDdH4AyFANDf5n61iKQmo
 a55dstAvA8o3C0qn+YfDQ/5DppnfstoMJ5du9UxOcaFNGCHfGBV96ZAa2oR5yWbSBPrw
 hDU18nsH0DFgfkudS0VW5JDBT+IkPjhHTWtzyrZxwmuwdjtEEpIkzgNF4KrLK74miH8e
 dFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684512686; x=1687104686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iB4GoJ4t0unqfI6RbJqjJl5q2OVPl3jlWsN9nEHUQOo=;
 b=i1vwhgIO+YfV6DJ6lkGKcZWCjXf+QinBz8SorbJUUSJHhwb3qYU0vCDj7gb1gFt6n8
 qK4qGCFqsJJT9vgzHNtTT/hQG2rVPmArYZhG8EE7IB5JOfI60T9YYwHjWk55TD+gBhiL
 CypF9Ykd6+qIbI0Cw6zjGJ4PJHxsa0GYxl+j7OEIW2FKTv03UFNAtrLBD0DFphbpDUdX
 8T8bdPdnTktwR5JV0MC2W913HMznrn6cBIvggtQ84lVxnXhRLn3htaE5VioVdMylf6r7
 HVirkVrktZMZVJOkchV2UyS++EzKHGKtMBhC0xgKYZlgS3TtFequcira4zEsoU4GJ8uO
 9xew==
X-Gm-Message-State: AC+VfDzLG+b2U2surJAWR+JySuAHZPJo4R+UMgSLuXwA3x0KaxXBDSxh
 lnuP1Lk37x/ExIJaiNiBXjTIhg==
X-Google-Smtp-Source: ACHHUZ5z21vkYtp5meWScZ8B3BaN1oGbfOr57BlfM1oNMpVjSqX6CCEXxlt51V05SdPYFUuSQq/LkQ==
X-Received: by 2002:ac2:4e4c:0:b0:4f3:ac64:84f5 with SMTP id
 f12-20020ac24e4c000000b004f3ac6484f5mr830298lfr.36.1684512685655; 
 Fri, 19 May 2023 09:11:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a2e924b000000b002adc5ea2791sm842378ljg.103.2023.05.19.09.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 May 2023 09:11:25 -0700 (PDT)
Message-ID: <7cbc5958-542a-9119-e16d-9967a2131f1d@linaro.org>
Date: Fri, 19 May 2023 19:11:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
 <20230102154748.951328-2-dmitry.baryshkov@linaro.org>
 <bba66f67-8c9a-1372-a3a4-2f19e966b6a0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bba66f67-8c9a-1372-a3a4-2f19e966b6a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu: remove CRTC frame event
 callback registration
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/01/2023 02:49, Abhinav Kumar wrote:
> 
> 
> On 1/2/2023 7:47 AM, Dmitry Baryshkov wrote:
>> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
>> to NULL) and the data is always either the CRTC itself or NULL
>> (correpondingly). Thus drop the event callback registration, call the
>> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
>> assigned using dpu_encoder_assign_crtc().
> 
> I suggest you wait till we sort out the PSR series for this, especially 
> this patch https://patchwork.freedesktop.org/patch/515787/
> 
> There is going to be some change in this code when PSR is pushed again 
> sometime early next week because PSR will touch the crtc assignment code 
> (dpu_enc->crtc),
> 
> Based on how we all like that patch, we can get back to this one as this 
> one is a minor cleanup.

As the PSR series have landed, I'd like to point to this patch again.

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
>>   5 files changed, 21 insertions(+), 65 deletions(-)


-- 
With best wishes
Dmitry

