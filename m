Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C54F6BC9DD
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 09:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1880C10EC61;
	Thu, 16 Mar 2023 08:51:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55ED10EC5E
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 08:51:23 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id j11so1324796lfg.13
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 01:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vhpul7Rh3cRj+K0GuudZQvoFoP/xfXO3CkdZI/yylms=;
 b=WGZZcM6WcKH5wJ1+O0BxrYdydlbnmi9n3vrDnUzyoEKCuj1f5n+zMKOcvadpSek/hA
 vGL63abAMSP5iVzvDL26UfoC6spiGrsmj4uybj2x0vMaUWZ/I+xvRhYjlShoy/fzsEPr
 ExY5DeTOQUtgCCQieW7i3WDOwt3BDmtkbhEew5FUNqd6JHTRKaBuxqVXBqHRshHtnPFE
 LWIRg42QHEd8i3PwNRacAkcOWKDzWiYTPUXm1Mf+12UOmEcrUcdvU92UbyAKvwvRSsld
 PEbfiR7VVopFzPxwdkxlCg0xm/gyQbUKM+5wUfTZOPqv9U/uvWt0I6AWAcDlv/PlftJ/
 ABlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vhpul7Rh3cRj+K0GuudZQvoFoP/xfXO3CkdZI/yylms=;
 b=2dyOEWwFcZLkAqQi4bCHP8DS3juZFD/qhXwXP910Cq0DpvVmUQLyGZtxiwl9vAd7cV
 /fYtH18W8HPczSebi9ysHSzP7iEb4SSLjWx3ZM/74tWUfBTHvgEmyn+9nlLeveEsZwJc
 9YmabF46h0AYL6DaRDeMe6O5MEOvnJGm+rRx+4d5DQ2UD530nDKr6aoL2KLVQC/A4cCa
 Xzwv3/HZTaF6zTWQBo0josLx1lQG6GQmHtxo4fIgVhZDy5IKgjxF+/VqB8f2zwwZZZKy
 A9BVSaC8qqRCo7JWn0OEQrjbF0AFQYelSF2eXee9tgPrYOLa1xJUp4ZwHcR809pJRl72
 BFWA==
X-Gm-Message-State: AO0yUKW3C0ErmAD+sOVQyxrh4dETE/cPatvddzAatnp7f9Omes/t8nva
 F5lmoX9PSOem9aB7b/IJX/v/9tNTcQQKgMBp1kU=
X-Google-Smtp-Source: AK7set87BbSQ9sVx5mok5TOPRcaSbaLWFERH8AcVnQ7sqzqEPcroAy6dGZYHYxN2VaputEjUtWwJAg==
X-Received: by 2002:a05:6512:2804:b0:4d8:86c1:4771 with SMTP id
 cf4-20020a056512280400b004d886c14771mr2570389lfb.6.1678956681755; 
 Thu, 16 Mar 2023 01:51:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:51:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 16 Mar 2023 09:51:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-7-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=1730;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=F4fPirOHyMQPj35ost0pdi8esBWoDrjWNUljpExX+4U=;
 b=FL/r6rvLYNSYDNfxE3wvGBoxEwQ/m3wkv470pmFuq27VtanvQIIOf7xBKwiqIZyhM9Ok3ofPqSOM
 qwkknPNnDy8cfZ9kpkusgCrzafDZeyJpNEQ/i7+w1iFvb6rc6Td0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 07/10] drm/msm/dsi: Remove custom DSI config
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

