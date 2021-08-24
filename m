Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82E3F6BD9
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 00:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A515C6E0E6;
	Tue, 24 Aug 2021 22:45:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EA26E0E6;
 Tue, 24 Aug 2021 22:45:17 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso2828252pjh.5; 
 Tue, 24 Aug 2021 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
 b=BzNv75Zr8IZ+hw0SmOgWUVI+t/muib2et+OpiUcjIxoO5Ui0Tc1XPwUoO9SIFikroZ
 fd59sugOcPUw8VIIgJyvAVQhFkffYNODQgB60w3tfkLHazc3oZYYhm3PwebDSkDbayJ+
 uld53ZOkTMKbarFjKmjyaByW96qMyEbEsn+FQPocfOzRiQenL6lB1MlNoufsFQtD0b01
 CVCUErC06YYs8T2BH8rxV2+iHjkuZQwwHjg2GXuNPJmHD6bkYhe/zAboVediAZjMCCDW
 eojcfAjng9zBpP+/+Su1xdYN0ExyMRbi3NApLWM239FQZQxgJxU+vHHA+AMUBWSGLaCj
 hixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
 b=VOFdz2YIOXITKB/oUiiZ7BLAjkxn1rHWHD8rueGnr2qf9R9UokfLr6ljThwlkQd1mH
 NkIc7/9KA5/6LbyXC47Tke/Nbx0wlpXJI0dOI20hEeZDDI3zS2YejhTZ5pntdFLmPQOa
 vsEnNjoafjNoQBqSUdpbvk3oqBNvdxW7L899DC7726BBjIUZua+d/1x+dVTySwx4F6ZU
 /cqgTmcl6PNPYqY1W8ohGulUS0ax6Maj71JTrhRRASa2Q2gbZ4/hM8r6muohORsJVtVX
 E0o23BOs5/Hy3Io8FfBJKS57pqPojf5WRRBwA0I9E3yjESZcszVtG+QcZC+LgkJiIVH5
 uayg==
X-Gm-Message-State: AOAM5312Ol6Z+XkV1sHQm38ygWh5NGA65og0fpLXLu3BHF3xghWyh8Fu
 mxTSMr1TccEG+RVi6xSR80h8oZxZnSw=
X-Google-Smtp-Source: ABdhPJzGNTvS5lR8yl9Ds5jQal5mlDin3DlRgDDSCvzupDXRXDIjxs8xLKVsoNBcmmfmCULDA/u2nw==
X-Received: by 2002:a17:902:b20e:b029:12b:fd6f:44c3 with SMTP id
 t14-20020a170902b20eb029012bfd6f44c3mr35011809plr.36.1629845116478; 
 Tue, 24 Aug 2021 15:45:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 o11sm20716569pfd.124.2021.08.24.15.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 15:45:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
Date: Tue, 24 Aug 2021 15:49:30 -0700
Message-Id: <20210824224932.564352-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824224932.564352-1-robdclark@gmail.com>
References: <20210824224932.564352-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt 1/3] drmtest: Add DRIVER_MSM support
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

