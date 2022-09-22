Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD435E6115
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 13:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC01510EAD7;
	Thu, 22 Sep 2022 11:30:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A282B10EACC
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 11:30:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k10so14155959lfm.4
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Nws0gXLCbPL6X9KoHrtPIHCoOBfOHKZJmB1WauEIFW4=;
 b=Cm4/iCt/4HPFS3Z+l8YA5dr9YKfLde/mEP/bKpfnK8EDu3fqU5JcxrXnl4xV51GOfw
 VBMgy9stx2JauU/DneaXoYQTVxEkn4rGkKYnQ+kLM5LnpmEKdUfuH82cnpaQrNrWSpO5
 DIUupurOi7wGq6ccpfWFxgZGIbBHgbkKfRfg7qp2p5ib72xs/mS69bMPaW4cVagHVG8i
 ebn2Kvfx+cehUdop8aAgjqZGgC1er3Mn8b4o31uIzZenXVNEnUkUSqShTmgvMK+Hly5u
 czKDoKeRri7PEPh9nSBgSd9IaiY83cqbdc9DzEVxHd9YvHFcaZ/o1LeNyngrOGqjCq49
 l9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Nws0gXLCbPL6X9KoHrtPIHCoOBfOHKZJmB1WauEIFW4=;
 b=QZZ4nAGECjsa49uFkFegD+mMZoM59IuEebnbxDG8SWazG2OVUUVkkXK4h3XciMn65K
 dGHsYk9mFnYf3QUKpMimNTGog5zF8rMpJ1H0AxIaFzDXfIrto+0ljb8R4YWu+KaA33O5
 NIThB7GTal+ICyUvRBHLAOtDSpWigeXDEcYxnimQpIEu51nlMJcRzxM+atAQuQSjB5e5
 FGpe3EWKb+VsYCfnQPdPvcwu1q2ec/i19pM6EevNsxvzZZKgQWgRjxaNtFzWZ6xderg2
 hyCMDGWdzdZjArmOnCfjkzarTk7BBZwuOBocilnqASYQIDzfkCvW8LD86NUAPGc4sjaX
 syYQ==
X-Gm-Message-State: ACrzQf3PCZcCo/70Ukxzp2xZx3RMcwsVDy7nawXs8jKE505Tz++vt54S
 7gTc6SqqXzMM4jlIKkI6vpMRFg==
X-Google-Smtp-Source: AMsMyM4fDheMKM/auohpHSKGpGB20FTYUF2o5KeB20hodt+Cz1FbODPDnrWnGrb7OXwt5uSew3/bzg==
X-Received: by 2002:a05:6512:310:b0:496:a0ca:1613 with SMTP id
 t16-20020a056512031000b00496a0ca1613mr1155642lfp.394.1663846222847; 
 Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 22 Sep 2022 14:30:16 +0300
Message-Id: <20220922113016.355188-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/5] drm/msm: mdss add support for SM8450
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e13c5c12b775..9e011762396b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -219,6 +219,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
 		break;
+	case DPU_HW_VER_810:
+		/* FIXME: merge with 6.0.0? */
+		/* TODO: 0x102e for LP_DDR4 */
+		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		break;
 	}
 
 	return ret;
@@ -447,6 +454,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

