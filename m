Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D180628131B
	for <lists+freedreno@lfdr.de>; Fri,  2 Oct 2020 14:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AF46E94E;
	Fri,  2 Oct 2020 12:48:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8436E94D
 for <freedreno@lists.freedesktop.org>; Fri,  2 Oct 2020 12:48:09 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c2so1116963qkf.10
 for <freedreno@lists.freedesktop.org>; Fri, 02 Oct 2020 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qqs8ifS6kGN7LaOJsBRoUbMeD52hvAgPJsDQbcB16Ww=;
 b=teN6lt9dYbTfeK4iHJe5EwHYYiMp8qbujal8f2CalekS8vb2pw+hAbarMaC3Dyy9/g
 ZfIA6rxZ9+yK1ffdf1KM9aXD59XN5OfD6qRSiLddDtflDi4Ns2xS4ysacecYmjOd7o/Y
 yxEz9yyXAVHbarO0UEK5GcYkbh6LYgtCsMFINrC1goIVzmQcfcXJ0TdsTCOQ04mn42DW
 /AlRtZTPtEqGBYUA1DQfKR//S00/OvShWyJNcVZIzaLAcz9/Wc+28PbrogAtHRSlGAAI
 sQsJAebzVERb8ad8PnaY3cuZPZc9FzzPw7D1bDFLlaueXV9yx3ZzezN5CqLgQgId8xb4
 aB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqs8ifS6kGN7LaOJsBRoUbMeD52hvAgPJsDQbcB16Ww=;
 b=ieCG1WxHrUsOZVDEl0cvy5mXc4x2jRTU8IxvSlizbEND6lQmz06YErFeMpT4k4NtAH
 yhbI+j3YJrJt+HaZGutS4+pIpG2D6FVns7yJsU8Zd2b3w0MGrdKJzeMcWZnQBztGDoBp
 scSUK0q+Mm3KjVVZapJAwBopHZi6SwIYGn85WgiSFLUeJcGEw420YWBKqVa8VH6H1Eot
 Lsw20k3adXNcx4cb/XGt27pKvodqcFFNmWiQLJvqcvSM8Mn1zwzcdzS8Lr2uPMprAq4Y
 Jey9/6G+UFhIGdef8clMXdtQ2w80On4hRqEFpxiSaLGuxZ4HTI+3y6LIgY9nra3UWpzP
 wjng==
X-Gm-Message-State: AOAM532Hxktrk8Y9SPYc3lFztEhYci5Vwu54b4KpPmRn5E5bCWvCwCiW
 Z30cII1OB/BPIdpsaPg2Xb7tqg==
X-Google-Smtp-Source: ABdhPJyQ2dJDmsq+UUaIzuzIq5vMU2J1btgFAxj6GOPoha5mgRKT6bHemLD/hK/dXSldsS3NSojT2A==
X-Received: by 2002:a05:620a:13f9:: with SMTP id
 h25mr1764964qkl.283.1601642888962; 
 Fri, 02 Oct 2020 05:48:08 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id j25sm921577qtr.83.2020.10.02.05.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 05:48:08 -0700 (PDT)
To: Christoph Hellwig <hch@infradead.org>
References: <20201001002709.21361-1-jonathan@marek.ca>
 <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
Date: Fri, 2 Oct 2020 08:46:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201002075321.GA7547@infradead.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for
 non-coherent cache maintenance
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/2/20 3:53 AM, Christoph Hellwig wrote:
>> @@ -8,6 +8,7 @@
>>   #include <linux/shmem_fs.h>
>>   #include <linux/dma-buf.h>
>>   #include <linux/pfn_t.h>
>> +#include <linux/dma-noncoherent.h>
> 
> NAK, dma-noncoherent.h is not for driver use.  And will in fact go
> away in 5.10.
> 

Not actually used, so can be removed.

>>   
>>   #include <drm/drm_prime.h>
>>   
>> @@ -808,6 +809,20 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj)
>>   	return 0;
>>   }
>>   
>> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
>> +		size_t range_start, size_t range_end)
>> +{
>> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>> +
>> +	/* TODO: sync only the required range, and don't invalidate on clean */
>> +
>> +	if (flags & MSM_GEM_SYNC_CACHE_CLEAN)
>> +		sync_for_device(msm_obj);
>> +
>> +	if (flags & MSM_GEM_SYNC_CACHE_INVALIDATE)
>> +		sync_for_cpu(msm_obj);
> 
> And make to these ones as well.  They are complete abuses of the DMA
> API, and while we had to live with that for now to not cause regressions
> they absoutely must not be exposed in a userspace ABI like this.
> 

How do you propose that cached non-coherent memory be implemented? It is 
a useful feature for userspace.

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
