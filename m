Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14B8B2311
	for <lists+freedreno@lfdr.de>; Thu, 25 Apr 2024 15:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9073112010;
	Thu, 25 Apr 2024 13:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+DH0aCY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D7011200C
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 13:44:51 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so11729291fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714052689; x=1714657489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uii1WjicEmGL6f3QVir6hJNE0qnpUgKBh+/oYZXrzo4=;
 b=S+DH0aCYNIxh9H7gFnnfK/3YM+Rfqv2cOeE7gb63TLyPauQFaID8oY5rePjeB87Qwo
 8adk/25qCAa5wjlis8ix/dTM+Zw0iMPueP47ityGQD3vjVcrhP1nYDiffl8VkP96pEjE
 YzZMq3bxIkF4L8hQ81z2hf5QxhvY0tYlj5k2Xy0aZN7nEPDTd1QP7dSWT2S1428OrfkB
 EBha34bOdMa7ICo1f7gLOSy0KolJ6avM9wNABlvlylo3DGHZq6TSkiLwHmJQQmKG96MT
 mO+kty/Ap3HyqwBMbU8veFFcAEWe50UW4lITBArLh9EulDxCacruWtlUkoCf2RGeNICr
 /awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714052689; x=1714657489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uii1WjicEmGL6f3QVir6hJNE0qnpUgKBh+/oYZXrzo4=;
 b=dMQ+rhEx8lClgMM3XNzD+hYnRQNbXXKHKCqO9dTg+j8q+wtBFgRRsbtjspE1a2Lv0C
 prtlvxxCSBZPN3/GNFGsH+yN7zVmPJxZn76Njc8/SUyyMi+Nf3WteQ0losh/XyQ3gJqj
 300EoAIN/eG0KRpm9w0hcwp8zTPmjSTKCB7UsUBaRfKVUrrg8N759gFLAOwf2ZTo5Rvm
 AS1NXErXSYaq/dgomidsC7GvIEBu8AJSyEF1Ii5gfKpngaSIE9xnjW2UdHihghdJMxCE
 PC/TzsntBpwBnbLdjPo9wrjyyifXontpvA/swVIXYaUqhDyzCjTLnImbfomWJf2Aaonn
 1u3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnuc8Tf0yXvpI4BNFjejeMrI7BKkbNdxF0S9i820YgyTF5H8j3xoHwV9OjE6/XyCOfdOfOpmRE0h7uitXPlfywwfeObAe6+o/Gd4oamtal
X-Gm-Message-State: AOJu0YyVKpYHE8tfUGHiwc9f6S283vSwc5KzlV0kIJdIgRRq+KGj/Uvm
 UAPp3/1PPUv+dBEvHoZ0FdKSSNIpRFI+fEz2i7Y5REhsH8sCU7DylDOWx4bW
X-Google-Smtp-Source: AGHT+IE2EmqlnVwTULFEUA4rxZgGPXRdF6Z2BUzbVp53KcX0JmbF/uP2h1SDfiUZB4ZJULkt6nN9hg==
X-Received: by 2002:a2e:b007:0:b0:2d3:2ecf:c26a with SMTP id
 y7-20020a2eb007000000b002d32ecfc26amr3808197ljk.13.1714052689456; 
 Thu, 25 Apr 2024 06:44:49 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 06:44:49 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
Date: Thu, 25 Apr 2024 14:43:53 +0100
Message-Id: <20240425134354.1233862-6-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
MIME-Version: 1.0
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

Expose the value of the software fuse to userspace.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 include/uapi/drm/msm_drm.h              | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 074fb498706f..99ad651857b2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -376,6 +376,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
 		return 0;
+	case MSM_PARAM_RAYTRACING:
+		*value = adreno_gpu->has_ray_tracing;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index d8a6b3472760..3fca72f73861 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -87,6 +87,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 #define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
+#define MSM_PARAM_RAYTRACING 0x11 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.31.1

