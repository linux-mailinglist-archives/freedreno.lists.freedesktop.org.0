Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A4692CFE
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99F610EE53;
	Sat, 11 Feb 2023 02:11:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7B710ECE9
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qb15so18131518ejc.1
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwtA7XXf/jmW76OxegLq4C6A/wcbkGUK+Xfjn7xbYXI=;
 b=Y4qYfwMG7y0G4SNJ6t/CA5vwOyoQsslsSRMBfjIxxUccm7iyxvmK8lbd1mZsrxRXoZ
 O5GtGuGLH8mwjCH/E9JUQ2CSy8A09OqMlJBxv3Tf3zJgbsFeqzQifVwk1fUb2HjjPDSj
 5C7Sm+WCz31se7wqied/VPysCQy+O7xveewu3FxB2s9wEA8XJix5CPN3sHHHu+xZ/1fs
 oRh2V8fkH/E3GqQtjHAhvR/AKFMZs6ky3H3le16lCdpwaBGSV8B4Z54MyMPmdl2Ward4
 eywVEqlDWDoDVEnoOWd9Apg2olTb7GFYWKgW4AdmCiFOG1qtFqMWPX1kD3OgAYRi7oGJ
 bzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwtA7XXf/jmW76OxegLq4C6A/wcbkGUK+Xfjn7xbYXI=;
 b=VqkveBkouBroM0JUCbkZqYjKrd+EdSMERbt7ia/d6rMVrmYKr2Bf5bSK/7fT4/VNzT
 dExgZTs/f0ry9/nq9JYa1h07BmSid6/NJMDyurtyWb0GcIo5ql7Jkvv0VNPJ2gnklOmw
 Y73S6OaBoRjvm51DZHtdjZGT/2Wsbp3UxJFOIdlE9eyFK2Xah5rq5LDxgO/TC0mUfnu2
 PbLCJOtS/0iTtKGqMklP4S7F4Gf1aAu2Tln0HwG8I+E/crB4m5O7nOkNs4GvcnzlGazK
 HvoMaa1aPpY79PiVZ1Xm93CYBPrOJ0JqyimNBRaeQrFuFSfZN5q5V1jXazHoyzQWInOy
 V0mQ==
X-Gm-Message-State: AO0yUKUrhD167US/P3Qbog+9QIN8CLmQ67RwQzbfSuDtbl1NuLmtyHBy
 AN91WUKgCqZXtk/KKp7hiIy4Sw==
X-Google-Smtp-Source: AK7set8SRtdbvPFLexTFLkBldvG2BTYELCfAmQggEzxDFwJxH/18afC+WkgyJGtQfaLC6E529ZQ3Gg==
X-Received: by 2002:a17:906:68cd:b0:885:2eb5:68a2 with SMTP id
 y13-20020a17090668cd00b008852eb568a2mr15840227ejr.16.1676081473828; 
 Fri, 10 Feb 2023 18:11:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:28 +0200
Message-Id: <20230211021053.1078648-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 18/43] drm/msm/dpu: duplicate sc7180 catalog
 entries
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

Duplicate some of sc7180 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 074d82bacc28..b511e04347ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sc7280_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
 	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
+	.dspp_count = ARRAY_SIZE(sc7280_dspp),
+	.dspp = sc7280_dspp,
 	.mixer_count = ARRAY_SIZE(sc7280_lm),
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.39.1

