Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85203A30F17
	for <lists+freedreno@lfdr.de>; Tue, 11 Feb 2025 16:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA9810E6DF;
	Tue, 11 Feb 2025 15:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LdP39Oew";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A82410E6DF
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739286224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=LdP39OewQX2dbcrl5y6LkJewV3/aajN0QNL1OtF5nIi0KqOfFW9ma/3u+hsJJ7P/EuRFnL
 egV4wkCn1bA2Rhf/pWjn4WbHGyd+EXFGIT4V7lRJxS8xAvRucL2uH+FQ+luKFnQfy6bPBD
 7XxougeBtDEuHtMBurcbrE8HdqyGpvQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-xPHaeZX1NgCTGKtpmZQS1w-1; Tue, 11 Feb 2025 10:03:42 -0500
X-MC-Unique: xPHaeZX1NgCTGKtpmZQS1w-1
X-Mimecast-MFC-AGG-ID: xPHaeZX1NgCTGKtpmZQS1w
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43935bcec74so16084965e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 07:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739286220; x=1739891020;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=ccAsFPrVJlv0Cvy6QuPymKd2btGWmNf7YC444A9/lNZ2NBHxRyWjIjYIrrz//OhavP
 30lO0Haz4Q+rYhMTlYn7SN/ObUW2Uv7XWDdmL1JjzX1DB6Yuhb69JriKClQjIW4ib0F1
 SyiTmz2hzPseNWxemzB55s9al6AR8aRb0NDAYvGzeYYVnB1GJva/B0FaYd1BfZUXpBwO
 T3Fy0/RhPx9zkaVaJmTc9zki7ZdwTe0Vdi1q3RkesGUpMcKg1BV0jC/PJaywMcsi7oA+
 E7WDQvfacAv1yjdH5adRgJirIAt4DVhI/U/FuxradQHrIn/BGkB9yeqK9LUhnWDIJIVU
 FUNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3gX7ziyrcrRtLGFlqVtJUvyDVgEle1CwPP+foXyF1CKjFL+/ci4hqHVqoa7igHKx8wz4sqWuVUoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcYgzphWa3nBFDKyIo4IfJJEwzqjYBJ6us4y9sjttMORee4hMr
 mWBlnlTI6fagra6eDIb8B/AJ9PCDhlQt9gfhdx5ymEMcbE3C8s1A5Ds08F9/yyYI574w3qYlRSN
 xVJ36xQhXYLI6rFQVls9ZEK/OK/YL849XDh+k/8VIktLs8+T7gekyHd1uRM2ORp5Yzw==
X-Gm-Gg: ASbGnculm1LuixBBWVRz1pR9/0HIZS3DuBbz376ftwF+ofXfd01NHaNHgjZUjl7z90A
 gG71ehVmYXt0Tcdm8ulw+0PZld/YWaxoZanpQ+oA2ztWYOhA00TSy1Xq0Gl1ZKRdsIyeLK+oAz2
 gldPWXExhM9Z+SvvLeljQmesV+a41qBbd1JzD3b1muuwdexL9GSe6LvoiFi5w/ba8PSXPnENvL7
 dLWhtGkYLpGN4el7hoI7j1wnw+PIj7QpbBrWxFZJ3+SkUHPPRUaGJhjfGS8tZaJ2wjujQ==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42857975e9.29.1739286220064; 
 Tue, 11 Feb 2025 07:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN7+RaFI8Q1DlET/AqPOd5Q7ETC0Cm6eLK5eh5/vnngjAmjHCWD7Z20lqQzfUQw3dEBz+m0g==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42856745e9.29.1739286219388; 
 Tue, 11 Feb 2025 07:03:39 -0800 (PST)
Received: from pollux ([2a00:79c0:65c:c300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5c8c37esm13267156f8f.2.2025.02.11.07.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 07:03:38 -0800 (PST)
Date: Tue, 11 Feb 2025 16:03:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Christian Gmeiner <cgmeiner@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z6tmyHpqnpkP2gKq@pollux>
References: <20250211111422.21235-2-phasta@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RqBM3jfmjlVRtW5spljCeG2Rbtn3Bc--EcXlu5RyU5A_1739286220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

On Tue, Feb 11, 2025 at 12:14:23PM +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Maíra Canal <mcanal@igalia.com> # for v3d

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

