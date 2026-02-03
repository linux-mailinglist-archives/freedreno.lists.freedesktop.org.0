Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nkkfE6JugWkrGQMAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 03 Feb 2026 04:42:26 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6FD4313
	for <lists+freedreno@lfdr.de>; Tue, 03 Feb 2026 04:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BCF10E4E6;
	Tue,  3 Feb 2026 03:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="abKlhYYZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AF610E4E9
 for <freedreno@lists.freedesktop.org>; Tue,  3 Feb 2026 03:42:23 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-34c868b197eso3730740a91.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Feb 2026 19:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1770090143; x=1770694943;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mQQ9Yn0qN8mFWXLqjsawjzfjPTO4eluX+BjJlD5wAq0=;
 b=abKlhYYZNHFmFSGIG9THBxUOoF3/CBbeKMZS9OedMtFtZbKcmJZTaFfXhyKYC65MUX
 4of+U54PMsg2jPptaTWe5vH4lgqhNZGFG0c6D4pHacYRu2sVw8t7kskXTP4QOoDPzjgC
 vEJy6/HwP1XP2wiFgdnHBSMfYyz0EtyKFb0d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770090143; x=1770694943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQQ9Yn0qN8mFWXLqjsawjzfjPTO4eluX+BjJlD5wAq0=;
 b=NSVhI/MqBInBKRJskIXpD6+hOWbIcGJkrgavZ3kn/7rIjPyMrvmueAJjKNVgb5TuyV
 JAhgEiBd+wkxAqoB4XobcUA/yt3UUTmooUOkJi+wWn+qhsvy1OqjyFO2B37VlfldYyzE
 aHbHNUEOG41EJTVlN1vmXeE+h2DJ7ZqG3jtcg1E9QySSjVwoROOc5YQ6AMNWwDiEwAFB
 2GCLGu7Ub/eTi4XkG0WhMRWiI66+OQccnYVMKwuCnRnYf4Ljy2vSi9olwLpwQrPZQcB7
 sBRaE30N93clxSG8cX0CcowBggC5d5EAAq+VcfjI5OmMqZONh+kpeMgwgeVa4to+LIe5
 HKAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Acz4L41OEPAR2P6TBz/XZYoxX8X1drZvfoTB2Gwj8byDtoluSHdxdNhALXiYZacguvQ3hG8xmfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHFdw2VwKfK6P5y/toletDW9qUJipeVHZE9Mmr874QmU+FybHN
 6F1GP68JXZ6HeXUyyml7EGDxesKHvKBEQzcx7kj5K366jDKyHtQKaVe/aJimIVGykg==
X-Gm-Gg: AZuq6aJQRNXSBZkf73CWfABU9uDTJqtGff7q8EEmmFbTFcmQ3PjSu7bLfFJRYUTQMN0
 xUE+yKXZ9OJL/NJY6jYfuI/O7l2fFZg5fLkr6mGMiTarVpTi+eeDzzHuOGCs6hGlM9qepzCgDvi
 DEwjaR92X1cMvlevYOJqOIG8/gtNTGM4dwUQlFlSs3qznbahe8URvTKOVykNbwWLn3NLjgS6Fee
 PJUPRt6EePVrSRTkHEsW2jA97Pobct8MxaKIGkXWJko6K3xOyFjF6t9LAy3CPkuJ7diQBuyc7QC
 Su4uoN6XeSFu7tEOKeq/sueHw3v4KHJwlaPLO8+xAvemocyEb0Y9G57D0jBVHzrMZuVETwbIFTC
 gMczzOKd4Uhyx9aIT4BA+6EV5KFhuKO0wEHn6Kdrnd0DbEerDbITspUtMCio9m66AhWN/3VswJu
 mENlsN02Hmi0iyIeKKkRn6/EuiCYwvNOFZihsKKvBfGqtW3MjIFA==
X-Received: by 2002:a17:90b:4a4e:b0:340:d578:f299 with SMTP id
 98e67ed59e1d1-3543b2dcba2mr12892974a91.3.1770090142638; 
 Mon, 02 Feb 2026 19:42:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad8e:5863:2270:6d7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3547b10364csm342726a91.10.2026.02.02.19.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 19:42:22 -0800 (PST)
Date: Tue, 3 Feb 2026 12:42:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Message-ID: <nbk32ecg6wgdghnsr4amj5wufk4t7pavbsuqjvc6ulychjr6jh@zyyrzqbjes4i>
References: <20260127073341.2862078-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127073341.2862078-1-senozhatsky@chromium.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tfiga@chromium.org,m:senozhatsky@chromium.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[senozhatsky@chromium.org,freedreno-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 97B6FD4313
X-Rspamd-Action: no action

On (26/01/27 16:33), Sergey Senozhatsky wrote:
> We sometimes get into a situtation where GPU hangcheck fails to
> recover GPU:
> 
> [..]
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
> msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
> [..]
> 
> The problem is that msm_job worker is blocked on gpu->lock
> 
> INFO: task ring0:155 blocked for more than 122 seconds.
> Not tainted 6.6.99-08727-gaac38b365d2c #1
> task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_preempt_disabled+0x30/0x50
> __mutex_lock_common+0x410/0x850
> __mutex_lock_slowpath+0x28/0x40
> mutex_lock+0x5c/0x90
> msm_job_run+0x9c/0x140
> drm_sched_main+0x514/0x938
> kthread+0x114/0x138
> ret_from_fork+0x10/0x20
> 
> which is owned by recover worker, which is waiting for DMA fences
> from a memory reclaim path, under the very same gpu->lock
> 
> INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
> task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
> Call trace:
> __switch_to+0x108/0x208
> schedule+0x544/0x11f0
> schedule_timeout+0x1f8/0x770
> dma_fence_default_wait+0x108/0x218
> dma_fence_wait_timeout+0x6c/0x1c0
> dma_resv_wait_timeout+0xe4/0x118
> active_purge+0x34/0x98
> drm_gem_lru_scan+0x1d0/0x388
> msm_gem_shrinker_scan+0x1cc/0x2e8
> shrink_slab+0x228/0x478
> shrink_node+0x380/0x730
> try_to_free_pages+0x204/0x510
> __alloc_pages_direct_reclaim+0x90/0x158
> __alloc_pages_slowpath+0x1d4/0x4a0
> __alloc_pages+0x9f0/0xc88
> vm_area_alloc_pages+0x17c/0x260
> __vmalloc_node_range+0x1c0/0x420
> kvmalloc_node+0xe8/0x108
> msm_gpu_crashstate_capture+0x1e4/0x280
> recover_worker+0x1c0/0x638
> kthread_worker_fn+0x150/0x2d8
> kthread+0x114/0x138
> 
> So no one can make any further progress.
> 
> Forbid recover/fault worker to enter memory reclaim (under
> gpu->lock) to address this deadlock scenario.

Gentle ping.
