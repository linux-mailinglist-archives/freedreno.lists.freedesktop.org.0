Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD667108B
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8134210E62F;
	Wed, 18 Jan 2023 02:05:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84A10E62F
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:05:53 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b4so28206458edf.0
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Mo3OsjRmoegPVBXpDHztjrI35bAGMIMb/BBoDQiIGE=;
 b=uqXudvu1MCtrBLj2k/8P0eqOwFbcvvMPhyQDKG0Nsk7+kCuwkvXUDgzv6Hea6OPaI0
 l/fWZK8Rsr9t391yNau3seUvPA9KdvG02Rjn5Wm7SToUquUANVVb273R+asuwUf/rWhk
 5uc/7gG2jciJyhPFFcP6/CoJFJ1YUyBsM19525fnwSRkLaMiss/GMHCrdmJN50zt2PIC
 0HJEVvKyPGBfDi3+fj6P2g8NkpGodnf1ylFXYPgyUDwvi7OZHBzb5YLMt++kay26iUur
 bq2DgynP7f50zBcMnBbVUSXVrzNqkk9a0OU6tK9N6AaWDA2gmFYaPtC1IIMwcr5oyYku
 i61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Mo3OsjRmoegPVBXpDHztjrI35bAGMIMb/BBoDQiIGE=;
 b=UGwoeV7A5VJfkU0LljY+IGEJaxCzIPdlHgezA/WxHOLrxkVk4T/N7khuUyooOuw/Yk
 oiWal4dBx/k8LcUPT0CDAffaAyfqEKOFq4mzCeJ6bZPYadHswfSXU/5l6BxfAU5YVGBD
 htLLmzUgpUb3Rc74qh9+vfxXRGv+nLE/uKJctJPRjDOdIOw9sb8W6RbFKvfrUgpmhm9j
 +HAhOOMyyGLzJRk6iv3Qjt4bIM7+ZvCPRJA0dgAfTsy+7fQy/ELj3GnLCoowJQRiRu77
 n7R96/NMKrrK1nWmFoFu+QyUqcFbIKb7XKbEueQMmzl91XxRjtjmfFvMDibNC9AkqWgh
 wzDA==
X-Gm-Message-State: AFqh2krpFTMK3pX9DilWa+13gf2JOsQRJ6Td6B/4K9iAOVuoGA+/qs1F
 Ip8qzx5DupXpb/uCUW6K1tfOPQ==
X-Google-Smtp-Source: AMrXdXs7o7jY9Bn4+fBgXzZsPOskZ1OqDKjUQsZqGxiJcTwUNfkGFNx1rl1rt7/SvMi6oA7OHizOPQ==
X-Received: by 2002:a05:6402:3496:b0:48e:9c36:6c39 with SMTP id
 v22-20020a056402349600b0048e9c366c39mr7097405edc.0.1674007551486; 
 Tue, 17 Jan 2023 18:05:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s1-20020aa7c541000000b00495c3573b36sm13544668edr.32.2023.01.17.18.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:05:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 04:05:49 +0200
Message-Id: <20230118020549.1690078-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: add missing dpu_encoder kerneldoc
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Describe missing dpu_encoder_phys_wb_is_master() argument and struct
dpu_encoder_virt.wide_bus_en field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1a528ff0f28..758261e8ac73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -162,6 +162,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
 struct dpu_encoder_virt {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 95921efd8139..bac4aa807b4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -26,6 +26,7 @@
 
 /**
  * dpu_encoder_phys_wb_is_master - report wb always as master encoder
+ * @phys_enc:	Pointer to physical encoder
  */
 static bool dpu_encoder_phys_wb_is_master(struct dpu_encoder_phys *phys_enc)
 {
-- 
2.39.0

