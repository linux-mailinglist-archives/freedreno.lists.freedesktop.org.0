Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3862B6BAC
	for <lists+freedreno@lfdr.de>; Tue, 17 Nov 2020 18:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EF389F47;
	Tue, 17 Nov 2020 17:26:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F77089F47
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 17:26:12 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 81so8094419pgf.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXY01vYqSIFKCXp0IDMP/PsFb63uKbgbyX0xqNFjPx8=;
 b=Ui84wE1DPycMuErhBKrJglxCN+6U2dIsJ8AXIsquTnLJwX7valeZ/Wj4u13g/P7cca
 hCCwyq37SCXL+glSjaLy48q3Es/ccTZPdji18Jc19ouRkm25CJBTDoKB2hq56S1gsxJT
 CgkNQMv/DyTA8jUzzWDYbwu+gOE/Q4fpQMkqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXY01vYqSIFKCXp0IDMP/PsFb63uKbgbyX0xqNFjPx8=;
 b=AvUUO3GuIwnH5qESxg+qGBCW8W1a/q3wTP4yALfFGuOX9Uox2bzisq1YXciFWLbnot
 Mnp4J8/5E/G53Rcjrl5nS54IsHsnWiqiQtlUpjVohfn2G2bPD9z/Jqouy63UQQPLA3xz
 +e3DLRx3lxhp2KgLCCoPB7cPV8fyHTzgIEGI63DOIE56CLpq0YKyqTTuUsnqwQEKTDut
 gktSo9zHhpWkIp1g+T3wX2TsGZX1gkjzLSVcS8kb069DguSl2y++rdHKCTwSiUePN8ZH
 dDo3GQj1o9GDzBm2JnL+bWtYcujebiuzJlAcH5rKYco24rpISvrzNU0vc2p6pkv7zw7D
 K6LA==
X-Gm-Message-State: AOAM5304B0senLRnQUyuBlEacrEEfPa15rEdpyExS4SJg6g/pbnIVuJQ
 5cxQYopdk+uhepGDIHEQcB6Xug==
X-Google-Smtp-Source: ABdhPJx6BBjXdUQptGLanbbvON0/vIPEQPGdKUos1T5nRqRB9kJFXWbLNYc4fRG2VpF08DlYFiAz3w==
X-Received: by 2002:a65:4485:: with SMTP id l5mr4316577pgq.10.1605633971667;
 Tue, 17 Nov 2020 09:26:11 -0800 (PST)
Received: from smtp.gmail.com ([100.99.132.239])
 by smtp.gmail.com with ESMTPSA id y9sm3816846pjn.24.2020.11.17.09.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:26:11 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Nov 2020 09:26:08 -0800
Message-Id: <20201117172608.2091648-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dpu: Remove chatty vbif debug print
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I don't know what this debug print is for but it is super chatty,
throwing 8 lines of debug prints in the logs every time we update a
plane. It looks like it has no value. Let's nuke it so we can get
better logs.

Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 5e8c3f3e6625..5eb2b2ee09f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
-				params->vbif_idx, params->xin_id, i,
-				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 	}
-- 
Sent by a computer, using git, on the internet

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
