Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D736BFA6C
	for <lists+freedreno@lfdr.de>; Sat, 18 Mar 2023 14:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5BF10E297;
	Sat, 18 Mar 2023 13:43:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA38410E0C7
 for <freedreno@lists.freedesktop.org>; Sat, 18 Mar 2023 13:43:05 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f16so7770188ljq.10
 for <freedreno@lists.freedesktop.org>; Sat, 18 Mar 2023 06:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679146984;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vhpul7Rh3cRj+K0GuudZQvoFoP/xfXO3CkdZI/yylms=;
 b=j426X71mabGLe1BqLKd75IEf3x1OwnMZApw94sSoRjI9PIBDOgl5mmVj97uwADtRIo
 dPQ35g3OJujaMQjQn7viOa6Q7fmpMnQ/y5NCKb3hLvNau9VWW993qWBwOUW89sRwWHTB
 RrQQ/mhy3s7dFVDtwZap3HhE8vNBSXT72A3Y83fC026lvBC4bg3+0owmbu3Njq9nWxy7
 oa3wwhpAO6vi9u2HQ0NWCRRlydJOKZTTYJ5UyqV5YvtAQIrDrAid7V4U2aonZQlZRE7I
 qZemPNvc/UJ3Ghjgfsa73cPc1ni3yCKnhp+/HHHAdVb4vHCtrBcIP8or9yXx0OdCkHCJ
 Idgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679146984;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vhpul7Rh3cRj+K0GuudZQvoFoP/xfXO3CkdZI/yylms=;
 b=BTh767UVMlbjSi82+Amw3L7ypAdQBsGZHShDEvSqOvz/3kMGS0Ugn8v/Dhl6CAWlYk
 KNX4aw95ah4f0GnYNhS6dVkX0oU9TAC4eKxUYL+XT2KXDyACOwkSNuOJmkUeOsIR5Y3z
 iWiIgBeBpttuYAUq48YlzuU3fxPf68Gc86HgbPNhnC7Ge08iTLaZT3m6L7EI5gTkWv95
 wXi/eQIYlcPoBM/PntPmrISK25DlJZ7gBJ2yllgeTFJtcUwZ5GqSQ605D1O3aXafKb3K
 7+Zi/vFtE8Fv6bCGx5Ns/pR09/6TBzkyGctUuPCbdjBCInHkLA3I/zSYnECPcicTcufb
 0yDQ==
X-Gm-Message-State: AO0yUKWiQqCfGYvVGGfrgUIgJ62qmPauDqFDpB3vwO4jIBv3xwZ0UuEx
 AOwAQwgmkJ+V0+5qPwcweO7mGw==
X-Google-Smtp-Source: AK7set+IUKK9tzzPVlhNLzpxw7e6QXgi8Si9QxetIZhZPNuGjkdCxGjG1Aq+32VGmSOdt+mXVZYAnw==
X-Received: by 2002:a2e:9f44:0:b0:29b:767f:1421 with SMTP id
 v4-20020a2e9f44000000b0029b767f1421mr686870ljk.45.1679146984292; 
 Sat, 18 Mar 2023 06:43:04 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a2e9d82000000b0029a0b50a34asm888367ljj.36.2023.03.18.06.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 06:43:03 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 18 Mar 2023 14:42:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v6-7-70e13b1214fa@linaro.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1679146971; l=1730;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=F4fPirOHyMQPj35ost0pdi8esBWoDrjWNUljpExX+4U=;
 b=JQL4C8eZU9KdW70xgkVjmI9WYhpJRT9iemBV2gYY5kx+UgSGZNBtZXViYaamh9bBOeacUVPvECKx
 Hx3zj/elBCkSn/QqsBsTWvU8RPfp3CbFyjYsorJTAB5uakOYwph8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 7/9] drm/msm/dsi: Remove custom DSI config
 handling
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Now that the only user is handled by common code, remove the option to
specify custom handlers through match data.

This is effectively a revert of commit:
5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index f761973e4cba..baab79ab6e74 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -172,10 +172,10 @@ static int dsi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
+	{ .compatible = "qcom,mdss-dsi-ctrl" },
 
 	/* Deprecated, don't use */
-	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
+	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
 	{}
 };
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 9cfb9e91bfea..961689a255c4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -214,10 +214,6 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
 	int ret;
 	u32 major = 0, minor = 0;
 
-	cfg_hnd = device_get_match_data(dev);
-	if (cfg_hnd)
-		return cfg_hnd;
-
 	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
 	if (IS_ERR(ahb_clk)) {
 		pr_err("%s: cannot get interface clock\n", __func__);

-- 
2.39.2

