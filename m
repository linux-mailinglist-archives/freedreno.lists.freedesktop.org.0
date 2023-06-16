Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482DF733148
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 14:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0906A10E612;
	Fri, 16 Jun 2023 12:34:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jun 2023 12:34:01 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324910E612
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 12:34:01 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EA99B3F734
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1686918498;
 bh=7aIuaUbJc/mQS9T0aBfOHsiM7MOxneztv9jcxZlcdiI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=gmkAFbkAgV36mjnQXD+lL00eadH3cL2iws4TOzpi7053Tf2wJt5nulPlls1Ezb015
 bAcmkX8kwYpCATpZkQgAo03SXmLbksUkX7zMAbwF86Inur98lYzEZXUEm4wwBh9u1O
 lSPAsJjPW+vv/bNL4gO6HgJeeg3FttkBE+e5dioK2qGIflTkUAJQtuTwrm3vEkLIcC
 qBbOhaiHn8OjnoBDfaPTyKTvE1g3dcN17VY4Z0d7h49+wZhutkHC47JnDS2PhGPNon
 JOssCEYQT6kU9Aecm/ismeMLrOBu+5tpfcGB3N7A/C2ZeCE4UGZUc0xxCBeC70tyMp
 vDs9UQTkt8hKA==
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30e4d11a413so840727f8f.1
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jun 2023 05:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686918498; x=1689510498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7aIuaUbJc/mQS9T0aBfOHsiM7MOxneztv9jcxZlcdiI=;
 b=IDqYBWDXu1r2RsTe6ErxMY31WT4Z8dHqHpqzzjjjQvni9Hwi2xVDMnzYo9dOWoQr0W
 QDjsySP/94K4Ee/JCvB4sdZvdqdhyJpBDZkm1sFwxGCwW4IYiAKLRNKaShdCrY8pzEvp
 ss+XgwutqGxpMr4JOxUfG9zKwI7mxF91rCHQspW4AtrX3rf+urs1OHkiF8r4mQFMlzGE
 guZ4C2gQQWqt2QPbB3wrZ2Nu2a7fscS8vLxryzaYNGCYtXCro3Oo/cegS522NoFmE5dx
 zURmOxEU946BwVWuKorcmtxjPfcuDX1WiKsZ83ST7iJvS8br1sDb7a+1Rm9c0Ll6Rmoy
 b5wQ==
X-Gm-Message-State: AC+VfDwwN3lbO+VCdku1K5sId//ypuIoVIUgAA4+WwNe49fstgO2PfM2
 fCkAtFxT/DgSgiToqGL8MKIKdSexRs3D9ykCoDoXpgHlEoLs8MwkR65HOegIMP/9naVm5VdXlaa
 Khm8OSZpmqrCENIuKZLgLg8+dT1P5ZvyBbZ/s0702vLx/zw==
X-Received: by 2002:a5d:540a:0:b0:30f:b0de:f100 with SMTP id
 g10-20020a5d540a000000b0030fb0def100mr1688694wrv.23.1686918497893; 
 Fri, 16 Jun 2023 05:28:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7unBLWvn7eu+/rOTRKqs5JmWynktPc0fpo3fUsOeWbUBSx9ckKi/1QQo/F4AC7I4VtmMb2rQ==
X-Received: by 2002:a5d:540a:0:b0:30f:b0de:f100 with SMTP id
 g10-20020a5d540a000000b0030fb0def100mr1688671wrv.23.1686918497538; 
 Fri, 16 Jun 2023 05:28:17 -0700 (PDT)
Received: from localhost ([194.191.244.86]) by smtp.gmail.com with ESMTPSA id
 cr4-20020a05600004e400b003063a92bbf5sm23726788wrb.70.2023.06.16.05.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 05:28:17 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Date: Fri, 16 Jun 2023 14:28:15 +0200
Message-Id: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/adreno: Update MODULE_FIRMWARE macros
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
Cc: quic_akhilpo@quicinc.com, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, juerg.haefliger@canonical.com, ribalda@chromium.org,
 joel@joelfernandes.org, johan+linaro@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add missing MODULE_FIRMWARE macros and remove some for firmwares that
the driver no longer references.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 8cff86e9d35c..9f70d7c1a72a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -364,17 +364,32 @@ MODULE_FIRMWARE("qcom/a330_pm4.fw");
 MODULE_FIRMWARE("qcom/a330_pfp.fw");
 MODULE_FIRMWARE("qcom/a420_pm4.fw");
 MODULE_FIRMWARE("qcom/a420_pfp.fw");
+MODULE_FIRMWARE("qcom/a506_zap.mdt");
+MODULE_FIRMWARE("qcom/a508_zap.mdt");
+MODULE_FIRMWARE("qcom/a512_zap.mdt");
 MODULE_FIRMWARE("qcom/a530_pm4.fw");
 MODULE_FIRMWARE("qcom/a530_pfp.fw");
 MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
 MODULE_FIRMWARE("qcom/a530_zap.mdt");
-MODULE_FIRMWARE("qcom/a530_zap.b00");
-MODULE_FIRMWARE("qcom/a530_zap.b01");
-MODULE_FIRMWARE("qcom/a530_zap.b02");
+MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
+MODULE_FIRMWARE("qcom/a540_zap.mdt");
+MODULE_FIRMWARE("qcom/a615_zap.mdt");
 MODULE_FIRMWARE("qcom/a619_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
-MODULE_FIRMWARE("qcom/a630_zap.mbn");
+MODULE_FIRMWARE("qcom/a630_zap.mdt");
+MODULE_FIRMWARE("qcom/a640_gmu.bin");
+MODULE_FIRMWARE("qcom/a640_zap.mdt");
+MODULE_FIRMWARE("qcom/a650_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_sqe.fw");
+MODULE_FIRMWARE("qcom/a650_zap.mdt");
+MODULE_FIRMWARE("qcom/a660_gmu.bin");
+MODULE_FIRMWARE("qcom/a660_sqe.fw");
+MODULE_FIRMWARE("qcom/a660_zap.mdt");
+MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
+MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
+MODULE_FIRMWARE("qcom/yamato_pfp.fw");
+MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 
 static inline bool _rev_match(uint8_t entry, uint8_t id)
 {
-- 
2.37.2

