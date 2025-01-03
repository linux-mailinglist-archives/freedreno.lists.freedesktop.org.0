Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB15A009BB
	for <lists+freedreno@lfdr.de>; Fri,  3 Jan 2025 14:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7010E8AA;
	Fri,  3 Jan 2025 13:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JNJmbuMa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E963310E8AA
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jan 2025 13:07:07 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so138603825e9.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jan 2025 05:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735909566; x=1736514366; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YZpHTfSit5gO2Gh5m2JOOcpLY4DaYFIg1vpxWhNZbDk=;
 b=JNJmbuMaTdfwoY0y52IyudAu8u79dy6jmAlC02yHMWiD4WMSNe4+utiohA/42Iw1mI
 BW1akj/4Yszu1cVBFsCD4MVsuuuvNlg6ddsRFj1/YMi+plQlAwlXmpem+ZAGSywlUKvW
 6upS4GBppPPEF0GSfcrVQM8dg/SwO3A1hHO5PHsdOC92s2wX0s0fgncshU2rjMflP5C3
 JWfWkPQzaXxOG1bGyS5N9wvdFA0VRUcmU0QbAfjvEv3JJHfCWR6ME5/6Hs22Q+yPgR0C
 xFp52ob2kbo39G7lDIZa2bzYIMesQD2PZh8pq7w7r0zH7EbLBOXlPbJhSwWhTbb23lWL
 KelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735909566; x=1736514366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZpHTfSit5gO2Gh5m2JOOcpLY4DaYFIg1vpxWhNZbDk=;
 b=V6Q3u7SYSCZA+QAljQClBCjJsgUfRrxbvGicnE5F4vGT4+fiqBFVqrkXr0Fq0YtsHN
 8z80ondkdgQmcBGXKzSmSK+Zu8rPiQypYBbv630TVx9RJt+RADR6O4x6abtRd+2Hw7MD
 jYX3L3AmUT07Y2BFzt3+PDZ+wcv/eYKFj9B5BjwMTqJ1DFFdM68XcEv5DxGs56SVO0yl
 QTuaz1SPj+KEujOJQlr/XTbTQ37ZtTv+Jv8Liu7yANecTfcviVicy/xBO/AKxFjxCTQU
 L+OnL+ZHRD4JfXwRiN+aN/2bKkEZaeJck2BO+3FIS6iVcrzrhkcVXV+NR4WyGLqbmER8
 2IDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJs43joeTOtaSA0YS1qBfKNuXzWbV7vzRl03PLN2fjPlKl81w/+GSmjSG/kIPi2AYVdbIAij8rysM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNh6UlDZTaOCi6kC2+Be/r4hxCsglGvJ+4y60/5SOT/nGwLG96
 FUnVtnJgOIcriv2B2qAEW/5+kGxM4x2eoAKrM2UAjV3fpO9cVPHCdZ87f5tg3YIV2ySdFKXq/bd
 W
X-Gm-Gg: ASbGnctH+NN4Q1JVjEtG2ZoKjdHiAMh9EmNFG9oyohy0nSm2JkhDtAYbH2Q2CXIir0J
 nWQtm1cyqE3Get0X1q0Ejt9cGtlytOH/XufOSdmr8gvrOwLLh5t74XpF4NLgcrmeU7vNoSfEoLE
 SWBYDm9jLHvrK9nq4LTWDFjRYiizfveu5isCYeNabgxvN6QUTAiMMbTsT3sWF+VjAk7d009pIuK
 zQz3tf9L30KrSw73nv4uTMVx8m/R1gFbIF3qF+AUCMxnBgExEGBzsz5
X-Google-Smtp-Source: AGHT+IHzzw0z0olhiMQIF4i+m6RWPCwn/5pzBtPbIPQehiZzeOw1sBpO5b4V2d1MU84ARWYaRT4n1A==
X-Received: by 2002:a5d:5f4f:0:b0:386:3329:6a04 with SMTP id
 ffacd0b85a97d-38a223f5b4cmr45535380f8f.39.1735909133357; 
 Fri, 03 Jan 2025 04:58:53 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:17 +0200
Subject: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=t7uWQZmvlqArOJmOhip0vxH0p5Ao0CcrYSITs3tqLBs=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98CWJIRcWNajaQUs0XtEmjBpJ6OADba5w2NK
 CosooeKSVCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAgAKCRAbX0TJAJUV
 VqLKEACTE5rtDEB+D33MFt/oZ45AqV9b3HvDi4rXOsndYQGSTU63k5aEsmdo6JZy3Qg0D+xuuCR
 No9K5tdKFT0oiyRF4TvWaH/9wNmSFsIcgwcyng+spkYd4QZ+7E7kkMTW7RLXwmixcX+PjnAbhRu
 uyWVArrU3Q9yFK5JJb7zh3DEq5YqSBXK9iE1Kjls0cIR7CkmSer/AmxrISk43jNNHajVr0a+EIT
 cblU0Z4x3n9TlXxwCsowpn45Wl3PaemuzNzmKo9SEbGorOnfB0wYxTX78pIr1D4M1/OXG+FjxuB
 WyNd75KSJMQMigAKoKTA4DOLYtL1XB/Bbt6byj01kMwbXeg1rApXR5lgIAzx9GfiI7LmkdDZGL1
 RlDFiT3f/uMfw7tzUohgIsQIodhlCuZ2eFXrHtb9u8XapXiH+knM5qqObAd4U6ePoM6Zj6MEFK6
 4W0Xtc4G8RFAkDZWJk05I3mbnXUL/2Qdik+U2Phyz/k9eltZvpFm5eQgTDYI+nqEMlJmH5LGsi0
 4DJ3EKsEUGwFVDi93iwvKHYq6dP9nkU47NbWjRe6jY8BHgLi6HQuyAC3trQELmnGY35TFpNbjL6
 Q9GYYK4NNMqjIZ86oG/ibnG2NjtBKCdOhR7bzrw03Cii+gZK9vG/vaQujwKNdO+h9bjcuGNNAU0
 AMan2WsFQIdj0uQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner.

Acked-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
 			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
-		return false;
-
 	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
 				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
 
@@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
 static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	int lttpr_count;
+	int ret;
 
 	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
 		return 0;
@@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		return lttpr_count;
 	}
 
-	/*
-	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
-	 * non-transparent mode and the disable->enable non-transparent mode
-	 * sequence.
-	 */
-	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
-
-	/*
-	 * In case of unsupported number of LTTPRs or failing to switch to
-	 * non-transparent mode fall-back to transparent link training mode,
-	 * still taking into account any LTTPR common lane- rate/count limits.
-	 */
-	if (lttpr_count < 0)
-		goto out_reset_lttpr_count;
-
-	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
+	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
+	if (ret) {
 		lt_dbg(intel_dp, DP_PHY_DPRX,
 		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
 
@@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		goto out_reset_lttpr_count;
 	}
 
+	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
+
 	return lttpr_count;
 
 out_reset_lttpr_count:

-- 
2.34.1

