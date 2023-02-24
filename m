Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CFE6A238A
	for <lists+freedreno@lfdr.de>; Fri, 24 Feb 2023 22:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF0D10ED17;
	Fri, 24 Feb 2023 21:14:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D955010E274
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 21:14:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m7so801521lfj.8
 for <freedreno@lists.freedesktop.org>; Fri, 24 Feb 2023 13:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a3tMET32MC/ilQvKVfykq58VVtfmdUTziBlgOazLd3M=;
 b=U5eD5dgQMqr90/i1TZVqTWa3upSJ8famKFMQf6b9Y4qBH8DJcyBWCDB2wSBsxCCQmV
 WZ+8aokL4OdbZAaMkkA3m8qy6FibDv5B7fgz1TTrT0aGeRrgnzz5GhFtpuDI2LAXzVpY
 DtucP8KdYrdXIDcb25gdulIleYmRNT2tNiEGSn5/gRHJ0+UmPNDswbe8uz6mpLEYYBSv
 OQgWVLtwRv7wwHFb1npF/UZFjkqNwbH1gZlmtMGoclhGA9W/4uZ+5+qs2dD5baNy7YBY
 IQ9ZJdMJNw6jKamY4dAgdrItDX1BkWNO0DYQo+EkdY9p3tH6CFWPy92vySc2VVVINtLc
 JMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a3tMET32MC/ilQvKVfykq58VVtfmdUTziBlgOazLd3M=;
 b=WH2i+R5GXorRGc9UGDEv1NQZ473iGr0n3jMmR5zXP0ZoXFnNrjJRpPqWSMZlBxQcCP
 diBr/FS9YBvokbbeX5Skx7BNiLJ8os+dOhpCDcawTzrtSqEEuC3by0+qrYUi9Z9RQXw+
 LMq/Zys2wkfq6oEwGyip/cBLpidTpE2HgyC4KEzREgYalL0Bv7wSdWPYxFH8lW+DL/eM
 WwopMJFV/biRd9hTx5NpsSpyq9lCsKaF8n3tBdmypvR4EYuzZG8tURTVAgs8jXoRqqC8
 c40CItp7GkYjhTGaFUNYzyOoP0L4SjdSoETQESnPNGhpARjIh1s4brpJtEocs9oeNQSR
 /Tdw==
X-Gm-Message-State: AO0yUKV6lwPaPK7rtKjp3H8LTKMNSCFofYAqdEAhmyasR1FGC8M6biEX
 zat0YwChtRb03wAfFL+1Jo2Vbg==
X-Google-Smtp-Source: AK7set+KuQfh3hQTyj9cvtkBXBPxyynq+nrRD1q1YjjoI1lEyvxDbAvco71W6uCiJgOUd/RvpsNOzg==
X-Received: by 2002:ac2:4842:0:b0:4d5:a6ad:53e8 with SMTP id
 2-20020ac24842000000b004d5a6ad53e8mr6464231lfy.27.1677273294064; 
 Fri, 24 Feb 2023 13:14:54 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z7-20020ac25de7000000b004db44dfd888sm2750lfq.30.2023.02.24.13.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 13:14:53 -0800 (PST)
Message-ID: <54004e9c-256c-15b2-9c55-8bd88ebb0c85@linaro.org>
Date: Fri, 24 Feb 2023 23:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-3-git-send-email-quic_khsieh@quicinc.com>
 <525078f5-44be-9a75-a737-ddcc6e097700@linaro.org>
 <21623a6d-7f83-5d2c-068c-f600a1834ac9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <21623a6d-7f83-5d2c-068c-f600a1834ac9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 2/2] drm/msm/dsi: use new
 dpu_dsc_populate_dsc_config()
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
Cc: marijn.suijten@somainline.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/02/2023 23:09, Abhinav Kumar wrote:
> 
> 
> On 2/24/2023 1:04 PM, Dmitry Baryshkov wrote:
>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>> use new introduced dpu_dsc_populate_dsc_config() to calculate
>>> and populate drm_dsc_info instead of hard code value.
>>
>> DPU is an optional component, so DSI driver should not depend on the 
>> DPU driver.
>>
> 
> Today, the implicit dependency is already there. Without the DPU DSC 
> blocks, the DSI cannot operate in compressed mode.

It can not operate, but one will compile w/o other driver.

> 
> But, from a SW standpoint I agree we can separate this.
> 
> We can move this one level up to the disp/ or msm/ folder
> 
> What do you think about that?

I think about drivers/gpu/drm/display/drm_dsc_helper.c

> -- 
With best wishes
Dmitry

