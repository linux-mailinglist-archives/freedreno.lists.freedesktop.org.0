Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F853B9B0
	for <lists+freedreno@lfdr.de>; Thu,  2 Jun 2022 15:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA0710FE31;
	Thu,  2 Jun 2022 13:30:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268C110FE3E
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 13:30:44 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id v9so5238242lja.12
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a5BKrsCH5wRSDRaKNzDTHEmayJvo4QTIDxMaqEjeRG8=;
 b=nVd+4ZAPRm0cVUjYXBnqsjZ1JhLniHfEi/dZXxv9LKQict8KPx3cy8tlVm85l6OXuL
 DO7abeA+wU+zniTW4u3xG7rWfT/YHzRTHt7MzoWYKthAG77NWfBCtXhT+Kf9/QzXTDK7
 yvj3HAhHvMz68u8Tv9g/5b3lpxTGqZsz5AvUNQJU+i5DzRLyXQjLQ+GnBG5KLjWJ+/3u
 zwq+mkhXmLgy32Q+iF7c8ndYNRTkMpembdfiVV4YCiW/OpXNYOxo3cos+xf/KzDDHkMA
 5ln3yHMoL2ZCgp4fFPv4SmMlciRp1oCxBTsP6vuE0Ht6ViZ7IrObFd18FfEfsIrLVt7g
 u9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5BKrsCH5wRSDRaKNzDTHEmayJvo4QTIDxMaqEjeRG8=;
 b=ho4PAtXGdzs+hmelmU/P51T519N39Fop0LK2xBa4T9aLHc/zZWXa2GLDQbB+H8ovTN
 o8J7Gsordc1e3dXLHCU3dBqKY3RGGgWqpml/YC6SKrFNPbzA/HHYa0KwDwaZaH4cx/ag
 iiVegwBV+KExRhIe+zgzcxGs0ZzyJCuvVA/vtp6vcBNHpm0sqDIcC4iYbsRKpk9sN8yP
 ge3+LndEIu+/ZgFne0NTgIAFXa905SOXrxUufV0Q3VhT0Bebvc2bybreFtaOnNoZvOXC
 /6OvbjnsIHeOaSd9ib0Xr5ADPnfkikMPnxtA8P/Xcw4aLKphF3uAbO8UlxIULDhnXC0A
 IASg==
X-Gm-Message-State: AOAM532yPdGzCb84NKxUz0eeuIN/VFbbvgMZFn01MTr0VzfGB2nCQEMG
 ksctBx28AZIgGwyczW3g1kZPBw==
X-Google-Smtp-Source: ABdhPJxqPDkm6P8TZf43RR96EN+QnP9kfu7BnOBiainUq696bFR7bSNF+F9uU7fJd4dBnDna90OLpA==
X-Received: by 2002:a2e:9ec4:0:b0:253:9bc1:c709 with SMTP id
 h4-20020a2e9ec4000000b002539bc1c709mr41682720ljk.272.1654176642270; 
 Thu, 02 Jun 2022 06:30:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:30:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  2 Jun 2022 16:30:34 +0300
Message-Id: <20220602133039.1739490-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/7] drm/msm/dpu: move
 VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rather than detecting VBIF_XINL_QOS_LVL_REMAP_000 based on the
hwversion, push the offset to the hw_catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c    | 4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 78c7d987c2ca..cff6fe3a85ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1339,6 +1339,7 @@ static const struct dpu_vbif_cfg msm8998_vbif[] = {
 	.default_ot_wr_limit = 32,
 	.features = BIT(DPU_VBIF_QOS_REMAP) | BIT(DPU_VBIF_QOS_OTLIM),
 	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x20,
 	.dynamic_ot_rd_tbl = {
 		.count = ARRAY_SIZE(msm8998_ot_rdwr_cfg),
 		.cfg = msm8998_ot_rdwr_cfg,
@@ -1366,6 +1367,7 @@ static const struct dpu_vbif_cfg sdm845_vbif[] = {
 	.base = 0, .len = 0x1040,
 	.features = BIT(DPU_VBIF_QOS_REMAP),
 	.xin_halt_timeout = 0x4000,
+	.qos_rp_remap_size = 0x40,
 	.qos_rt_tbl = {
 		.npriority_lvl = ARRAY_SIZE(sdm845_rt_pri_lvl),
 		.priority_lvl = sdm845_rt_pri_lvl,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 80bc09b1f1b3..f70de97f492a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -709,6 +709,7 @@ struct dpu_vbif_qos_tbl {
  * @ot_rd_limit        default OT read limit
  * @ot_wr_limit        default OT write limit
  * @xin_halt_timeout   maximum time (in usec) for xin to halt
+ * @qos_rp_remap_size  size of VBIF_XINL_QOS_RP_REMAP register space
  * @dynamic_ot_rd_tbl  dynamic OT read configuration table
  * @dynamic_ot_wr_tbl  dynamic OT write configuration table
  * @qos_rt_tbl         real-time QoS priority table
@@ -721,6 +722,7 @@ struct dpu_vbif_cfg {
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
 	u32 xin_halt_timeout;
+	u32 qos_rp_remap_size;
 	struct dpu_vbif_dynamic_ot_tbl dynamic_ot_rd_tbl;
 	struct dpu_vbif_dynamic_ot_tbl dynamic_ot_wr_tbl;
 	struct dpu_vbif_qos_tbl qos_rt_tbl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index b757054e1c23..046854c3fbed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -30,7 +30,7 @@
 #define VBIF_XIN_HALT_CTRL0		0x0200
 #define VBIF_XIN_HALT_CTRL1		0x0204
 #define VBIF_XINL_QOS_RP_REMAP_000	0x0550
-#define VBIF_XINL_QOS_LVL_REMAP_000(v)	(v < DPU_HW_VER_400 ? 0x570 : 0x0590)
+#define VBIF_XINL_QOS_LVL_REMAP_000(vbif)	(VBIF_XINL_QOS_RP_REMAP_000 + (vbif)->cap->qos_rp_remap_size)
 
 static void dpu_hw_clear_errors(struct dpu_hw_vbif *vbif,
 		u32 *pnd_errors, u32 *src_errors)
@@ -163,7 +163,7 @@ static void dpu_hw_set_qos_remap(struct dpu_hw_vbif *vbif,
 
 	c = &vbif->hw;
 
-	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(c->hwversion);
+	reg_lvl = VBIF_XINL_QOS_LVL_REMAP_000(vbif);
 	reg_high = ((xin_id & 0x8) >> 3) * 4 + (level * 8);
 	reg_shift = (xin_id & 0x7) * 4;
 
-- 
2.35.1

