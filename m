Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8432690B
	for <lists+freedreno@lfdr.de>; Fri, 26 Feb 2021 22:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B6C6E0BF;
	Fri, 26 Feb 2021 21:08:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DBB6E0BF
 for <freedreno@lists.freedesktop.org>; Fri, 26 Feb 2021 21:08:23 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id q20so7073694pfu.8
 for <freedreno@lists.freedesktop.org>; Fri, 26 Feb 2021 13:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVGDLSoE8Jf7sMQMQpGvt6Wf6tucKZ6z2KlnT/6iGGM=;
 b=VTRAUebOmOpB43+gbwH+sAbYpe+WigJDzenLk0ghSUS02Z8QA9duwmxELLrdkMDyHg
 bMGSqnRbCa/x7whpnyYq0HvqwsWIbm1iRnB6TbfGm1oCgCvSGkQF/oQtYvwVDF/lkvSp
 T5gTOh1rpTkbPuxkKdKD9CpkwkhiH6Ghpp3jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVGDLSoE8Jf7sMQMQpGvt6Wf6tucKZ6z2KlnT/6iGGM=;
 b=RsYWzscyfQtSF+4dz1c8o46yaQqxXMz5tRcMJs0450htdk+DuwaFDsjgs5Z4iyWjkI
 Xv8JRMtIkCVZl0++phVq399jIZtd1oQPlMIEf2CeEEbVNLsG6eqOZ3x7ZrjY6oM1PT16
 B7AEAU1XDcjrgXaCuMWj+QD/Z/8hSFetOyl15sQjU9wIWX9yHrTzwLD3wl8D77yXkQbG
 N7wU5xPsfQWMPxYd9ZcAaW5GZyB1MQ6FMSFsJ4a9P3ZNZXM53zszrt5G/CwzalVwqwoV
 LBZDX5UvDk3OpRXhzYqjouxlbXrW4dCCD6wXtnI/t3pu/IxWQ0wezYd4rSKv9at0MCuT
 v0hg==
X-Gm-Message-State: AOAM530poNyrN/3PdiZKM54iZZn+O/KVBGHxyXOENLKn/VjI4zB5i5JV
 vXTt4g1E4hZ1TbMobkHR9757Sw==
X-Google-Smtp-Source: ABdhPJxfJ1Jo8odiEuLEvuDjrXHkdQ5hU5GY3FOzo4tifoV5AaWGnnEImfDgaWh3cPVLPr+a66Mfbw==
X-Received: by 2002:a62:7a88:0:b029:1ee:174:7c22 with SMTP id
 v130-20020a627a880000b02901ee01747c22mr5003531pfc.35.1614373703568; 
 Fri, 26 Feb 2021 13:08:23 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:e8bb:5726:f58b:4e37])
 by smtp.gmail.com with ESMTPSA id u1sm6544501pfn.209.2021.02.26.13.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 13:08:23 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Fri, 26 Feb 2021 13:08:21 -0800
Message-Id: <20210226210821.682107-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dp: Restore aux retry tuning logic
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In commit 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after
irq_hpd handler") we dropped a reset of the aux phy during aux transfers
because resetting the phy during active communication caused us to miss
an hpd irq in some cases. Unfortunately, we also dropped the part of the
code that changes the aux phy tuning when an aux transfer fails due to a
timeout. That part of the code was calling into the phy driver to
reconfigure the aux TX swing controls, working around poor channel
quality. Let's restore this phy setting code so that aux channel
communication is more reliable.

Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Fixes: 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after irq_hpd handler")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Noticed by code inspection and based on bug reports where the aux channel
stops working once the commit this is fixing is applied.

 drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 1c6e1d2b947c..7c22bfe0fc7d 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -32,6 +32,8 @@ struct dp_aux_private {
 	struct drm_dp_aux dp_aux;
 };
 
+#define MAX_AUX_RETRIES			5
+
 static const char *dp_aux_get_error(u32 aux_error)
 {
 	switch (aux_error) {
@@ -377,6 +379,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	ret = dp_aux_cmd_fifo_tx(aux, msg);
 
 	if (ret < 0) {
+		if (aux->native) {
+			aux->retry_cnt++;
+			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
+				dp_catalog_aux_update_cfg(aux->catalog);
+		}
 		usleep_range(400, 500); /* at least 400us to next try */
 		goto unlock_exit;
 	}

base-commit: 8b83369ddcb3fb9cab5c1088987ce477565bb630
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
