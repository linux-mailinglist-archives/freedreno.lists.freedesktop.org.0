Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B97A19643
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 17:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123DE10E727;
	Wed, 22 Jan 2025 16:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="KdK4iKFO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53B10E727
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 16:15:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so78621325e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1737562502; x=1738167302;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6yifiK7k1egD832rtDY2X5ShBnrSfrr32YKaeunTC8=;
 b=KdK4iKFOSGcnO0aoEI+jD4eCVb69PwkWFLUq94aslSm4dHouSdF3BDvRuMrEx0Y3wj
 uabthTZX4K8LloKL4sfBEGzkWIaw1ArrQkVqeP2gCZuzOhBi88GD69htFu7liuqKQT7u
 WDSK+nUbktsQcDFVQjx2MR/dWqrLbkkqrBoVi0XYkpfjT9bKbKn3SF2ObT3F9i/XjE2p
 owVkqQEDlnJ9ylMgo3+LCpj+t6cSGgGWz9R+ohwpXXYZW0N5ZS2NcVaeiOXrfX2orwg+
 5gRIqqoEDCp57KMlMSJIDt5duAsSWMXBvOdckl2qyj5nt29ZrbRHKMWnl3sZqBlsgPow
 2tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737562502; x=1738167302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6yifiK7k1egD832rtDY2X5ShBnrSfrr32YKaeunTC8=;
 b=raoPvvNuxq36rn/tC5fohxAwKs3n+CzHgy0MIdE0Ct4guLyIT/tRoj0cfsFCYTB04q
 HWdYK6tjMjcQ3UQBaZlLMx22QM4xv8ln1Euk3BCyBDc76UqUwchjNV8NbXGf0hJcWmFS
 8mlz4qpTROtz1VLCxxwmaON/tbNdnnusmL2VAb+Qk8NFauMukE+0H9bAip+yfbdQzEOc
 Xvam+1WMeEs27QbZKL50vdfTtcTz6EO2Rbv/qdwh0Qu/rDhnKAqejU3wEfXzHPVMNrZY
 f7OKEM9y1XUMe+GsyT0ocrnhYWnPW96I7EKiWU+F9KYC7V8YtXqgYIOcEmeLmFcuQcyi
 AePg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGvhuL+sUpvPkubVtaiuYHAXl3cMcXr0qO+22tvbbW4YfvTB1BJ8g1L8c5git78rFrfs4baX/rXYc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTiBpKpnQE4DhcrIQGB8IiLL/E1sYj2H6Rd2Map9T8A5dmttsR
 9l6/YwaAVDHDYRa0Uz6mvj6Zmy7mYJTGeqfsIuNIiXVymbGwEtPjRIKs8aBMXew=
X-Gm-Gg: ASbGncswyHyswRoZFNad/EQDcRtNe4w9IdCz0LET9ONEGEXfJBSkfGk8x/x3qdeVGtL
 nJZs/7MEwAFlf4aXBBZiYV/enoJgRQFFuxZSsNxQplj4sFPAbV+sqMGwE9Q6EszrLuRupM7whkW
 AGZFVULPmVw25mu/Q9SdNCly1G7lM88CG9I2GRZC/yVLXnCDVld2wgk3SIPf9NJ7knOedEKKbBn
 q903Z/mnqugZeryXrpZAp/tE+fbCesxlKh+Kon/wHUg7NT3qk0YbFXvoB5ElnLBk+1CwY5ecfPo
 tWpt7Mg3mA==
X-Google-Smtp-Source: AGHT+IHjMS8YRSk6XzW0Efeh0A/XzjKRZHlKqwNXg3TUjzGuKVwVdcPgC6qrdd/tzzJ2CrO/z5EPcw==
X-Received: by 2002:a05:600c:4ecb:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-438913f5c63mr219797095e9.18.1737562501952; 
 Wed, 22 Jan 2025 08:15:01 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b1718741sm20115825e9.0.2025.01.22.08.15.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 08:15:01 -0800 (PST)
Message-ID: <ce6bd1f3-8d7c-4b3c-af07-b8c9e0912f51@ursulin.net>
Date: Wed, 22 Jan 2025 16:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122165104.536c4143@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250122165104.536c4143@collabora.com>
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


On 22/01/2025 15:51, Boris Brezillon wrote:
> On Wed, 22 Jan 2025 15:08:20 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
> 
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group *group,
>>   		   const struct drm_panthor_queue_create *args)
>>   {
>>   	struct drm_gpu_scheduler *drm_sched;
>> +	struct drm_sched_init_params sched_params;
> 
> nit: Could we use a struct initializer instead of a
> memset(0)+field-assignment?
> 
> 	struct drm_sched_init_params sched_params = {
> 		.ops = &panthor_queue_sched_ops,
> 		.submit_wq = group->ptdev->scheduler->wq,
> 		.num_rqs = 1,
> 		.credit_limit = args->ringbuf_size / sizeof(u64),
> 		.hang_limit = 0,
> 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> 		.timeout_wq = group->ptdev->reset.wq,
> 		.name = "panthor-queue",
> 		.dev = group->ptdev->base.dev,
>          };

+1 on this as a general approach for the whole series. And I'd drop the 
explicit zeros and NULLs. Memsets could then go too.

Regards,

Tvrtko

> 
> The same comment applies the panfrost changes BTW.
> 
>>   	struct panthor_queue *queue;
>>   	int ret;
>>   
>> @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group *group,
>>   	if (!queue)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +	memset(&sched_params, 0, sizeof(struct drm_sched_init_params));
>> +
>>   	queue->fence_ctx.id = dma_fence_context_alloc(1);
>>   	spin_lock_init(&queue->fence_ctx.lock);
>>   	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
>> @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group *group,
>>   	if (ret)
>>   		goto err_free_queue;
>>   
>> +	sched_params.ops = &panthor_queue_sched_ops;
>> +	sched_params.submit_wq = group->ptdev->scheduler->wq;
>> +	sched_params.num_rqs = 1;
>>   	/*
>> -	 * Credit limit argument tells us the total number of instructions
>> +	 * The credit limit argument tells us the total number of instructions
>>   	 * across all CS slots in the ringbuffer, with some jobs requiring
>>   	 * twice as many as others, depending on their profiling status.
>>   	 */
>> -	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>> -			     group->ptdev->scheduler->wq, 1,
>> -			     args->ringbuf_size / sizeof(u64),
>> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>> -			     group->ptdev->reset.wq,
>> -			     NULL, "panthor-queue", group->ptdev->base.dev);
>> +	sched_params.credit_limit = args->ringbuf_size / sizeof(u64);
>> +	sched_params.hang_limit = 0;
>> +	sched_params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
>> +	sched_params.timeout_wq = group->ptdev->reset.wq;
>> +	sched_params.score = NULL;
>> +	sched_params.name = "panthor-queue";
>> +	sched_params.dev = group->ptdev->base.dev;
>> +
>> +	ret = drm_sched_init(&queue->scheduler, &sched_params);
>>   	if (ret)
>>   		goto err_free_queue;
