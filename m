Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865EA971D4
	for <lists+freedreno@lfdr.de>; Tue, 22 Apr 2025 18:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDFD10E5D7;
	Tue, 22 Apr 2025 16:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IKqyW+Yy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7621810E5D7
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 16:01:04 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-47675dc7c79so4578601cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Apr 2025 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745337663; x=1745942463; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YjXCskq7cQYbnjS54UDv8tUD364i4yMw5X53vMCFRVA=;
 b=IKqyW+YyHmfXFBtLrseiyCPbuXaA/Ow6TPA00eK3n0Lco2TMoY1Akf0Z470KtM4ib/
 HVHOBVHY+vbITcXZwn/oRsXoMW6b54FOeJSzF5OwkwzBKE0ObKuM9ADXuuhsaupbB7y3
 nbbB4TkLweZXdMQOeGxDUC5xkgZlEktACReGKp/jFJabN2OKXL+N0LmDC1jibVnw6zi7
 1XwW89PCfS0w2xtUAyJLC/BhZ4sOL2GOyKnWar/2I58yuQmfbLE3FhXPc0UdGd7Cttgb
 rrfC8kFVWhz9VO1yrc934vGoHpIHY8Fnfn8jhgdA3r/wflgWlaBieqDCKkMjWwE9nzVl
 wSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745337663; x=1745942463;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YjXCskq7cQYbnjS54UDv8tUD364i4yMw5X53vMCFRVA=;
 b=ciG6oig4masC5DOIW3WERU6BnPSU0243YvCiwTnzwqJX1NhNgwq6A/OEb2pFc+qN9q
 0TN6/d60nsZFKRzAsj+l5rN8Fz8AsUl8fu6cSq8ziAjGqW5fdAT/TslS7G4Ea6b9Lrzt
 7RiGQGCA6D0V72nlQYwscDY62Jd6vTv+ZYqsVUwI9FdtyO8yNjSF71a3u9W2Du2epvjK
 TujQI67BNdvTYOBCMgE4J2EuuPTG+sz1WPieErBDTcXNyeA/N9w4QGOwvVmiQMECMZaN
 ytPsPZUipImn7A83bG+0QrYbjByF+/UWGJ4+BSl+hiz2kfOHhJ2iPYWxOC8J/cwS944/
 sIzw==
X-Gm-Message-State: AOJu0Yx2in0bbq3gCeYkFL4eafzF76XqW9vh7XOHh3VltFIn8M8KTJgx
 Cd7bnNbxOvTtuTlVkHbGFDBtxXh5NB+MX1BxpZEuvSxFLJ9eurJR
X-Gm-Gg: ASbGnctXFk76QZdd+B5ueL7q1mDyr45jhwhv9Bxd6E7wC8IqsmgPb6KaMEJSQw6YdhW
 oR+HIfcwp+ipOtxZkzM7WPeRyragqB9dfUkcfel4Kcjic38OjNbFCUGXNr12f2BqsDYTZD7Q6vK
 p96iL3tk19jzXNxv8078UOevEwn92O4e3XL+GR1960qvPlsn2Wy1vWd5rt7ukOXa2r+VemkLxeF
 pCzUS2cb5dfIPYbtuMp9r4I3eLIRF0n3NNFnD1ntOrAOYdB081oFIsWZtXBknxYckl6Oy+48XT1
 gVkFaJegLnBs53mZ2GhFx+i7p2Av5hxgshjGeF/QuQ8anfoMap/2GDcJKA/QtaxZ/xtzHBsN9e+
 3MsKco8Vz
X-Google-Smtp-Source: AGHT+IF1ogDqxlW+r/0R1J1gnCAQsVl53yn9uOkBSYWCGtAT9z6vnTdFk7p9Qipv7Z02vypzGkcnOA==
X-Received: by 2002:a05:622a:1492:b0:476:652f:4dba with SMTP id
 d75a77b69052e-47aec393d33mr83496591cf.3.1745337663133; 
 Tue, 22 Apr 2025 09:01:03 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47ae9c16df4sm57259111cf.1.2025.04.22.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 09:01:02 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 22 Apr 2025 12:00:46 -0400
Subject: [PATCH] drm/msm: Be more robust when HFI response times out
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-msm-hfi-resp-fix-v1-1-b0ba02b93b91@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC29B2gC/x2MQQqAIBAAvyJ7bsEsofpKdLBacw9auBBB+Pek4
 wzMvCCUmQQm9UKmm4XPVKFtFGzBpYOQ98pgtLG6NwajRAyeMZNc6PlBO7i1c+1obe+hZlemqv/
 lvJTyAT7LffliAAAA
X-Change-ID: 20250422-msm-hfi-resp-fix-58ab3a19554f
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745337662; l=3343;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=mmYSIgHugRiwghJEE0cRqGtHGJlyqxTNT0aPk9Vyk5k=;
 b=BlIccN71EjdZrdU8fRsBLs8qgo64fcarV0xrOxz2bnLOIh5kopbsW45T/vkOL/QnNje5//443
 i0ThdmuIq2ZCGairkOKpJQdSJGjhQ3rE1BSLdOe6nC0mmVpa9ICX9Qu
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
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 0989aee3dd2cf9bc3405c3b25a595c22e6f06387..d28ac3bcfbe4df18e983097c130aa31c648341b8 100644
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
 
@@ -129,12 +140,15 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
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
+			if (ret)
+				return ret;
+			continue;
 		}
 
 		if (HFI_HEADER_ID(resp.header) == HFI_F2H_MSG_ERROR) {

---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250422-msm-hfi-resp-fix-58ab3a19554f

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

