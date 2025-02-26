Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ECCA45DDD
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2025 12:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9271910E1D4;
	Wed, 26 Feb 2025 11:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wh8oJzCr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68C10E281
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 11:55:09 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso7437943e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 03:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740570908; x=1741175708; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MV1eFL0jIvGTLmDaJhQUuUnheAKwvr3wFZVERN6PrWg=;
 b=wh8oJzCrTytX8bDyuuumvLEG0Lmygcczz9taOX775XAJ0qxcNW/XH0dZ78AbR/F4tT
 aEp7TixO2fiYhbA9/d36evSAYNyGvlhfpiSgAWKGi0P3l4aaeBPooY73qBvy9z3LO/YB
 T8U1Jod2L1Esr8/9uySitWoLk42WUF+wesapuh9+MBQHr4Q+yN9y4em2B4zyxNRpK8wv
 qgPBgIEXifzMGLgc0Clw5d7EM38PYT7kTPssX3QBukCetTMWeB01GGc+0hKHcA4d3d/3
 a/BC3KaAHXZ/SOwgrYeIKL7Qp3Gu+LiwpbTgS+pXJfrvYOpa+OKpZCF5xR/OdXAHCsRe
 FGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740570908; x=1741175708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MV1eFL0jIvGTLmDaJhQUuUnheAKwvr3wFZVERN6PrWg=;
 b=DurSayY96WMc7RRE+XMFtLt3F+/c1SRmcgQVLbA5hJr0gLNEeKA+M8Tah34TCBKMqP
 F5DFf+YP+BdIsc9lHoXDZjne1DwvJVzvQcAwfiag1Pk1EbF8Wn6uJsKjkAGfn6GYyYDE
 2VJCBTnOQ7Ca/EdcyUStkNOqrH1BSa/f/rQrKBSxhyP4gAfMxqUKlqS9El/8JXhGyDpU
 iETrmN/pG8hJH7Oi67TEcCK0t8FLV923fg3cbsIIjOANEp8j6jbox0MKmDDMKDD1EXeQ
 UiBEC5gOAUc3omA4BRBfX80tyLKUBfFvrM1cZny7Nfigd8mt+8Muqpc4nTNQyS7TXT92
 1VsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5VhxnubZFM/bO0uPUCreN89juBibsNhLNIr/R4oSDukhv+9oasuBaXrJ0t2do0IzUpQ5c8ZjoIQg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq8V7uS6RA+0AVTVIpwfrvGzeGiYuW0yoElyI2EItBsWv4knTE
 VE7GRK/WA8uEBE4gixMEjrHY1f5rKvFo0vJKhIHGIjQM3G++8yGvLGEAy2Ru8JQ=
X-Gm-Gg: ASbGncujeRFjdwGFxFBz3MbZniU0qWvHrdRS6KEtdgUOLyhj7OQjuIl7563uzuP9xC2
 c/K1IDi8mQmO2McT39qaHFKdiwQ2ZcgCXKRLq8S2k/8+UUx8aKi0XZJATVW+IK+RVLbUmAMx/DH
 0MMy2kMuJGLLlaZLaFkyrvwMotA0XifeGUBSYNhsJQH6hs/WoZpnsKHqWfHFVdX5qWsOP952yAF
 NQY1Ofruu/+oaP/6jwhmPkRx8/RGsvRqfjZ48WrmYwQJosWFIB6igzBuSpRLJojnjvkGb+8tLN4
 cl+m3xf1CQDY7FoWg3Ka1IQJxCH5w1WxVa8ZfCq5iWDKHC/ZqT/tIYFbi9CmKHAX87rZ3I7pJEG
 UDBB32Q==
X-Google-Smtp-Source: AGHT+IFdiaumSjl7stITiQ2wEKd5TEV1JT0pl/xh0E9GddvITQblHFNg5YZZAQPAKKG1ai2p/TA91A==
X-Received: by 2002:a05:6512:3f2a:b0:549:39ca:13fe with SMTP id
 2adb3069b0e04-5493c5b85bamr2298709e87.41.1740570907382; 
 Wed, 26 Feb 2025 03:55:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b2574sm434994e87.21.2025.02.26.03.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 03:55:05 -0800 (PST)
Date: Wed, 26 Feb 2025 13:55:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: don't set crtc_state->mode_changed
 from atomic_check()
Message-ID: <vn3f6jzx27twq7maamdmeqahvn4zzoxmdttkm7epg2qgn4ueov@hqzjzzzw3mog>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
 <20250123-drm-dirty-modeset-v2-4-bbfd3a6cd1a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-drm-dirty-modeset-v2-4-bbfd3a6cd1a4@linaro.org>
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

On Thu, Jan 23, 2025 at 02:43:36PM +0200, Dmitry Baryshkov wrote:
> The MSM driver uses drm_atomic_helper_check() which mandates that none
> of the atomic_check() callbacks toggles crtc_state->mode_changed.
> Perform corresponding check before calling the drm_atomic_helper_check()
> function.
> 
> Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
>  drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
>  5 files changed, 77 insertions(+), 5 deletions(-)
> 

JFI, this patch generates following warnings, deferred now:

10:49:07.279: [  235.096198] WARNING: CPU: 1 PID: 515 at drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:459 dpu_kms_check_mode_changed+0xb0/0xbc
10:49:07.279: [  235.107375] Modules linked in:
10:49:07.279: [  235.110532] CPU: 1 UID: 0 PID: 515 Comm: kms_atomic_tran Tainted: G        W          6.14.0-rc4-gd229bc98da6b #1
10:49:07.279: [  235.121069] Tainted: [W]=WARN
10:49:07.279: [  235.124130] Hardware name: Google Lazor Limozeen without Touchscreen (rev5 - rev8) (DT)
10:49:07.279: [  235.132356] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
10:49:07.279: [  235.139513] pc : dpu_kms_check_mode_changed+0xb0/0xbc
10:49:07.279: [  235.144712] lr : msm_atomic_check+0xc0/0xe0
10:49:07.279: [  235.149023] sp : ffff8000843f3960
10:49:07.279: [  235.150686] usb 1-1.1: new high-speed USB device number 100 using xhci-hcd
10:49:07.279: [  235.152439] x29: ffff8000843f3960 x28: ffff65a18386d080 x27: ffff65a184826a80
10:49:07.279: [  235.166848] x26: 0000000000000038 x25: 0000000000000008 x24: ffff65a1866fd580
10:49:07.279: [  235.174188] x23: 0000000000000028 x22: 0000000000000028 x21: 0000000000000038
10:49:07.279: [  235.181527] x20: ffff65a184826a80 x19: 0000000000000000 x18: 0000000000000000
10:49:07.279: [  235.188866] x17: 0000000000000000 x16: 0000000000000000 x15: 0000aaab013dfeb8
10:49:07.279: [  235.196215] x14: 00000000000c0000 x13: 0040a00000400800 x12: 0000000000000000
10:49:07.279: [  235.203553] x11: 0000000000000050 x10: 0000000000000000 x9 : ffffbdf7fc448530
10:49:07.279: [  235.210892] x8 : 00000000ffffffff x7 : ffff65a182610400 x6 : 0000000000000038
10:49:07.279: [  235.218231] x5 : ffff65a18314b000 x4 : 0000000000000000 x3 : 0000000000000001
10:49:07.279: [  235.225570] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff65a18ca7a600
10:49:07.279: [  235.232910] Call trace:
10:49:07.279: [  235.235440]  dpu_kms_check_mode_changed+0xb0/0xbc (P)
10:49:07.279: [  235.240641]  msm_atomic_check+0xc0/0xe0
10:49:07.279: [  235.244594]  drm_atomic_check_only+0x498/0x934
10:49:07.279: [  235.249169]  drm_atomic_commit+0x48/0xc4
10:49:07.279: [  235.253209]  drm_mode_atomic_ioctl+0xa98/0xd00
10:49:07.279: [  235.257791]  drm_ioctl_kernel+0xbc/0x12c
10:49:07.280: [  235.261832]  drm_ioctl+0x228/0x4e4
10:49:07.280: [  235.265339]  __arm64_sys_ioctl+0xb4/0xec
10:49:07.280: [  235.269381]  invoke_syscall+0x48/0x110
10:49:07.280: [  235.273248]  el0_svc_common.constprop.0+0x40/0xe0
10:49:07.280: [  235.278090]  do_el0_svc+0x1c/0x28
10:49:07.280: [  235.281512]  el0_svc+0x48/0x110
10:49:07.280: [  235.284753]  el0t_64_sync_handler+0x10c/0x138
10:49:07.280: [  235.289234]  el0t_64_sync+0x198/0x19c


-- 
With best wishes
Dmitry
