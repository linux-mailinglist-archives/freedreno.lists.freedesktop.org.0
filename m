Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E2E629A56
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 14:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC10510E3E2;
	Tue, 15 Nov 2022 13:31:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA8210E3DC
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:25 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id f18so3014157ejz.5
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
 b=nilNDcO+Dvh/GNaQwv21UPwBlAYUKgxhJWDnVkZyC1w8s7CF6k2t4w/0Oe7Zc+QTKM
 OmSEcOwqrjlJBLTueyUKYQLCg9VlfK9fcIWjt49uHPUrsBcMuxsZxWJIrCHVYakcoBRN
 q/Vrfcu+vF+s1p7v2rsRo6IA6PK78R6L/XRw7ufmKqIpj/mP0hO7JtSR7ICUW5T2RD9P
 UQN23qjsr1Z3qmHuIlULhQBDbi9cUTsLGZ830607AXHX5XutJ9q+nRbLk5gt6vqjeeIO
 gM/vkwpe0xLTKDdr2PFiyDdcjH/ENbqRcg5Gn651+Nse0JxNccOfiIQb8WTm8Vfl8jyp
 Nsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
 b=Ou73J5jsOBzumDbd2rpDbVGQIYm1OcSKeR6fElDyLMvRiYJS/3vxNXW9KxtXfNP3RR
 ol4FR9t8nINvxH9Qkb7YTh0/rT8VFfwpvQBQmYkrx3hMhuWB0bRwE3/7QNghaRvavFhj
 XVQmbJt15ehNAKf6fRvIv9AXQmJ8ILsK46tIys3J0m27oNRiOeoRgE2Ixdfn0L1/P09P
 2k+qSMJtvKSkHWJj+MyuaNrsnslB79lgVNtb03jMtTn4h6OyT7ee2CpkqdIn2xQgPxCa
 1hH/qh+M20skXevNiO7hN2ZsHatgR4MhdlrLVS/YlfK3Ygz1bBuDWTHTO1m2tupluyRx
 LWtg==
X-Gm-Message-State: ANoB5pmG8NX0kezjW2UwzH3DRjTYLuQxS92ALj7O+rU6g9KcQmqR6ohG
 HOHbvgSJAlJddPxm8zA0SCPVmg==
X-Google-Smtp-Source: AA0mqf58K0nPUdH2ACUFBZHTyMf/y7B8YjJoerLelKr40QVkELpRuDuR1ymQIBx+Ahyxm2R6iSD2Ag==
X-Received: by 2002:a17:907:20a5:b0:78c:9b67:6655 with SMTP id
 pw5-20020a17090720a500b0078c9b676655mr13338211ejb.90.1668519084603; 
 Tue, 15 Nov 2022 05:31:24 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:24 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Date: Tue, 15 Nov 2022 14:30:59 +0100
Message-Id: <20221115133105.980877-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 06/12] drm/msm: Add support for SM8350
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
subsystem unit used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index a2264fb517a1..39746b972cdd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		/* UBWC_2_0 */
 		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
+	case DPU_HW_VER_700:
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
+		break;
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
@@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
-- 
2.34.1

