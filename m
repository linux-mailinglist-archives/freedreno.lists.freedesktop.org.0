Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D869A1A249
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2025 11:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52510E7CC;
	Thu, 23 Jan 2025 10:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="BtDsr5SE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DC310E7CD
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 10:57:49 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3862d6d5765so378367f8f.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1737629867; x=1738234667;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=30gtLyVebZdKEobBArrAkfadsgu2rmW9GlB2Mmp+Z3o=;
 b=BtDsr5SEpeDZjkPYDkyoEgLa9n5lUQyFAryzqHvJ6fhIa794hnpzI7qUpZeoiZJ1lK
 RJX3wWqqo3wkySirMwGko08PIpiC8xzv3+lZx98tEhVq3rItviT9/BV+v7oyRp6jN2CD
 B0ht55DdyR+0ABawOEivNzaT5/BFBoQRGD/LX1onZ+BBiKH+P77TpNOfYFnRUcWYp/iE
 Y7ZbWHrIz8Jr7sUvbfh9U3vf237HrlZJucfRUmhO+vdk8DsK43ks13cDcQBmS39zxFiw
 w3AV1Hc6yqwKI6uofmCSToObRoBfHe0NXtC84aGP/CPN1TLI6oTzF9E3KkZRMnJxetdf
 iomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737629867; x=1738234667;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=30gtLyVebZdKEobBArrAkfadsgu2rmW9GlB2Mmp+Z3o=;
 b=L9J7Ep5okIIFCfH349UWmlJ2CS2aMc2h2s1wTuAy0lo7nMrfaxjGYMFObJ2BFK84xM
 QcwxGhM7enrvjQB76kACAinErDwBz+eZ07caHBDE4ovpddduMEOnYcA/Te0qCtyC7dDg
 DBWE6oaMe3A5JBnShtUZMNiG9p85RPk158PibS3fTo/GK37Mu6TUhV7kfSNddrLSLsTZ
 /BNs8m2HmeGNXiP3BMTVVb5+hmgle/d7IFJIsXO+MHRyqiq3buzMVEEMl5+pSdDSwaZ4
 Q0xEVQnySZ00NSh39DKpjEBS0Y4Ua5JFw9qchSfdcpyFBt7RFEPZTFkdraVn2xeUG3ze
 5WnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKHNxbpOrRBNzDvBdBhZLF6jqLXeB/mnh6UZ0feAKuxcWBT73B8P+1QeFKDSimcof5WiIDe5qEC+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhcxUZBt6wJOXWqupBmeny2dhVWamcNvrbcbsGpq97zEG3vCud
 MBmjI3sOrTAqTyg7mbRlf6GeYQgF4ulyiqnqBu3LksKGitpL6wSM8TL8ne1ynKE=
X-Gm-Gg: ASbGncsP83Skya/6lx+UOBATfzli0ksR/J2RNsKlN+NZj/v60Y99XhrQ5UDbB/AYkAx
 /nWnM6LD+DknErzQRoM5LxOon1Qvk+xpSn/s+VPS5L/FRdwG9yhgrtY0uJjPn7fTaMmrQqe6bBw
 WmvRbyEdhSE45Avaa2puO6cb1Au34WN0S+4Yhdd7poW58VwJIFAqvnf/F6ZS7lNFfHkDuq4gl1C
 PL9APSxoZdg3g65x1K73eVp1zdIKlt/6bzMzG/hMqA2DE31gybh2xdr3SZHjivs0CVP/TdaQH9G
 QtAPwHBOaLwcNowUXecn
X-Google-Smtp-Source: AGHT+IHpKgpQDCjK1YcskusgjOOfedvKDgMRGq/HKiTsnZfb2gV/B/uu8mCCB+Emo5ibqoWzbXfktQ==
X-Received: by 2002:a5d:6d06:0:b0:38a:864e:29b1 with SMTP id
 ffacd0b85a97d-38bf59e22d2mr26981832f8f.41.1737629867331; 
 Thu, 23 Jan 2025 02:57:47 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322acdcsm19245193f8f.55.2025.01.23.02.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 02:57:46 -0800 (PST)
Message-ID: <0c46e330-33d1-4121-b073-1bd41d37a58b@ursulin.net>
Date: Thu, 23 Jan 2025 10:57:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
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
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>,
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
 <20250122181227.491b7881@collabora.com>
 <af5aac800f7d2153aa3c315584f70c55378c1b2b.camel@mailbox.org>
 <Z5IL9Ok7f16S9ZoD@pollux.localdomain>
 <4ef6430c01f31659c327f688965800285b8172ac.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <4ef6430c01f31659c327f688965800285b8172ac.camel@mailbox.org>
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


On 23/01/2025 09:35, Philipp Stanner wrote:
> On Thu, 2025-01-23 at 10:29 +0100, Danilo Krummrich wrote:
>> On Thu, Jan 23, 2025 at 08:33:01AM +0100, Philipp Stanner wrote:
>>> On Wed, 2025-01-22 at 18:16 +0100, Boris Brezillon wrote:
>>>> On Wed, 22 Jan 2025 15:08:20 +0100
>>>> Philipp Stanner <phasta@kernel.org> wrote:
>>>>
>>>>>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>> -    const struct drm_sched_backend_ops *ops,
>>>>> -    struct workqueue_struct *submit_wq,
>>>>> -    u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
>>>>> -    long timeout, struct workqueue_struct *timeout_wq,
>>>>> -    atomic_t *score, const char *name, struct device *dev);
>>>>> + const struct drm_sched_init_params *params);
>>>>
>>>>
>>>> Another nit: indenting is messed up here.
>>>
>>> That was done on purpose.
>>
>> Let's not change this convention, it's used all over the kernel tree,
>> including
>> the GPU scheduler. People are used to read code that is formatted
>> this way, plus
>> the attempt of changing it will make code formatting inconsistent.
> 
> Both the tree and this file are already inconsistent in regards to
> this.
> 
> Anyways, what is your proposed solution to ridiculous nonsense like
> this?
> 
> https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/gpu/drm/scheduler/sched_main.c#L1296

Apologies for budging in. Sometimes breaking 80 cols is unavoidable, or 
perhaps something like the below would be a bit easier on the eyes? 
Although it still breaks 80 columns, just a bit less.

diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
b/drivers/gpu/drm/scheduler/sched_main.c
index 06b06987129d..3f7e97b240d1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1287,22 +1287,18 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
                 return 0;
         }

-       if (submit_wq) {
-               sched->submit_wq = submit_wq;
-               sched->own_submit_wq = false;
-       } else {
-#ifdef CONFIG_LOCKDEP
-               sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
- 
WQ_MEM_RECLAIM,
- 
&drm_sched_lockdep_map);
-#else
-               sched->submit_wq = alloc_ordered_workqueue(name, 
WQ_MEM_RECLAIM);
-#endif
-               if (!sched->submit_wq)
-                       return -ENOMEM;
+       own_wq = !!submit_wq;
+       if (!submit_wq && IS_ENABLED(CONFIG_LOCKDEP))
+               submit_wq = alloc_ordered_workqueue_lockdep_map(name,
+ 
WQ_MEM_RECLAIM,
+ 
&drm_sched_lockdep_map);
+       else if (!submit_wq)
+               submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
+       if (!submit_wq)
+               return -ENOMEM;

-               sched->own_submit_wq = true;
-       }
+       sched->submit_wq = submit_wq;
+       sched->own_submit_wq = own_wq;

         sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
                                         GFP_KERNEL | __GFP_ZERO);

Could bring it under 80 by renaming drm_sched_lockdep_map to something 
shorter. Which should be fine since it is local to the file.

Regards,

Tvrtko
