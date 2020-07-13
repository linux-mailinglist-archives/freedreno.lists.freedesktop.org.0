Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A152321DA27
	for <lists+freedreno@lfdr.de>; Mon, 13 Jul 2020 17:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6206E063;
	Mon, 13 Jul 2020 15:34:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40ACC6E149
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 15:34:58 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id p7so5956742qvl.4
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jul 2020 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dS/t0yiexaZCrqeV5/e3m7On60/CA6XnE/8+DugAd3o=;
 b=xhQXZmL6pVITnzChn/H4Xl7FN0rJWCuhMPQ2vGTPA/AIAUtsBpDMnNQwxyheYPKGk/
 B6+Y7DliDAxAiU2tZU4gzJ8giSUJRogsQGl3+pMMtNKAu6vzwh0jiB48C8x59kfmj6iT
 lLvnvrNpdDPbBqI1ZVoD16TSzIoIGIsGb2iXd3aQ4WfYYYsLsbnA/iTWCVv3lYTJ+4AG
 imFFHrVgTCnugO4wxWbKVSjpUcacpIhnVpeOj0iG6jgBeGLQ6vt4qUwEuBVdTMbUUlbH
 d9SRbMt8i2uPOkDyVLaau3Z3TDxsTBmKFbjNtY1ti7tuNpV+0GRUAn6JjAR3ILXPkuVo
 pDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dS/t0yiexaZCrqeV5/e3m7On60/CA6XnE/8+DugAd3o=;
 b=TL2DB38AHGshKPOYA9ZzWYQ+OUbXD/VrHpFVancVqLFgzszxvgYV7h1SqJ9bpUzd5v
 96kpdKlYHIF0VAg0hKsetogZ1NL+GGmWcvDnevsrJ+1ynLSgE0jelpkAMMi4ePkyrrPy
 YgrVUueRr3nhu60nGMbHyUN3deAFBP23zMlSnkAXZFDtDPHlNlZNMwBGQiL7X7HcL9lD
 OLpgKqemsjTSdOr4Cp7Bup9H9ZCqTUWl3Nva2ihs50+kw03Bi3f0CtOMNllDw1SL1jU4
 BtugcpMuCg4Vp3mVe/359Cga1MEuD9e3ODQlfqJIDvGshfyd+oPz922idIhExBkQA8Rz
 yJwA==
X-Gm-Message-State: AOAM532GHj/wtNqC+kQRYBAYwWIqG5JZdBydyTKJwwSR6Xf95p/Z4z4V
 GyMgCLmiaSKUISKP2sm7m7suwQ==
X-Google-Smtp-Source: ABdhPJyBUaGS6buzVXPID50rG0JvO7x5+eFVDVsq9yIhY/8e/yNNVmJqXmePEKjoThhiDzsbBZ70GQ==
X-Received: by 2002:a05:6214:18f2:: with SMTP id
 ep18mr51647qvb.96.1594654497166; 
 Mon, 13 Jul 2020 08:34:57 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 21sm19500226qkj.56.2020.07.13.08.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 08:34:56 -0700 (PDT)
To: Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-msm@vger.kernel.org
References: <20200701042528.12321-1-jonathan@marek.ca>
 <3063d037-a781-6327-ef88-37b626c552e1@linaro.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <9f0628df-26b2-6ec8-3868-b2f72f0c8918@marek.ca>
Date: Mon, 13 Jul 2020 11:33:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3063d037-a781-6327-ef88-37b626c552e1@linaro.org>
Content-Language: en-US
Subject: Re: [Freedreno] [RFC PATCH] interconnect: qcom: add functions to
 query addr/cmds for a path
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, kbuild test robot <lkp@intel.com>,
 "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 7/13/20 11:24 AM, Georgi Djakov wrote:
> On 7/1/20 07:25, Jonathan Marek wrote:
>> The a6xx GMU can vote for ddr and cnoc bandwidth, but it needs to be able
>> to query the interconnect driver for bcm addresses and commands.
> 
> It's not very clear to me how the GMU firmware would be dealing with this? Does
> anyone have an idea whether the GMU makes any bandwidth decisions? Or is it just
> a static configuration and it just enables/disables a TCS?
> 

The GMU is able to vote for bandwidth, and presumably RPMh is 
aggregating those votes with the votes from the interconnect driver. We 
need to be able to fill out the "struct a6xx_hfi_msg_bw_table" in 
drivers/gpu/drm/msm/adreno/a6xx_hfi.h, which has a table of DDR 
bandwidth cmds which can be selected when changing the GPU frequency 
(the bw field in a6xx_hfi_gx_bw_perf_vote_cmd).

 From Jordan: "the GMU registers a bus vote directly with the hardware. 
It should handle aggregation for us."

> I think that we can query the address from the cmd-db, but we have to know the
> bcm names and the path. All the BCM/TCS information looks to be very low-level
> and implementation specific, so exposing it through an API is not very good,
> but hard-coding all this information is not good either.
> 
> Thanks,
> Georgi
> 
>>
>> I'm not sure what is the best way to go about implementing this, this is
>> what I came up with.
>>
>> I included a quick example of how this can be used by the a6xx driver to
>> fill out the GMU bw_table (two ddr bandwidth levels in this example, note
>> this would be using the frequency table in dts and not hardcoded values).
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 20 ++++-------
>>   drivers/interconnect/qcom/icc-rpmh.c  | 50 +++++++++++++++++++++++++++
>>   include/soc/qcom/icc.h                | 11 ++++++
>>   3 files changed, 68 insertions(+), 13 deletions(-)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
