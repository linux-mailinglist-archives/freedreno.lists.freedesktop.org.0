Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48154A1F5
	for <lists+freedreno@lfdr.de>; Tue, 14 Jun 2022 00:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6C610F83F;
	Mon, 13 Jun 2022 22:14:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7D910F8F3
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jun 2022 22:14:16 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id c144so5097762qkg.11
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jun 2022 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUiAeAfmEZIvnaedz68FdfSLl3Zzr0m6IgnYQsJx0+M=;
 b=L+MVtYj3pR9bGDgWW1ZLh6MEJL2EQuCpnYM8vbzG/AZc/TBQPbd5vwrc1jSCxsampk
 bDLP9XlkJpzVtfLiX6GJwl/7eZ+ooP+cOkck5THn2TZOmDlb0ItuoiArFCtKfuX0xWRi
 2SZD13n1AUaET9GxI3D6Y8qeqM4CIMesN2KBpO7+Rn5w/sUPtySQ90rNHUuUhu7/fYBX
 YzMXPg2zpJpcTXdpC8ftkbyUEXsv5PFHCcISDkPc23cPcaBJYbzjZ83/0DXASvENCMHc
 2S7+RfLPulb9pZJurQTv7Zt70tMZmNeVXMQH1nUcxQrfJYL/z9PQz7mUEgmKPnBPmMoj
 DnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DUiAeAfmEZIvnaedz68FdfSLl3Zzr0m6IgnYQsJx0+M=;
 b=hvzZt9kkDStiQkPPEW3hUN80w5Zr/rJHZXOJTslVFCOaUTFUnG98Tg79dhiQkIVB1Q
 HvD2QoeY/ZdFcHKmj0iEcYVkeqi7BWA7UjLqCbL7Q04wz2azR4qtzKB6Vw4zRl545MqT
 gFkRkwCrbEkj9alrKmRCv1uF2mfiDiUovrIgW6t5oLpdIbnenZF8LqSowj3/BGEtPhjf
 dqGhiyIboJ6KkpWllbyQKC2ACmQAaPajJ9CL8knXeFh+AVqPeyTDdsh/4cbLjRzAEmMZ
 MotdGm837QalB6t45TgmWmzkacRF4a81rHBCGZAV9hvMsTKzeagO6VIVwuBlwrsHT9NY
 ZA0g==
X-Gm-Message-State: AOAM531VcVg/tR9qqouLNKkHs7Tq/U+GyVvtZbcdUL607K6seGkQzV+N
 L4g8sONlM0aylOWX++jp7djYnayQW3sdc9bi
X-Google-Smtp-Source: ABdhPJz8SZxKA/0hDuOp4+Jhg9OT2Vji6pJSqJnR7maEE5yHqeZHat7TCXVM+y1Uv/5GzBpK9Bpq3w==
X-Received: by 2002:a05:620a:4252:b0:67e:8977:db80 with SMTP id
 w18-20020a05620a425200b0067e8977db80mr1813022qko.483.1655158455792; 
 Mon, 13 Jun 2022 15:14:15 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
 by smtp.gmail.com with ESMTPSA id
 l11-20020ac84ccb000000b002f92b74ba99sm5700569qtv.13.2022.06.13.15.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 15:14:15 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 13 Jun 2022 18:10:19 -0400
Message-Id: <20220613221019.11399-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm: use for_each_sgtable_sg to iterate
 over scatterlist
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The dma_map_sgtable() call (used to invalidate cache) overwrites sgt->nents
with 1, so msm_iommu_pagetable_map maps only the first physical segment.

To fix this problem use for_each_sgtable_sg(), which uses orig_nents.

Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
v2: use for_each_sgtable_sg and update commit message

 drivers/gpu/drm/msm/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index bcaddbba564df..a54ed354578b5 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -58,7 +58,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+	for_each_sgtable_sg(sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
 
-- 
2.26.1

