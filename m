Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3776C689B56
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 15:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF2A10E7A8;
	Fri,  3 Feb 2023 14:17:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7241210E7AB
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 14:17:00 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ml19so15883675ejb.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VSKlZtNoYJeq5Z8jeVTL5znAn0vVOxDOqQhyYoiyUHk=;
 b=O672AP499Mg2em52Ac0GHXX6QjPb7DLQr56c2s0V01n0ZnmGWibz0dd7y9XxVYb0lU
 Mr0npBBMuqC/ZZfx5gnLFGw9ZAk32e+ZaruW7p5Yk0LbOOXAPRKVlD6hxQd8qaebCcKK
 5HJKSMFSxU6x9piaS5dhTGpLbFXQxTRnJJO1kyqhsHkDpyzpZ55eQAe2MzzJLkZOZaJX
 x06k/lwsp1VeV7RmOY64qVNKvnDNS8JougsDxb2OSKsu5zS0VN+RMqybGQ6eEXq10G7X
 ws+vWdWcvAFFgWOJfD3O0vLLgwDgsn+RC5I+HC9rOVjoXid1qGx5lRMAbVSfa8eVa051
 686g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VSKlZtNoYJeq5Z8jeVTL5znAn0vVOxDOqQhyYoiyUHk=;
 b=Amiwqs64KReqQDS9D0S3i+GZTXB2/ym2OG116hYCCDt+oXOMdvtlZh5dr7qT9THI9C
 I55fJ9+QScsloovvgas6LUw21JgB494UVSYO8NDQFpaVMLcoECQvOkNdUJo/R0Ap8E7f
 jLyiqB5s1bObgSvnUAzKTz4rCjKaHFAhx+EVilBedng2wgnqIyEpPWauGbNv6Zw7RHsF
 5isPDbRZutA45/C4BKE/hzGiirMnqs2b2Hh5TRYj/0zIBuT72WUH1gI9jRtSB8KFuR5t
 Iy8q5Xbc8s9gt0A12BpG2skCzNmOu3cK+dyGcvXik9SEOcNsX3fk4bBXYNXtmb7TOnBO
 a9rA==
X-Gm-Message-State: AO0yUKWcnnPuzg3e+j3YrlXzKqLYKEixxZtzUsgzhkuX2gK1cveJcBci
 z6JG7lD+5Dwv7ZOa0sBhC/oIzw==
X-Google-Smtp-Source: AK7set9p2PSXxpiPVO69F5zO4OKxSyIbbONHcykAbCIK/ULUaUBd9rN2wJOABKgeDmblxpYdJHXHlQ==
X-Received: by 2002:a17:907:6290:b0:88d:ba89:1853 with SMTP id
 nd16-20020a170907629000b0088dba891853mr6300275ejc.36.1675433818927; 
 Fri, 03 Feb 2023 06:16:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a1709060a4a00b0088091cca1besm1422746ejf.134.2023.02.03.06.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 06:16:58 -0800 (PST)
Message-ID: <d000fec1-e24f-5a31-2484-98df672d8550@linaro.org>
Date: Fri, 3 Feb 2023 16:16:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-6-dmitry.baryshkov@linaro.org>
 <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
 <CAA8EJprHMyPDmHhqZF-AZpqiLNkK7QuoQz-sZu6kSabZ7y76Dw@mail.gmail.com>
 <e03f4fdc-75c1-dbc3-fb1a-05fc9e32d5cc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e03f4fdc-75c1-dbc3-fb1a-05fc9e32d5cc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check
 from dpu_format_populate_layout
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

On 28/01/2023 01:59, Abhinav Kumar wrote:
> 
> 
> On 1/26/2023 10:05 PM, Dmitry Baryshkov wrote:
>> On Fri, 27 Jan 2023 at 02:52, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>>> The pipe's layout is not cached, corresponding data structure is zeroed
>>>> out each time in the dpu_plane_sspp_atomic_update(), right before the
>>>> call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().
>>>>
>>>> Drop plane_addr comparison against previous layout and corresponding
>>>> EAGAIN handling.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> The change itself LGTM, hence
>>>
>>> But, shouldnt we add this EAGAIN validation or in other words fix this
>>> rather than drop this?
>>
>> What for? Does it really save us anything? What's the price of
>> re-programming the SSPP_SRC0_ADDR registers?
>>
> There are 4 Src registers being programmed per sspp.
> 
> With number of layers going up this will be 4x.
> 
> So lets say there are 5 layers and only one of their address has 
> changed, we need to reprogram only 4 regs but now will reprogram 20.

I think this was the original intention for this change, however the 
implementation ended up being written in a way when this condition 
doesn't trigger at all.

> 
> Thats why i thought this is a good optimization.
> 
> But still, that is a separate change so I am fine if this goes in first 
> as its just removing dead code anyway.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
-- 
With best wishes
Dmitry

