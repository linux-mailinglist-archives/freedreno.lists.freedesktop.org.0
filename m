Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F14BEEEA
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 02:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E837410E5AA;
	Tue, 22 Feb 2022 01:30:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CCA10E5A4
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 01:30:55 +0000 (UTC)
Received: from localhost.localdomain (abxh33.neoplus.adsl.tpnet.pl [83.9.1.33])
 by m-r2.th.seeweb.it (Postfix) with ESMTPA id 364443F5D2;
 Tue, 22 Feb 2022 02:23:05 +0100 (CET)
From: Konrad Dybcio <konrad.dybcio@somainline.org>
To: ~postmarketos/upstreaming@lists.sr.ht
Date: Tue, 22 Feb 2022 02:22:48 +0100
Message-Id: <20220222012252.6373-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222012252.6373-1-konrad.dybcio@somainline.org>
References: <20220222012252.6373-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm/adreno: Fix up formatting
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 martin.botka@somainline.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Leading spaces are not something checkpatch likes, and it says so when
they are present. Use tabs consistently to indent function body and
unwrap a 83-char-long line, as 100 is cool nowadays.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 9e3b4ea7f9bc..e1f9d7442114 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -198,7 +198,7 @@ static inline int adreno_is_a420(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a430(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 430;
+	return gpu->revn == 430;
 }
 
 static inline int adreno_is_a506(struct adreno_gpu *gpu)
@@ -238,7 +238,7 @@ static inline int adreno_is_a540(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a618(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 618;
+	return gpu->revn == 618;
 }
 
 static inline int adreno_is_a619(struct adreno_gpu *gpu)
@@ -248,7 +248,7 @@ static inline int adreno_is_a619(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 630;
+	return gpu->revn == 630;
 }
 
 static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
@@ -258,18 +258,18 @@ static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 650;
+	return gpu->revn == 650;
 }
 
 static inline int adreno_is_7c3(struct adreno_gpu *gpu)
 {
 	/* The order of args is important here to handle ANY_ID correctly */
-       return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
+	return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
 }
 
 static inline int adreno_is_a660(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 660;
+	return gpu->revn == 660;
 }
 
 /* check for a615, a616, a618, a619 or any derivatives */
@@ -280,14 +280,13 @@ static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
 {
-       return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
+	return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
 }
 
 /* check for a650, a660, or any derivatives */
 static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 650 || gpu->revn == 620 ||
-	       adreno_is_a660_family(gpu);
+	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
 }
 
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
-- 
2.35.1

