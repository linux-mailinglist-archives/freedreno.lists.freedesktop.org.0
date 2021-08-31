Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2EB3FCB44
	for <lists+freedreno@lfdr.de>; Tue, 31 Aug 2021 18:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC076E0EC;
	Tue, 31 Aug 2021 16:12:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CD76E0EC;
 Tue, 31 Aug 2021 16:12:51 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id fz10so12200168pjb.0;
 Tue, 31 Aug 2021 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
 b=OOjQD7PcaDHf9UqHMUXZOqvvQUGIPQRaLs3BA8ro+eCzT5qcQF4w+fnt9LRl8ccedp
 4Dx6UUTBdQaTzpoZpcNCXp6v+1Gfo1Ao5EGEHNuIO4xqiFzSgWuteSmJIH1ZAu3Iwzy9
 LV3pf93r2TtAQdJyRNzsLefPU43hIGGoffl4ejQsjQR7Li8I0Nq+PX8NbDsMH2HbY4Vw
 Bg22w2rum1KXFoojqSWHhEW1XrIuMtUDgMAjuN0HWQkd7qzyW6IX+hOSWQb5R/gQ6n5i
 lT+OQ30Er1Cr1KewCuA08VWXh/1Jk/KlOFVrZPjvFB/hFWx9ztUjOfP0f7nIlYEI5qxL
 k3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IzUUD53TRCina4FvQp5wgcW+VoUOyAwWBEy3HV4by8c=;
 b=Z1ny/Ksi7XhNEr7qRpY1VO9tGn6pVkoSnsvNgU0AXJ0YWQ1UehXRjsgbNnoLezDniD
 DZWOdwqx+lLYOqBknp/iGiBlXHXF+Iru9zJXabqUSLTKTeyH02bOkVnpw6px8aWDxrhR
 rtXiq8G8tNRMZ1p2IsRt/8YNJ6577/YPrBzMueU4mzSgJ74lF5mFT7fdH2PmP5KRhZZA
 B8dIxvLvPc2dD4Ok4rdaZaMvS9SgZSTsHNIRYB/VyN49Tet7Exmeqh8jwKohGdblQ7O1
 BOku8RiMf8Kys03JWy8IdcS8YYEi68KUVLjqseeZqRS025D8SSdrwriqheQlANTcnuWe
 hsTw==
X-Gm-Message-State: AOAM530gm0B+WmpQxnb/PjjUXDEnZUHTBh+wHKqpOUnCLuxyE5bZ34C/
 MB7db3ckK2Dglrb0zjEuhTpXc5u2dUw=
X-Google-Smtp-Source: ABdhPJzagBDIHTv/jV31+XINjnPPk9hLtJ8OsAkBF08ftXKkvaqBJhCvGvI5pV20pDU+sfVjwGN8Iw==
X-Received: by 2002:a17:90a:8801:: with SMTP id
 s1mr6291123pjn.166.1630426370486; 
 Tue, 31 Aug 2021 09:12:50 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 a21sm3515990pjo.14.2021.08.31.09.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 09:12:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
Date: Tue, 31 Aug 2021 09:17:14 -0700
Message-Id: <20210831161716.1400057-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831161716.1400057-1-robdclark@gmail.com>
References: <20210831161716.1400057-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH igt v4 1/3] drmtest: Add DRIVER_MSM support
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

