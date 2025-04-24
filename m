Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5FA9AF00
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 15:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB9310E0FC;
	Thu, 24 Apr 2025 13:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QqAPPK+r";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905C510E0FC
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 13:30:31 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6f2af1e6d16so1105436d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745501430; x=1746106230; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pmLF+E0FgWvrCgwAaOBbnmBQM/OkDLAr0NzhSTJNz7E=;
 b=QqAPPK+r9wwfr24DcL43nKojWzsnWU6qq5+Eky2VVesBNX6k1wVv+M+6DpI+qG+oXw
 5Gll/4Pc4EKiyv23HznODZjl9ZfY6rbl3DSf7A9yanypzNNe/x/mpquk3xO7kFoqWTUP
 nlbG47D+uvA5Qr7K5C74sKAFgAUFntScUNwgujxWDPNFd62H5IherX4Jvv31oxj6JEWT
 IAcYUX927MrdlK7gDueWvVGDopaxfPkkvPgYPq30U0tpnYyJpvlIuzUhDjtrdFkItpG7
 si0UFjpui+4nE8q0TIj1Y/scYgQBUR/ZWAbviY2B5CkA7vRYbRVzLLwTLvxOaAVJSd5m
 bWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745501430; x=1746106230;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pmLF+E0FgWvrCgwAaOBbnmBQM/OkDLAr0NzhSTJNz7E=;
 b=HaOwU2cTrQCTakM/sL1zr8ZBjf4borRi81Uj7x5O67UvWxaXgZXnar+vTopqfnfMP6
 QSEPxrDPRJ1o/MPPDUv62rHpaDApfoCeTeYbkdfthTp+xILulX7hiIiBZ8Ho1FW5Y8k1
 zgTyjPdT+WNo8AS9PQYU3A9KaGAhCewNKCEyQoLD0T9bIfrnCvkhqBBGLBXJAyhrOtA5
 M6hgIthtZFTygYvoxxS/pHdbSUhf1r1JtxzD3KDuXrTVvfxCZV3T0SCFEcSpSpVuGXY/
 vInU27TwUMC4jkNHGrg6sm/Pwsh1+eLoqIX/8+cMhNmTRD0fMe5KB62fcN8ba9h1PLXo
 UTgA==
X-Gm-Message-State: AOJu0Yw73vpWz3AfBTF4ndFBqIWmG7d9vw+heym+LH2jeZSqNWZR6+7p
 1s8C10wkM9iFCQDNtadI1TVmnwOVaeXPx1lM6k52bwAMWJRlBIF2
X-Gm-Gg: ASbGnct2EZYx7Rf/ZiKDcJ3qfuyrge5hoEKTZFy03lJUn31TkHt22s33OUnAbK5ZI8i
 hIoSKqwkNHDamVN0/AP07XooCy0SlCBUc7V99TuLvK7x55qXDRsF4LoZsbVhjyWITHhD1HgACs7
 fBoo4mYvPZLejbsFSU4rUr1853YULfpAcQhiY0/tvimsdnnv1dm0MT40OQnrO4SlVMin0avY5in
 N528b6EtG4NYlVusgsIEF6KWiViXftFzID904Fj5/HLbAyQaJfYPI7mH/X1hGty0TWmvNIxlix2
 Xi8QAvOS9eDBEvWyx2mUHWBeBGZlVHXLpj+JYa9Va/s29vUJ089lG5CzQfXzX6l1jmNXzNbxgGq
 XUDDRIXC8
X-Google-Smtp-Source: AGHT+IEY/XDR2pjedAJT6dFjv7biHEriIPvC1WqsJZAjdl5vREZ2ZvMsJUMQYbEOM6bAW/pg/D/N0A==
X-Received: by 2002:a05:620a:2955:b0:7c9:256a:953 with SMTP id
 af79cd13be357-7c956ee36cfmr160905085a.9.1745501429477; 
 Thu, 24 Apr 2025 06:30:29 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c958caec22sm87886085a.28.2025.04.24.06.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 06:30:28 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 24 Apr 2025 09:30:17 -0400
Subject: [PATCH v2] drm/msm: Be more robust when HFI response times out
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-msm-hfi-resp-fix-v2-1-3ce6adc86ebb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOg8CmgC/32NQQ7CIBBFr9LM2jFASyKuvIfpAupQJpG2AUM0D
 XcXewCX7yX//R0yJaYM126HRIUzr0sDdepgCnaZCfnRGJRQWgxKYcwRg2dMlDf0/EZ9sa630mg
 9eGizLVHTR/I+Ng6cX2v6HA9F/uyfWJEo0QlnhXKmd0be5mj5eZ7WCGOt9QvwyF59sAAAAA==
X-Change-ID: 20250422-msm-hfi-resp-fix-58ab3a19554f
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745501428; l=3681;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=EnyVgUjIVd7AINMIETM7sXVYiRev2ntC/nEKOrVaYRU=;
 b=VPiRpVPIFjNAYDTxWTQYyUmOt+RuOqdOfRsG+bt/JlEQEwR0pnkpi/NNoSnLT+ZEcd4jTmS8/
 7+bxaS9z5VeC3u+DwORBbHrQPJzduufgIlcKoPhSdF3oRA2iCVI0k6D
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

If the GMU takes too long to respond to an HFI message, we may return
early. If the GMU does eventually respond, and then we send a second
message, we will see the response for the first, throw another error,
and keep going. But we don't currently wait for the interrupt from the
GMU again, so if the second response isn't there immediately we may
prematurely return. This can cause a continuous cycle of missed HFI
messages, and for reasons I don't quite understand the GMU does not shut
down properly when this happens.

Fix this by waiting for the GMU interrupt when we see an empty queue. If
the GMU never responds then the queue really is empty and we quit. We
can't wait for the interrupt when we see a wrong response seqnum because
the GMU might have already queued both responses by the time we clear
the interrupt the first time so we do need to check the queue before
waiting on the interrupt again.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Add back error print about the queue being empty if we timeout while
  waiting for a message when the queue is empty.
- Link to v1: https://lore.kernel.org/r/20250422-msm-hfi-resp-fix-v1-1-b0ba02b93b91@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 0989aee3dd2cf9bc3405c3b25a595c22e6f06387..1bc40d667281a22a34e4f510b2a1333f9c5675c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -100,12 +100,10 @@ static int a6xx_hfi_queue_write(struct a6xx_gmu *gmu,
 	return 0;
 }
 
-static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
-		u32 *payload, u32 payload_size)
+static int a6xx_hfi_wait_for_msg_interrupt(struct a6xx_gmu *gmu, u32 id, u32 seqnum)
 {
-	struct a6xx_hfi_queue *queue = &gmu->queues[HFI_RESPONSE_QUEUE];
-	u32 val;
 	int ret;
+	u32 val;
 
 	/* Wait for a response */
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
@@ -122,6 +120,19 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 	gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_CLR,
 		A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ);
 
+	return 0;
+}
+
+static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
+		u32 *payload, u32 payload_size)
+{
+	struct a6xx_hfi_queue *queue = &gmu->queues[HFI_RESPONSE_QUEUE];
+	int ret;
+
+	ret = a6xx_hfi_wait_for_msg_interrupt(gmu, id, seqnum);
+	if (ret)
+		return ret;
+
 	for (;;) {
 		struct a6xx_hfi_msg_response resp;
 
@@ -129,12 +140,18 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 		ret = a6xx_hfi_queue_read(gmu, queue, (u32 *) &resp,
 			sizeof(resp) >> 2);
 
-		/* If the queue is empty our response never made it */
+		/* If the queue is empty, there may have been previous missed
+		 * responses that preceded the response to our packet. Wait
+		 * further before we give up.
+		 */
 		if (!ret) {
-			DRM_DEV_ERROR(gmu->dev,
-				"The HFI response queue is unexpectedly empty\n");
-
-			return -ENOENT;
+			ret = a6xx_hfi_wait_for_msg_interrupt(gmu, id, seqnum);
+			if (ret) {
+				DRM_DEV_ERROR(gmu->dev,
+					"The HFI response queue is unexpectedly empty\n");
+				return ret;
+			}
+			continue;
 		}
 
 		if (HFI_HEADER_ID(resp.header) == HFI_F2H_MSG_ERROR) {

---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250422-msm-hfi-resp-fix-58ab3a19554f

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

