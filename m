Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A997FAECE2C
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469810E0A7;
	Sun, 29 Jun 2025 14:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KQZvLpk3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602DD10E0A7
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751209008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
 b=KQZvLpk3SY4c7Xy3YHo1Qngtcm+c7NinmPvr9RogHwuDS3Oec+TuyfyGcIXA6O7ZU9p1BD
 cM89Nh3J9aIyxaD5ynI9LGQx92CLn90RZwavSmdKheacMmo2NK47RE6nMJq32ZXt5VVPNl
 wgRVPzHc0mXunGBtFaKHHYgdxRc0DsE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-P1-FjbF_MgWu58m1HjJXcw-1; Sun, 29 Jun 2025 10:56:47 -0400
X-MC-Unique: P1-FjbF_MgWu58m1HjJXcw-1
X-Mimecast-MFC-AGG-ID: P1-FjbF_MgWu58m1HjJXcw_1751209006
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-451ac1b43c4so17430095e9.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751209006; x=1751813806;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=23nBsXGE98DROnysLRUCmBBmFEY55o2S0OpjTv0kX+I=;
 b=l6KVVuckTLs0BNvNIIz58JEVwyFscUti4e4DrWIf5fXoK4bHG6D6XYMasXUnQSvXy3
 HinIGHm88Tmso5/gADWO/+3AenQWL3I+sRcLXAYO8is1NbwFN2eHIkSRbmzy+yv62rYY
 U0M0elWeqD+veJ1T978TLwpewUDzoh0AnqriyM3pWUNPYoZkP5tngvo6xo5a9O2hR0T3
 zmiUiv/wGJaUVkxMD9AqruM/4dhd3PgsblmO8fGQ4HBhP2l5x5to+81OSN7sut9tmIpr
 MD7tOdxxiWvqzVIZEbZsTeBLd9uyGcPsjCaWrp51OQhqCOn5uCbKhtuXSVT7lkLtx/AC
 n86w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNXlbi6W6Y09IdDFbi236Zv9wx3japnHL6wba4cPeVhJOUcY91ABwfZ61ivkqIOAUgfbrTjr3uleE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUAZCKtyUyiHq7mqtM8c7pZ2vr9h7NfE6PvK6kuYWDIBhjps6G
 1IFkNjsUVWihrXgh1iFd4CB+ZCiQqqW73z4zrUzCodhbnqlly+Vhby5VSV+oiuf91GHZLi7tvbp
 S0Mx59dk5kYTobF+AkgwipsbRYc74yRQ/eYLOX9iv7wroA8wPRFLIz5sfG2VvTzSMaQxH6w==
X-Gm-Gg: ASbGnct0XhbjCiFaghCLH6g6qpTTyKxn4mCzTPhBnAI4tDu6WsZulub36GMgmPsXIrb
 0s6kS0YCzxCzWrlf38YqaOiyk+eUqZG/rDG5PEbcug8XWU3qZxNW+QGWIcq6Ky6DlJBh1fRT60k
 RO2EJwX592Ir/1nR+1Qewv2CpOYISSbBoBTUhMVtf2z8NsLdR5dr4SqgtZivyja4exUbUPWoMuW
 WQ5te1iwWgN8S43KV6XRlywovuHGTuxVsSYJw+nPST4W6ar52gkpRGAC0q6ZRyd4TyoKDw3hysC
 PaYFBgPQfXAlnBqvCW1CVRjQSDq90EeKGzd1jAOp9hSE7XOtHmasvXyxqAtN0Q==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id
 5b1f17b1804b1-45390bfd05fmr100453945e9.15.1751209005844; 
 Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzwxSKog3DMgujlctJnFDZzoxRMzCEAFRJd/Z3o45oYA0FJvn/qBy7zWWf7etH266Pm4C3Zw==
X-Received: by 2002:a05:600c:1ca0:b0:440:6a37:be0d with SMTP id
 5b1f17b1804b1-45390bfd05fmr100453805e9.15.1751209005387; 
 Sun, 29 Jun 2025 07:56:45 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b?
 ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a6716sm107501365e9.11.2025.06.29.07.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jun 2025 07:56:44 -0700 (PDT)
Message-ID: <da066412-9514-4475-9602-0317efa458e3@redhat.com>
Date: Sun, 29 Jun 2025 16:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/gpuvm: Add locking helpers
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
 <20250620154537.89514-3-robin.clark@oss.qualcomm.com>
 <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CACSVV03d-3J2SxSnm3oS2OG9LHEJzLKpmgWF=Cx8_Qgw3PZPVQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: izZ8_88KaXM-7HLhF9fJi6Fah_g4WNwUHiNx0izYdNI_1751209006
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 6/27/25 3:04 PM, Rob Clark wrote:
> On Fri, Jun 20, 2025 at 8:45 AM Rob Clark <robin.clark@oss.qualcomm.com> wrote:
>>
>> For UNMAP/REMAP steps we could be needing to lock objects that are not
>> explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
>> VAs.  These helpers handle locking/preparing the needed objects.
>>
>> Note that these functions do not strictly require the VM changes to be
>> applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
>> the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
>> call result in a differing sequence of steps when the VM changes are
>> actually applied, it will be the same set of GEM objects involved, so
>> the locking is still correct.
>>
>> v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
>> v3: Expand comments to show expected usage, and explain how the usage
>>      is safe in the case of overlapping driver VM_BIND ops.
> 
> Danilo, did you have any remaining comments on this?

I replied to this in your MSM VM_BIND series.

