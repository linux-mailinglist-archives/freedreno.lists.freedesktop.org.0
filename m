Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234DD74330D
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 05:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57B310E12C;
	Fri, 30 Jun 2023 03:19:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F09410E12C
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 03:19:27 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso2109840e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 20:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688095163; x=1690687163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OClf5F1H7d+2V177DAXItTLQdlnvTteMUGZEh2YOK44=;
 b=dyIgM+Wm0MjHqL7EeHkgYjMMYvjaMvFilsxt0Z8gbwl5gYYSsSJ/bm7U6uD0pi4l40
 xKO81ShnxeH9jqINCTL7hLayDQ7GKmCwk4d0lo2cPQpsxtveUHkVpJenS318hLTD3NHP
 epfka63vzyXboF4DURHUb/C1hSyOEGr1tkx5gJCDRXBX4q3hf0zwOw5QecHk24kvNkMG
 nmsXqzBT3OErc/MfL4UMRhcvPLQX321/a1fLRvpuLyZUwXBO8gcM6fFa/A5CBAeD4vO2
 QZg5LUWVGEOBjQ5WvaOGLytopbr6MbLfUgMctP23dji2eirYYCpiRz7Nr0ROxbVIvkQq
 tphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688095163; x=1690687163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OClf5F1H7d+2V177DAXItTLQdlnvTteMUGZEh2YOK44=;
 b=a2Y1/OfBIZwgFZJPVDrB4r5bRjLWBIuZiO64bDPay+9WXENXuhglVpgziDPxyw3ZoS
 sWaMdzTxhC67DK98TG6lyDNu9ayi6V3a6EWMbfKTkjlcJht1Awp2KifuqGoJzA+wze7p
 6Yz2bWqrDQf3E4LB63E+MKRyIRSitmcziaClgqGodgXABlaEhq0qdHm92H1tmzUcup/R
 6HWfRDvQ9jH3ZQDktpuFBa/YKuIvPQDv/ATJt5fbLIbjs97VU6P8fPAh/7j3F+qsisvS
 y9+ICt8gy4vLwVWwSd+nijK/MUirh9jBjEVp50ybK9+16FyYJ5hh9J7/sBkDM+FDF4on
 0oVQ==
X-Gm-Message-State: ABy/qLYQOWjxvliH+qNg5ZDv9xaMecaFLSIXWms81Ce/AynR0NxldWXH
 6NDagPGHY5OXRjCZAtNoJzW+EQ==
X-Google-Smtp-Source: APBJJlF145Eu1JiHcpFKpAC1sJj9661vjODWwrSy/N6pSHACGsaSAvlcEDIhA/f0/sivEf3Sary9kQ==
X-Received: by 2002:a05:6512:e9b:b0:4f8:5ab0:68c4 with SMTP id
 bi27-20020a0565120e9b00b004f85ab068c4mr1263400lfb.59.1688095163116; 
 Thu, 29 Jun 2023 20:19:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a056512096b00b004f76658694csm2534237lft.238.2023.06.29.20.19.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 20:19:22 -0700 (PDT)
Message-ID: <bf2f0e5c-79d7-6160-88fc-b79fc18bbfe0@linaro.org>
Date: Fri, 30 Jun 2023 06:19:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
 <aab1883a-b367-f919-8ff6-d3e09ebc0ffe@linaro.org>
 <060b6125-f08c-f8a4-e28f-f3d12b971c79@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <060b6125-f08c-f8a4-e28f-f3d12b971c79@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 1/3] drm/msm/dpu: re-introduce dpu core
 revision to the catalog
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/06/2023 06:17, Abhinav Kumar wrote:
> 
> 
> On 6/29/2023 5:24 PM, Dmitry Baryshkov wrote:
>> On 29/06/2023 22:29, Abhinav Kumar wrote:
>>> With [1] dpu core revision was dropped in favor of using the
>>> compatible string from the device tree to select the dpu catalog
>>> being used in the device.
>>>
>>> This approach works well however also necessitates adding catalog
>>> entries for small register level details as dpu capabilities and/or
>>> features bloating the catalog unnecessarily. Examples include but
>>> are not limited to data_compress, interrupt register set, widebus etc.
>>
>> Generic note: this description can be moved to the cover letter, it 
>> covers the series intent.
>>
> 
> I kept it here as I didnt really have a cover letter but I can add one 
> and move this there.

Yes, please. I suppose that any series of more than a single non-trivial 
patch should have a cover letter, which describes the intentions and the 
ideas behind the series.

> 
>>> Introduce the dpu core revision back as an entry to the catalog so that
>>> we can just use dpu revision checks and enable those bits which
>>> should be enabled unconditionally and not controlled by a catalog
>>> and also simplify the changes to do something like:
>>>
>>> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>>>     enable the bit;
>>>
>>> Since dpu's major and minor versions are now separate fields, lets
>>> drop all the DPU_HW_VER macros.
>>>
>>> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
>>
>> Please use `commit aabbcc ("do this and that")' in the commit messages.
>>
> 
> Ack.
> 
>>>
>>> changes in v3:
>>>     - drop DPU step version as features are not changing across steps
>>>     - add core_major_version / core_minor_version to avoid conflicts
>>>     - update the commit text to drop references to the dpu macros
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>

-- 
With best wishes
Dmitry

