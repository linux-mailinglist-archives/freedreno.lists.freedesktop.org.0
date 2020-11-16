Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0664F2B4E9A
	for <lists+freedreno@lfdr.de>; Mon, 16 Nov 2020 18:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B566E094;
	Mon, 16 Nov 2020 17:56:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7016E094
 for <freedreno@lists.freedesktop.org>; Mon, 16 Nov 2020 17:55:58 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id r12so9158488qvq.13
 for <freedreno@lists.freedesktop.org>; Mon, 16 Nov 2020 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E8dVzLq70NYkCDseFzmbLwa/urvtTDPkDdBtFGGN6D0=;
 b=M4o0yAJtuwdwVHCFv76S5VG1YfEGJmnNrFwmo84W1XR7pfDC3QibdJzFpH5AeaIykv
 JeFMb9H78yvKh5jtpNNG/SpXGgI0QOy93BAJNetXtXZuQMUhdUwfqBUFqt0vEyVb6ZB0
 4DR+OG3iowahd0NLee2pdnSouzWtomf5UY91th9YTb3ik0jqNjGGq15pL+7bwdf3/oUb
 EJ9swCP2IfQ8Ec9smzzKfsMfj20TxlfhwB3xALmxlLiiPd20ayVVJCPFfPlLIwm2MJnR
 GrrZx/ZjLa1E+yYmu/Gf3HfimSIaTOl23XtyAwyxQtQuM6lrg7EfrvpfzKzwx6bGvHda
 lHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E8dVzLq70NYkCDseFzmbLwa/urvtTDPkDdBtFGGN6D0=;
 b=t+zrw8A++Z3z1gipJr20BqsGo9ZX+CRysrNWv97Ie2bU2WccYrIx6FPNPaUNYtQBBq
 A1mMo/bVzwYHtr37eHAhNe2X9NX3hTfaQm89RAbCkicLWQlT++IqSQDD43XixRmhSJen
 YZfuJRC00dh8mHNrB9Mf4uPC8rbFnu0Zdt1uc6r/tCDRHnZdDnL1DJW5qI0YA4fHyrtl
 HagssZT2K6PxLLa/ecRnsIPdISB+wiaWEn6x43EwS9oGVUqg3Hg0KL7b+npBM+NlLAGe
 eFDyxN2qLXtIPUsDNN0d9ZwkxfQCQTxY3NpLpJjINECaLjbzyiH3BKXcf6zHFFR/bHLJ
 Fuog==
X-Gm-Message-State: AOAM530CBrLk4uTQI+VOXwTNbEeATKsPYgAQ07IygiCLu6qp9pAxXHHp
 PikJf7uHs2KpO/MPZygVMAJw3w==
X-Google-Smtp-Source: ABdhPJzaZqMKn8xovkF8P6M/eGyZjGXaTO9LqPdsEfmRScwlIiXF508R9sNXAXVwP+ldTfKElwlGOg==
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr15592022qvf.8.1605549357940; 
 Mon, 16 Nov 2020 09:55:57 -0800 (PST)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id q123sm12890805qke.28.2020.11.16.09.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 09:55:57 -0800 (PST)
To: Rob Clark <robdclark@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Jordan Crouse <jcrouse@codeaurora.org>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca> <20201114162406.GC24411@lst.de>
 <CAF6AEGvujttEkFuRqtt7i+0o7-=2spKXfAvJZrj96uWAFRLYuA@mail.gmail.com>
 <50ddcadb-c630-2ef6-cdc4-724d9823fba7@marek.ca>
 <CAF6AEGsH5Wk=J+HxHnRqTMLZscjErjKq2v0Rms7Td=W7icZ3sw@mail.gmail.com>
 <b6e4f167-871a-5f26-46bd-d914476af519@marek.ca>
 <20201116173346.GA24173@lst.de>
 <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <b798d954-d0b5-d968-f03c-b3fe9ffd08fc@marek.ca>
Date: Mon, 16 Nov 2020 12:52:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuFzsurd4n6G-nUmCusTJ8vMo9Kqjzs3JRS_d6n+qHgEA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Freedreno] [RESEND PATCH v2 4/5] drm/msm: add
 DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
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
Cc: David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/16/20 12:50 PM, Rob Clark wrote:
> On Mon, Nov 16, 2020 at 9:33 AM Christoph Hellwig <hch@lst.de> wrote:
>>
>> On Sat, Nov 14, 2020 at 03:07:20PM -0500, Jonathan Marek wrote:
>>> qcom's vulkan driver has nonCoherentAtomSize=1, and it looks like
>>> dma_sync_single_for_cpu() does deal in some way with the partial cache line
>>> case, although I'm not sure that means we can have a nonCoherentAtomSize=1.
>>
>> No, it doesn't.  You need to ensure ownership is managed at
>> dma_get_cache_alignment() granularity.
> 
> my guess is nonCoherentAtomSize=1 only works in the case of cache
> coherent buffers
> 

nonCoherentAtomSize doesn't apply to coherent memory (as the name 
implies), I guess qcom's driver is just wrong about having 
nonCoherentAtomSize=1.

Jordan just mentioned there is at least one conformance test for this, I 
wonder if it just doesn't test it well enough, or just doesn't test the 
non-coherent memory type?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
