Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA43FB9FF
	for <lists+freedreno@lfdr.de>; Mon, 30 Aug 2021 18:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D4E89C99;
	Mon, 30 Aug 2021 16:18:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D829689C80;
 Mon, 30 Aug 2021 16:18:09 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id d5so4062070pjx.2;
 Mon, 30 Aug 2021 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
 b=MTpoUR2UzOgE1ufJQlJin/dJTVj/Mh5JuHlYs6fY85kV9qpTnCxrGLjI3Big/N6k79
 VjN3CR6HychhR+Pkc7NKMY/O1hoL2jJe6x9PeKzZqIdN/jcr9mDyGY+VR4gB7sTrdGBW
 nyZD3Xo63c0FAODS38BRvv5koF7ZOiQ9pe4ZFr97I0LFDR/SEIgaZL8pH5X4H380J6mN
 CGZYdD4JBmcBAIGNUE5SUK/64RTLwMLZXbExvU1L3P9KbMxYhWj+65vZ3ytAClYxyp3u
 ks+SdNpv0tEzZlXKjsTBa7v/AqtfDcRelAhEYJ8/6at0/vQ4WMo9O87oc74YntNgZo1p
 XE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
 b=dRw1Wc+mwsjQnLAgk6cfmmpwMnUQlE2Rn1VwY690sw0CNbv3Wbe0UoFeOjzMI5t425
 trhwWzwd7UAz+UV7b+3knxOI/XlPtY0Ebr/A0R/V/zBYUgQhni0c3LcpQ6DaXEx46qZ0
 PXlRLSEof1TbUbsFAyeyY3ldMEtN0piBgrLsjqPdUv7Lv2W54VRd/GCOyrEIp0PqK5eQ
 f4LZaIDhJTLO8bjbCGbJDkxlDODvbMtMQy/ZLlHFNiQ7L+dZQ1JfWV3ImCafumJACwfc
 AIrXRaoWpXjqaAplBuu93jDtV3HS8i0IVh+mB2rlyWfu+wlbDuCrG5G/P5FPhV38rrTD
 jaUQ==
X-Gm-Message-State: AOAM532hv6ah0rsQ0AUzV6ZflzHJ4+1OfxmvVvQTZgEziWT/EIcbSf2a
 wGUqNiWEdnASsqMg8ogFwI7AhlDMVFI=
X-Google-Smtp-Source: ABdhPJzN0V8nsuGnodaxmxJDjnSXCAsi7TAHI6LzeETI3H4E/lZ/Ovp6hI0Talsa/XJlAQstxF++Pg==
X-Received: by 2002:a17:90a:64c1:: with SMTP id
 i1mr39754377pjm.111.1630340288903; 
 Mon, 30 Aug 2021 09:18:08 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y67sm15251565pfg.218.2021.08.30.09.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 09:18:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
Date: Mon, 30 Aug 2021 09:22:30 -0700
Message-Id: <20210830162232.1328594-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830162232.1328594-1-robdclark@gmail.com>
References: <20210830162232.1328594-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v3 1/3] drmtest: Add DRIVER_MSM support
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

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Petri Latvala <petri.latvala@intel.com>
---
 lib/drmtest.c | 3 +++
 lib/drmtest.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index e1f9b115..29cb3f4c 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -179,6 +179,7 @@ static const struct module {
 } modules[] = {
 	{ DRIVER_AMDGPU, "amdgpu" },
 	{ DRIVER_INTEL, "i915", modprobe_i915 },
+	{ DRIVER_MSM, "msm" },
 	{ DRIVER_PANFROST, "panfrost" },
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
@@ -539,6 +540,8 @@ static const char *chipset_to_str(int chipset)
 		return "amdgpu";
 	case DRIVER_PANFROST:
 		return "panfrost";
+	case DRIVER_MSM:
+		return "msm";
 	case DRIVER_ANY:
 		return "any";
 	default:
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 7d17a0f9..a6eb60c3 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -50,6 +50,7 @@
 #define DRIVER_AMDGPU	(1 << 3)
 #define DRIVER_V3D	(1 << 4)
 #define DRIVER_PANFROST	(1 << 5)
+#define DRIVER_MSM	(1 << 6)
 
 /*
  * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
-- 
2.31.1

