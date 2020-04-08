Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0D1A294A
	for <lists+freedreno@lfdr.de>; Wed,  8 Apr 2020 21:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279676EABF;
	Wed,  8 Apr 2020 19:20:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Wed, 08 Apr 2020 19:20:25 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 879FB6EABF
 for <freedreno@lists.freedesktop.org>; Wed,  8 Apr 2020 19:20:25 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MG9Xu-1jW9e42yUO-00GXX9; Wed, 08 Apr 2020 21:15:00 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>
Date: Wed,  8 Apr 2020 21:14:22 +0200
Message-Id: <20200408191458.1260397-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fdpx1d/DLJfitrFpYrv8Gkkt6VAi33wDZasxO8tqJ48cXnNukcc
 VB/q8aFUWkBATecQB02IKtYojv/7l+Y0/mI+xOkGkohuj0ZY4xA6z2cp4m13/z+BJ0uyHvn
 yA6d6TySZK/ah969Kwpn8hB3N5sX/O/4aiSFnMFZXs2FeFCV0pXCA3Gg2HWS8es86yMdTJp
 UwUjR8Rc/Y7boiWmcahiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qfMbjEOsqiA=:eH48gEWoJ/cN0yJ4E60/A+
 bZ+5H2Esp41EI5xmiDa62cBmhm1MIn5oJvZlRvkQ8wmrxaW3guC1jTZF1ZOIMw6c0yTdeM8m9
 dFG4kfvv0mgqkuJvlFCIwmNdGI58PCG24wg+17f+Gte9DUbxCHkQxv5xReMJRRsT5+vwhw4cO
 JIZ43kW/za3oJj6wl1+B6jA7FDRH4CncsC79W7d2ucsZ7l+S8Gf4bVTTvctl+8zRtxhvezktV
 W4QpueRjVGRKBE/jRFQtZ8rIH+Gswu70wWvdKz5Haq+Fp8lhjsdt7EHcEhQo02q6Xc/k7F3vn
 Y28BaO8c7YYh+3lJkgOwis+31WCPy/PoDyZBaKnJ2qciDCoAjaXEtKNYbtBDw6MrxlrT0M4wW
 mUAvHaZ6ruuJZ1lsNBoJdWu/qndVM0MPrah+k62BNrkioGlyAcWqqyNeCpPlWIX4PDauhaiSP
 sphPze+joTn+PUCJfgHe0iJ3IVS02HDl7Z5zVJPE77aqW9OlR2f5FWH4XiGLeK2IfxzlfA8fB
 6pJfDq72w8kPxi/hVkdLb17ncyL1trSSlGI52HYHnerWfH4MCV/6qHAUy5R3afO3TrRQwKlbL
 zDYgSSlgyInW3bSgIbMPsDfog/N8dj3tuKrAADBe64+LfwxenV66AV21mUxINRANpKTzeIHH2
 g05WrO4o13OsmXXLI1RIHMN0uZ0j2CnjTKTrqANOv9DfVgbK724qePyv45N5MKgQqXsmTvOm8
 fnDTkOsTgjJ0Zopz8W0UC8dJ2GgSqGS1Q8oShL1jzBmoRCZIU5d6W+b5NUSR5+wIFDAktqdHv
 F7Q1a+1btD/f4xNPkwvusn/oqVV7w/SWCpDPO4ePlRXSFX+xQQ=
Subject: [Freedreno] [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
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
Cc: Rob Clark <robdclark@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I ran into a randconfig link error with debugfs disabled:

arm-linux-gnueabi-ld:
drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'

Change the helper to only look at this variable if debugfs is present.

Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/msm_gem.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 30584eaf8cc8..eb4aeaf291ea 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -167,7 +167,10 @@ static inline bool
 should_dump(struct msm_gem_submit *submit, int idx)
 {
 	extern bool rd_full;
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+	if (IS_ENABLED(CONFIG_DEBUG_FS) && rd_full)
+		return true;
+
+	return submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP;
 }
 
 #endif /* __MSM_GEM_H__ */
-- 
2.26.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
