Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E69383C367
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 14:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472A010F8CC;
	Thu, 25 Jan 2024 13:13:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9010F8C9
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 13:13:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3387ef9fc62so6063158f8f.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706188341; x=1706793141; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IQ/OiIJEQgcE/+giBYZBBrt/UrqjwIWZyUkL8gVlEDk=;
 b=fFq5vF6IUqWnrArx35bubnc6LHP+ur8PYMJxk9xvIpAWwW7sAgAaIJTD0EWi0529fN
 j//KaJmM5V9XgIk/roqNr/PyazD0aklOfV2ohSQ5RrFmpN4tcg5oHIKsLHI0HX64CEEE
 MU8ITizfEi+1G4DcQGxk3Fet3bV7VFOzx5lqsEJ7bgPRnN29jnxwVL0fKBb901Eosyz+
 0YJYOj/9/DIkVS60gp+PDGTm2f3UYBM7f/BhsCVJ965LObND56E0UoiMyFBPYcSFL6NH
 bEoEAP/Jr9Js8vxg/xFzMdu7dR8BDtubViy0P4jGY7OM+k/xlP7DqWh2d/adrYDsSq31
 EAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706188341; x=1706793141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IQ/OiIJEQgcE/+giBYZBBrt/UrqjwIWZyUkL8gVlEDk=;
 b=BZohNMwlBuCPYgVafy+1qwQ3aB970lWP32i84urZKf31d1jc5Y3v5djp2ES7M8Q9z7
 YXEUikQy4lfRvzuCXJaez74sFynV7zX1gqQGKKiE5Nk98FS2LrNL+EeXu1cgI69xIA8L
 Nhl8lTjUyBPsayhGWz3rUKxRjlQEHhU8y4C0MX1Lwm4E2Pd1XbPX5xTkyj4xdHg27gbr
 cW25H/7XlHzAMjxCZy1Z6Odhis0lns3HCP6r3ak/N4jVJ8nD5LrLku4x8sv9k3xcQ8Ww
 fB+bKuIG5fC6Zm7dMT2qzz1XZehVdQHchtkxJIMI/u0Z7V62r+CWyPYkpOhGTqW68XpP
 Ieag==
X-Gm-Message-State: AOJu0YyfOjpY3i6+cuq4q0/3uR6oAoCRahLBvV79VlXeo+1vKNiOecMR
 18Nm/OSKJeK/40juc+0hC699Xhmb4cM5rht/BcosOZRM6eYI/bbSzfD5PECL1kc=
X-Google-Smtp-Source: AGHT+IGwNS6YLwAFgq+s9JX2+RjXIsM6K5PJQZvxe6LFWoChtGggaZJl8D8u5PdnXREFRCODon6yvw==
X-Received: by 2002:adf:fa84:0:b0:337:aeee:4bae with SMTP id
 h4-20020adffa84000000b00337aeee4baemr486794wrr.47.1706188341560; 
 Thu, 25 Jan 2024 05:12:21 -0800 (PST)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4251000000b00337d84efaf7sm17076114wrr.74.2024.01.25.05.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 05:12:21 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm: Fix page fault client detection on a660 family
 and a7xx
Date: Thu, 25 Jan 2024 13:10:58 +0000
Message-Id: <20240125131058.2084628-6-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240125131058.2084628-1-cwabbott0@gmail.com>
References: <20240125131058.2084628-1-cwabbott0@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 95 ++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c0bc924cd302..ab5b36ae5885 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2043,13 +2043,19 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	static const char *uche_clients[7] = {
 		"VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
 	};
 	u32 val;
 
-	if (mid < 1 || mid > 3)
-		return "UNKNOWN";
+	if (adreno_is_a7xx(adreno_gpu)) {
+		if (mid != 1 && mid != 2 && mid != 3 && mid != 8)
+			return "UNKNOWN";
+	} else {
+		if (mid < 1 || mid > 3)
+			return "UNKNOWN";
+	}
 
 	/*
 	 * The source of the data depends on the mid ID read from FSYNR1.
@@ -2057,26 +2063,95 @@ static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
 	 */
 	val = gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
 
-	/* mid = 3 is most precise and refers to only one block per client */
-	if (mid == 3)
-		return uche_clients[val & 7];
+	if (adreno_is_a7xx(adreno_gpu)) {
+		/* Bit 3 for mid=3 indicates BR or BV */
+		static const char *uche_clients_a7xx[16] = {
+			"BR_VFD", "BR_SP", "BR_VSC", "BR_VPC",
+			"BR_HLSQ", "BR_PC", "BR_LRZ", "BR_TP",
+			"BV_VFD", "BV_SP", "BV_VSC", "BV_VPC",
+			"BV_HLSQ", "BV_PC", "BV_LRZ", "BV_TP",
+		};
+
+		/* LPAC has the same clients as BR and BV, but because it is
+		 * compute-only some of them do not exist and there are holes
+		 * in the array.
+		 */
+		static const char *uche_clients_lpac_a7xx[8] = {
+			"-", "LPAC_SP", "-", "-",
+			"LPAC_HLSQ", "-", "-", "LPAC_TP",
+		};
+
+		val &= GENMASK(6, 0);
+
+		/* mid=3 refers to BR or BV */
+		if (mid == 3) {
+			if (val < ARRAY_SIZE(uche_clients_a7xx))
+				return uche_clients_a7xx[val];
+			else
+				return "UCHE";
+		}
+
+		/* mid=8 refers to LPAC */
+		if (mid == 8) {
+			if (val < ARRAY_SIZE(uche_clients_lpac_a7xx))
+				return uche_clients_lpac_a7xx[val];
+			else
+				return "UCHE_LPAC";
+		}
 
-	/* For mid=2 the source is TP or VFD except when the client id is 0 */
-	if (mid == 2)
-		return ((val & 7) == 0) ? "TP" : "TP|VFD";
+		/* mid=2 is a catchall for everything else in LPAC */
+		if (mid == 2)
+			return "UCHE_LPAC";
+
+		/* mid=1 is a catchall for everything else in BR/BV */
+		return "UCHE";
+	} else if (adreno_is_a660_family(adreno_gpu)) {
+		static const char *uche_clients_a660[8] = {
+			"VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ", "TP",
+		};
 
-	/* For mid=1 just return "UCHE" as a catchall for everything else */
-	return "UCHE";
+		static const char *uche_clients_a660_not[8] = {
+			"not VFD", "not SP", "not VSC", "not VPC",
+			"not HLSQ", "not PC", "not LRZ", "not TP",
+		};
+
+		val &= GENMASK(6, 0);
+
+		if (mid == 3 && val < ARRAY_SIZE(uche_clients_a660))
+			return uche_clients_a660[val];
+
+		if (mid == 1 && val < ARRAY_SIZE(uche_clients_a660_not))
+			return uche_clients_a660_not[val];
+
+		return "UCHE";
+	} else {
+		/* mid = 3 is most precise and refers to only one block per client */
+		if (mid == 3)
+			return uche_clients[val & 7];
+
+		/* For mid=2 the source is TP or VFD except when the client id is 0 */
+		if (mid == 2)
+			return ((val & 7) == 0) ? "TP" : "TP|VFD";
+
+		/* For mid=1 just return "UCHE" as a catchall for everything else */
+		return "UCHE";
+	}
 }
 
 static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+
 	if (id == 0)
 		return "CP";
 	else if (id == 4)
 		return "CCU";
 	else if (id == 6)
 		return "CDP Prefetch";
+	else if (id == 7)
+		return "GMU";
+	else if (id == 5 && adreno_is_a7xx(adreno_gpu))
+		return "Flag cache";
 
 	return a6xx_uche_fault_block(gpu, id);
 }
-- 
2.31.1

