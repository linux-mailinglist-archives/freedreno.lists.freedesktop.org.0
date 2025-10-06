Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCCBBDD68
	for <lists+freedreno@lfdr.de>; Mon, 06 Oct 2025 13:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01FB10E42C;
	Mon,  6 Oct 2025 11:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nazSXwm/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7085710E42B
 for <freedreno@lists.freedesktop.org>; Mon,  6 Oct 2025 11:12:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso35435445e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 06 Oct 2025 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759749146; x=1760353946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Y28niRMzt7DTJLvTv7YHssogiH+TYaxfjknJwt5S2c=;
 b=nazSXwm/s0YPjjAlQDxnfYoMb8I/5aZ9gV6acGhn1V5o0UEnag6QD/xdjMcnO9STiW
 TH7fbAH3NHshFIP7yv8vHLNebT97s9UbgQwjmJDkkcsDASw/VYS1KrNBhjE+eW9L+41F
 yOnTT31oRfgfb/JNQo3aNC09/+qeBcYnrc36jVOHlIYFS8RQWzBjM09Q3qfIrcgm+dr7
 ozfUooW1yURNq28IRTKyFOyYCJLGlRd2GaV4UvYrNRx/ZTsWtw/NHvW8LghN8flhFnXE
 HqIQGSzl6+mcO+qiaGLU7PXpz0lEAZeFgyvEvBeBiKE44vl7D7Yj+BoY0KHpB4MXVfrb
 tmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759749146; x=1760353946;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Y28niRMzt7DTJLvTv7YHssogiH+TYaxfjknJwt5S2c=;
 b=lZeKsYkNx2dPr7U/8zStY7m0luA1ouvZvvjsMT2JSirmO78lGkFIq39B1q18wzgFOy
 K/fd6kmCRIGOSHX7kSDUeaJG1oZaBUrw+epKi3ikbdEOv7l7amxO5IudrtAW7IQvNPWh
 cy68k3gCibiyifgv0qZDT2MVzdaIlQ1V7yTcSva9hEubu1wSAFR3gTS2EG253VzxNhZq
 d8pXoZyPOm2sjiAdEuLhsa/FQFJG2UcCS/DNWR6F9q8aMZEcozfTdLCDLvOBXOQNsD3B
 33E3J8yh6AKR4r3VrgDPi4oATQSsboOWK/VC4w2HjimcsIJtSveE2vyVvLBUHt3vkIf2
 EWxg==
X-Gm-Message-State: AOJu0Yyg1K03xmbfoHWi+i/QTeNwCCgpslQAm4I0TJ4esp9nhgGue72l
 Yx6+BoVR2SVganB0UyK7Dx0v6D6vGV/95l1IIPlghBH+alcQKswc6kQwtj0sHuGfAc0=
X-Gm-Gg: ASbGncsRhml/r71v/NDIl0QCowpIWpHaGE3hgfRRm1KE0NOsXizRANojn7xp/LC4/Qf
 98dQAV3dyAQli+t6YbnXI0O6XNJn/of43hb4XH/1c2UMP+OBT26B5kg35+YVLdCw4VDpUlq2MdK
 ZOp9+yHiFNJZNie6Zd5OsP3P3cCmDKUlwNWmhmuf9+g6SM64uKXjQ57hUkDBUiD4IA/kM87Ycz5
 ZvDNDDmK0nJP0Tm8ff2cxDte/cX1ygFSRlhKAFZYXYOAx72Wr9lf3NOhGsdBusBYdC915TTgUtC
 VCsi3AOK7kB0lH2o34oplvEV7oC3iO3reyw01nzkncp6tsqjYvzMnwzCBKj/snkqWnAM0FwDdzO
 g3koG6HSO9NI4CUw2XEB6Zo1qLPVeEpTqJ/h/oG8XA+GApGCB3E4nzb5203Mog8iy2/qMaEbcAx
 RwdclhB2WxC+H4tP34CSYWXICThXs=
X-Google-Smtp-Source: AGHT+IED6zGsorMymWzXbyfZfVfZ17caCEuzSle55VwjdBVqw0LnTAkN02fIG8Fbsdt4Nd5VRu5UlQ==
X-Received: by 2002:a05:600c:920:b0:46e:74bb:6bd with SMTP id
 5b1f17b1804b1-46e7760bed7mr42278615e9.4.1759749145876; 
 Mon, 06 Oct 2025 04:12:25 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b622f37sm144432315e9.1.2025.10.06.04.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 04:12:25 -0700 (PDT)
Message-ID: <5ab4d0a3-6c58-49b1-93b8-7a69b150c1a9@linaro.org>
Date: Mon, 6 Oct 2025 12:12:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <zR1Ft0CGCZU6PwpoeaGHv9LDWAyJqqpAXhI25pUYMlRV1LfCJYhuDQVLkclBphRZkgcA-VrvHykxdchDBlzrmw==@protonmail.internalid>
 <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23/09/2025 15:04, Rob Clark wrote:
> Imported dma-bufs also have obj->resv != &obj->_resv.  So we should
> check both this condition in addition to flags for handling the
> _NO_SHARE case.
> 
> Fixes this splat that was reported with IRIS video playback:
> 
>      ------------[ cut here ]------------
>      WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
>      CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT
>      pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>      pc : msm_gem_free_object+0x1f8/0x264 [msm]
>      lr : msm_gem_free_object+0x138/0x264 [msm]
>      sp : ffff800092a1bb30
>      x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
>      x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
>      x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
>      x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
>      x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
>      x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>      x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
>      x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
>      x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
>      x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
>      Call trace:
>       msm_gem_free_object+0x1f8/0x264 [msm] (P)
>       drm_gem_object_free+0x1c/0x30 [drm]
>       drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
>       drm_gem_object_release_handle+0x5c/0xcc [drm]
>       drm_gem_handle_delete+0x68/0xbc [drm]
>       drm_gem_close_ioctl+0x34/0x40 [drm]
>       drm_ioctl_kernel+0xc0/0x130 [drm]
>       drm_ioctl+0x360/0x4e0 [drm]
>       __arm64_sys_ioctl+0xac/0x104
>       invoke_syscall+0x48/0x104
>       el0_svc_common.constprop.0+0x40/0xe0
>       do_el0_svc+0x1c/0x28
>       el0_svc+0x34/0xec
>       el0t_64_sync_handler+0xa0/0xe4
>       el0t_64_sync+0x198/0x19c
>      ---[ end trace 0000000000000000 ]---
>      ------------[ cut here ]------------
> 
> Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 9f0f5b77f1bd..3aea9b493375 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>   		put_pages(obj);
>   	}
> 
> -	if (obj->resv != &obj->_resv) {
> +	/*
> +	 * In error paths, we could end up here before msm_gem_new_handle()
> +	 * has changed obj->resv to point to the shared resv.  In this case,
> +	 * we don't want to drop a ref to the shared r_obj that we haven't
> +	 * taken yet.
> +	 */
> +	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
>   		struct drm_gem_object *r_obj =
>   			container_of(obj->resv, struct drm_gem_object, _resv);
> 
> -		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> -
>   		/* Drop reference we hold to shared resv obj: */
>   		drm_gem_object_put(r_obj);
>   	}
> --
> 2.51.0
> 
> 
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5
