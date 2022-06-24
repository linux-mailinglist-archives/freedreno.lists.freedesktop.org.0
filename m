Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D68055A514
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 01:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCC710F5E6;
	Fri, 24 Jun 2022 23:51:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1098610F5C7
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 23:51:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id t24so7040232lfr.4
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 16:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9baGnfbZe4W5Si2Az6nOv/xqySt/TKjyl9d4AgEnz8=;
 b=bukXzi2lWT5Ql2mpcuU2lrxCya4q8HoKwQY9qH68JdWJe0Ai4rK/GqwYT6ItseU2uf
 6EliMDL7EizkIEy+QAEbP/mZL/KDkSWgZM0yjhuIYOhe+uRfMmoZGY/JXvSLNZcziqDz
 ZDmwcNZBYG/RUJ1jHPSCnv5Hw6b/DhOmtIbqd1ZoCGHzg3q+onVpCD0qaswRDBSr9hOo
 WMylDelhnMdTeLcy9MvKhAjL9B2E4N2Yw8FfYm10mJCedm0NG2xbohGClthxuQcNt40z
 mHLBtWQISlPYE0sX3hP6G9FO5g6VKvS6IwvXdVaNBgMg8b8B35gkORrAlOcwtrq9oUjI
 YC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9baGnfbZe4W5Si2Az6nOv/xqySt/TKjyl9d4AgEnz8=;
 b=TZRxLpt0aZjwOt8b11YzIsF6b1u3lzkpeanUDVmZhNUnSKRQqrTezqVNxy6H0GSA+7
 f01AP96tzMaJRXMYHHb2T54+mNE8VKyHDKuE2C/6fzDZ622oPePzemyVk5k3azH+eDzJ
 +/btnH6+HYAo/uIm3g/Tnc+renzG7gC6tXRPxFAE5zQV/1nBT0elpU8rCT7RzLzE2GeU
 XHi+gJpPNioCJ/Xr2SveZHgyCwa/2aCTB5vRozhGtCjEla83UYDxgOselF+voscxYg9r
 lhQU/8v1V/JkLteIUdWEjh6IGZrd61pHQ/3/uppXZ8YRhCTahDLVP7b5pKAbVnmx3Icp
 QpEQ==
X-Gm-Message-State: AJIora8fooNZS9s4SBoD9WtCAckofz93MzO6kSTO6F5bB39GlTmjR49L
 eSLo+J0WFd18+fSQnZT+FoZLzA==
X-Google-Smtp-Source: AGRyM1tB+IfW+Bzv7LTTxIsyjWQuHfFks/UAMPIDti/xPLc8AYIbVjxtUv9PifwYCVZ+P+cFiXV7Dw==
X-Received: by 2002:a05:6512:2256:b0:481:10e:b2f3 with SMTP id
 i22-20020a056512225600b00481010eb2f3mr620777lfu.619.1656114681278; 
 Fri, 24 Jun 2022 16:51:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05651203a800b0047f9fa2925csm579003lfp.234.2022.06.24.16.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 16:51:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 25 Jun 2022 02:51:20 +0300
Message-Id: <20220624235120.376293-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: simplify and unify
 dpu_encoder_get_intf and dpu_encoder_get_wb
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

Remove extra nexting level from the dpu_encoder_get_intf(), replacing it
with the explicit return in case the INTF_WB was passed to the function.

While we are at it, also change dpu_encoder_get_wb() to also use
explicit return rather than the goto.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f435baa500f8..c682d4e02d1b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1255,12 +1255,13 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 {
 	int i = 0;
 
-	if (type != INTF_WB) {
-		for (i = 0; i < catalog->intf_count; i++) {
-			if (catalog->intf[i].type == type
-				&& catalog->intf[i].controller_id == controller_id) {
-				return catalog->intf[i].id;
-			}
+	if (type == INTF_WB)
+		return INTF_MAX;
+
+	for (i = 0; i < catalog->intf_count; i++) {
+		if (catalog->intf[i].type == type
+		    && catalog->intf[i].controller_id == controller_id) {
+			return catalog->intf[i].id;
 		}
 	}
 
@@ -1273,14 +1274,13 @@ static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
 	int i = 0;
 
 	if (type != INTF_WB)
-		goto end;
+		return WB_MAX;
 
 	for (i = 0; i < catalog->wb_count; i++) {
 		if (catalog->wb[i].id == controller_id)
 			return catalog->wb[i].id;
 	}
 
-end:
 	return WB_MAX;
 }
 
-- 
2.35.1

