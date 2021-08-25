Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACBF3F7EFF
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 01:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6E46E440;
	Wed, 25 Aug 2021 23:27:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9DA6E43F;
 Wed, 25 Aug 2021 23:27:17 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 18so997605pfh.9;
 Wed, 25 Aug 2021 16:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
 b=n5XyjCzweV2ACwjq4EtbPx015mZCNAy8xfe1YXs2ga4Wt3K0FnHiYTwOdsdXvSF7jw
 LnhNWfjBZftiFTrOv8YI8efhiWKEMakKts8jK6RVR86lq+xqcSHfXfrsKUvxeZPMgW7E
 5TupfinS/XDiJXkyxtGb10Cd1EEdbzz9bZF9ITmA90ToYK8h55C72wk8V//sgzAfWXBk
 CqStnhXxSGnq5c//fHULpwnZ9vrb3kkfKcqqVAre+605sDqwAsEeZVRit5EQZtLBI0RA
 N5tx0amo6xVHaJKrbnLD5lMQVaKmy3zn7+qtqiDjt8PJB+otSPybJgBSQ8FLKPHFydly
 QFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZO3zKGF+0NhPfL8Qd0KyZNcW2ZWya+gJqC9s4ZSXqFs=;
 b=cpJme45Im/L4W9ZOwECAhp+NDNKBHmjCj5CEwOP7F8qs1XluaSYpqLbR9ggwhMUnT7
 ZUuZCBv4WdRdDjgdCdpNubq7KuX+VO3Rj3QOhmwymWKr/CoxORFspV/4gdAwcI9YW7OX
 Uvc0QFc3tRBk4Ts0LhAULUTOwFEeb9ZTTkMxseuL3a354TDbtm2fJN9E0dvVKqk6BNau
 sHodE9E9SMhZGRrD7L6bI6GQUXVuz4FwKwji8SSt6UZrJ8En/5hFxIs6PuGdgkPTTugt
 2EcV95ubD3SVWMbOd8uAfLGuiKQptACrvbvfP7igLKE9kJG5KynicYGxU8C54E+acwQ4
 4Miw==
X-Gm-Message-State: AOAM533tnDRptJcT3Uvegh3+opMfB2CHDpPs5HE5hbiWVzfO5V7vGTt1
 /Bo+Q0RrEwXSq4diX21BMUpSsecphVo=
X-Google-Smtp-Source: ABdhPJzmn+NtvDuwd97wCe7RQGzCC1iXMT6d/KGy4QzNZfoRvB30cOxpfiSSPU+oZ/1amWPQSxrJMQ==
X-Received: by 2002:a05:6a00:1311:b029:3b2:87fe:a598 with SMTP id
 j17-20020a056a001311b02903b287fea598mr655696pfu.74.1629934036299; 
 Wed, 25 Aug 2021 16:27:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id j16sm705152pfc.70.2021.08.25.16.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:27:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
Date: Wed, 25 Aug 2021 16:31:37 -0700
Message-Id: <20210825233139.1066504-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825233139.1066504-1-robdclark@gmail.com>
References: <20210825233139.1066504-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v2 1/3] drmtest: Add DRIVER_MSM support
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

