Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501BD05F04
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 20:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90610E129;
	Thu,  8 Jan 2026 19:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gvyZrxiu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328A610E0E4
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 19:57:28 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso1814506f8f.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 11:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767902247; x=1768507047; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
 b=gvyZrxiuJP3qXGrCo/ne1YXDWbBJ6oQHPD/PmYxufL9eeAmOm42hAIUyQSY4eaBYpN
 0A+voW3wT2/twxzKogBEyNWnqKV9cK2OE+8dH+KHYK2lTgMkIrqkHBsClWHz4nRfMeEw
 uxQVSLBAwpDc7qR0hNhgFwPZgHhH38L0OaGrmS4F0zRHj5xjHvrt+1xtjTJ7Cadimkl1
 /BN8k5Vng41MK46PYlGjCLYOMqgJ7UC6iwq35Bhiz0gR2SqIF3oKKJIUxoijfVH8YM/g
 Ki9KmUWFo/th0UYsvQwRIwrDrZCKgwdWqDLEVBBb2/AOSIFACOAdGHI++Qn0DO/P2QG7
 Oeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767902247; x=1768507047;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCRWVLE8KYqwVCUSR+leEM1QO2iDsc6SFUmiGPEHzWo=;
 b=cCEwx7sQ2YjcFWNn6sIV4CkJMOmk+IYu21IalkSxvVNaqQ1pHI3D0leWki4IszIc77
 zd8Q0UBEsZ7WOBB8VLF8Q7hjROqfnT6i5C2Usu/sqASYk++/lyLHmqxGvJBwQKlTviva
 SrlWQuUq7iKG7PI5x2HGKPmzimd0PWl2DXdMZuk4bO7W16XCJS0GjwYRaGCQmetkq8Hm
 x2IKaDQ3n0LIJJIkEyB8KlM6Ol7JnB+2Xb1Oy3iJF+qajUvvdn/sga2JdnP7OexcSxlK
 z43q+BNJd07qDAjwCAWcPB+Ra15ZO0b3DRcVpiJo1GWyKEKUEFQ5AmSOQASUpPNH7VG5
 Xwkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwvUWELPIApze64Y+ht7CmMSm/I4k2bmQpk/r99MDy/Z//7Fq2JJyXd5qYJzcIBzQVQkTYLw7/urM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuJctY+Rtp/CqzK8w2AjaASZKc+uh2dpIU8uP5jPS/zIUi7p+8
 kgiXnqYAB24VHRW3z/dSaZp4s8ISZtWQtn/Zep635vl4fWYGOpaWmZeHqc6NKok8ZcU=
X-Gm-Gg: AY/fxX5TubARBXeCgGvvA7i3HZU1EkkxLGcEmLBETfH54UEshvIEYK+9P/rf6+39UIY
 TE4VqfWyUnto19L3H7pqbjXpAFPW0/lzslNhzcnb6hUVqwX1kSIcISrId+7D1qTscHGej/ldOm8
 Qglu8e58LFTMdMH91ZjJxjZvGSdj2sI3OKDyQ/d9ibFki0g8UZAMz3q2cl1E0M4slaldIMhIs86
 +jJ8rk1sA0g4E1MKAvcCP6egGyXxtwiO1aDEtrAjUBu+jFn0BqchwRqsBranj6ebEIKnieVbfCI
 BJAA7mwh4hA7/4paQ2wcKVDTI5ncPN4/jpBNIbZpi3fT7pSgA5TYsP+7ED/tjPodNPRftPBEdgn
 GizHHZbd0M2aZ5pdKJ0jB4r0oJmzOz2pU+FTBtYtPFyUXnOwqqjflxHvWMPqSC4hDB9HHchJOXX
 x6vNtBlYOb8X6S72oj
X-Google-Smtp-Source: AGHT+IFcp3VtHt/q/Alt1immzh6zHpZoD2LnzhIVd+S2uek5Z3OEZpx2nKLWt2bXAXJEShIrU12xOw==
X-Received: by 2002:a05:6000:24c6:b0:430:f742:fbb4 with SMTP id
 ffacd0b85a97d-432c37a4f66mr8711115f8f.43.1767902246566; 
 Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df91fsm18529516f8f.23.2026.01.08.11.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 11:57:26 -0800 (PST)
Date: Thu, 8 Jan 2026 22:57:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: remove some dead code
Message-ID: <aWAMIhZLxUcecbLd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

This is supposed to test for integer overflow but it is wrong and
unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
an integer overflow.  This code saves the SIZE_MAX to a u64 and then
tests if the result is greater than SIZE_MAX which it never will be.
Fortunately, when we try to allocate SIZE_MAX bytes the allocation
will fail.  We even pass __GFP_NOWARN so the allocation fails
harmlessly and quietly.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 8 +-------
 1 file changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 71d5238437eb..7968c2dccff0 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -947,15 +947,9 @@ vm_bind_job_create(struct drm_device *dev, struct drm_file *file,
 		   struct msm_gpu_submitqueue *queue, uint32_t nr_ops)
 {
 	struct msm_vm_bind_job *job;
-	uint64_t sz;
 	int ret;
 
-	sz = struct_size(job, ops, nr_ops);
-
-	if (sz > SIZE_MAX)
-		return ERR_PTR(-ENOMEM);
-
-	job = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN);
+	job = kzalloc(struct_size(job, ops, nr_ops), GFP_KERNEL | __GFP_NOWARN);
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.51.0

