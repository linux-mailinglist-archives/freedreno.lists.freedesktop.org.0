Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065A36DCD8B
	for <lists+freedreno@lfdr.de>; Tue, 11 Apr 2023 00:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0BE10E438;
	Mon, 10 Apr 2023 22:38:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72B610E433
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 22:38:40 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t14so7998956lft.7
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 15:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681166317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BI3Vr7KkEkwMoV79FDgIFTD4Bqv93i7w+4l4vFTRfu8=;
 b=UmYSFCW8ZfdbEsYx+S5ct4ZCRWOWe0IX7QxChxHFPbZUVi6hZApfDpI1GTPh2DayBo
 dkgcEGN8P4KzksT9SUIsb0f47HRprT808vOvtMQAWq6zGKtBlN4e7E92DWFLT0uZk82p
 ioxYr286SjOILES0BN4hlWElrbFfOuZ04DNkZyHQGuNiNmPaMp1ykoyZpz3s2aPQ30Jg
 LONOOxtfc0XC+mK+9cH6FvzQAjpI0i1SNASs6mFpgAUHoCJ8KCfRYkyX+hpD/HyOiZJs
 7WKexdxtUEjkrXShK0tzKW6e/VZ1xuaCKimmguWRxkzD2/Zl9IE53vR8zX6kvBErT3vM
 QmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681166317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BI3Vr7KkEkwMoV79FDgIFTD4Bqv93i7w+4l4vFTRfu8=;
 b=x2lY/FB4Na+ScELiV2R7G4o1/GlDLqLvFZ2i2aRPwhFKZh+QGLR/I7cmfIiC1Nxeyg
 /VEMB4Zcdk8k85gn385DFDmgcsI8FGGkbIiF+/C+PVLTz48vNbuzIPvu4DYAreRi7Wgm
 hxVUdFX573oPVsEL5C/tHjRYRF4agJStOUvb0ZghOZ271B0podP40XWnXTAiF+Egw2f7
 BQz4DIo02Spx1HmWsaUSy2ko5BiKCYeJhqHNVHlUj9igOF4VoM33olsp3lBk2os7yFZc
 VLcm62MlVp3Eiy7T2IojviPcBjjeceZhTPxbK/ZtMbBA29B/q5FuAz8miplpK/JXMXNE
 33Bw==
X-Gm-Message-State: AAQBX9dUWWvZOJs4zhpQk/p9X6xjg4G/fCXv1djj+p3jyLJbV4P4ILXF
 e2qH3h+Br3IqekWXWAnIREMGZQ==
X-Google-Smtp-Source: AKy350aLN4y8H9Y+NvwcZr3Cywc4xyfTF5Bnog/ZnWKSea+DUvvVGBlKCMfHEmu191v7FIeGFT1wUQ==
X-Received: by 2002:a05:6512:488:b0:4ea:f632:4738 with SMTP id
 v8-20020a056512048800b004eaf6324738mr3257068lfq.6.1681166317385; 
 Mon, 10 Apr 2023 15:38:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a056512051600b004eb1158ff0esm2291945lfb.298.2023.04.10.15.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 15:38:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 11 Apr 2023 01:38:36 +0300
Message-Id: <20230410223836.442836-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/adreno: warn if chip revn is verified
 before being set
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
to prevent such bugs from happening again. A separate helper is
necessary so that the warning is displayed really just once instead of
being displayed for each of comparisons.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 63 ++++++++++++++++---------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index f62612a5c70f..47e21d44ac24 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -145,40 +145,51 @@ struct adreno_platform_config {
 
 bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
+static inline bool adreno_cmp_revn(struct adreno_gpu *gpu, uint32_t revn)
+{
+	WARN_ON_ONCE(!gpu->revn);
+
+	return gpu->revn == revn;
+}
+
 static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
 {
+	WARN_ON_ONCE(!gpu->revn);
+
 	return (gpu->revn < 300);
 }
 
 static inline bool adreno_is_a20x(struct adreno_gpu *gpu)
 {
+	WARN_ON_ONCE(!gpu->revn);
+
 	return (gpu->revn < 210);
 }
 
 static inline bool adreno_is_a225(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 225;
+	return adreno_cmp_revn(gpu, 225);
 }
 
 static inline bool adreno_is_a305(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 305;
+	return adreno_cmp_revn(gpu, 305);
 }
 
 static inline bool adreno_is_a306(struct adreno_gpu *gpu)
 {
 	/* yes, 307, because a305c is 306 */
-	return gpu->revn == 307;
+	return adreno_cmp_revn(gpu, 307);
 }
 
 static inline bool adreno_is_a320(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 320;
+	return adreno_cmp_revn(gpu, 320);
 }
 
 static inline bool adreno_is_a330(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 330;
+	return adreno_cmp_revn(gpu, 330);
 }
 
 static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
@@ -188,77 +199,78 @@ static inline bool adreno_is_a330v2(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a405(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 405;
+	return adreno_cmp_revn(gpu, 405);
 }
 
 static inline int adreno_is_a420(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 420;
+	return adreno_cmp_revn(gpu, 420);
 }
 
 static inline int adreno_is_a430(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 430;
+	return adreno_cmp_revn(gpu, 430);
 }
 
 static inline int adreno_is_a506(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 506;
+	return adreno_cmp_revn(gpu, 506);
 }
 
 static inline int adreno_is_a508(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 508;
+	return adreno_cmp_revn(gpu, 508);
 }
 
 static inline int adreno_is_a509(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 509;
+	return adreno_cmp_revn(gpu, 509);
 }
 
 static inline int adreno_is_a510(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 510;
+	return adreno_cmp_revn(gpu, 510);
 }
 
 static inline int adreno_is_a512(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 512;
+	return adreno_cmp_revn(gpu, 512);
 }
 
 static inline int adreno_is_a530(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 530;
+	return adreno_cmp_revn(gpu, 530);
 }
 
 static inline int adreno_is_a540(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 540;
+	return adreno_cmp_revn(gpu, 540);
 }
 
 static inline int adreno_is_a618(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 618;
+	return adreno_cmp_revn(gpu, 618);
 }
 
 static inline int adreno_is_a619(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 619;
+	return adreno_cmp_revn(gpu, 619);
 }
 
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 630;
+	return adreno_cmp_revn(gpu, 630);
 }
 
 static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
 {
-	return (gpu->revn == 640) || (gpu->revn == 680);
+	return adreno_cmp_revn(gpu, 640) ||
+		adreno_cmp_revn(gpu, 680);
 }
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 650;
+	return adreno_cmp_revn(gpu, 650);
 }
 
 static inline int adreno_is_7c3(struct adreno_gpu *gpu)
@@ -269,13 +281,16 @@ static inline int adreno_is_7c3(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a660(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 660;
+	return adreno_cmp_revn(gpu, 660);
 }
 
 /* check for a615, a616, a618, a619 or any derivatives */
 static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 615 || gpu->revn == 616 || gpu->revn == 618 || gpu->revn == 619;
+	return adreno_cmp_revn(gpu, 615) ||
+		adreno_cmp_revn(gpu, 616) ||
+		adreno_cmp_revn(gpu, 618) ||
+		adreno_cmp_revn(gpu, 619);
 }
 
 static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
@@ -286,7 +301,9 @@ static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
 /* check for a650, a660, or any derivatives */
 static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
+	return adreno_cmp_revn(gpu, 650) ||
+		adreno_cmp_revn(gpu, 620) ||
+		adreno_is_a660_family(gpu);
 }
 
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
-- 
2.30.2

