Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DACB54B36
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 13:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E5C10EC1A;
	Fri, 12 Sep 2025 11:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNO5V6jG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4773110EC1C
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDLQ018545
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BTpiCmS+aOzJx4voYgNQ5Cttmm2gaySgd22IqIIsiDM=; b=DNO5V6jGRZFKjJ8G
 REDzWZ09eSSOriS7/JdVLBtoVn88r/WwuvHOkJA585P0y+e+z6ZEmljbP8DPV0Ot
 o/4qspZ9s3ZSKCaPymBFcLTi5LRGDM9EEKW4/yFUWPlJhbFJDMAKygzWKZNVNhwT
 0Oqgd9aEybGGihqlVvXGcaoR7UIxquPwRKIogt/SWYk28yGsDGlTo9plUkqbD647
 eLKyCp5pwaZkngbD8X9x1j/3U2PD3CmE9PRPKCgFEVIWXZfTNaOGBW5wUqj0O0WO
 m4jqiI906up6sipn5yO8wnYIXFChb4ZV1GatcVGjRCHO3j+8kMS6aP1yQMsDMzWM
 j81xow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8akgb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:39:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4d01b30e8dso483470a12.2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 04:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677190; x=1758281990;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BTpiCmS+aOzJx4voYgNQ5Cttmm2gaySgd22IqIIsiDM=;
 b=cHdCeWRulJJ+5prSyCaqJIQXlDSoUMFTbmIR5vi4lqHM6XsDlIsqzCTLsYzxTSCaUQ
 9E6X3SZNQpasTg4IqFnadBQxPsc5KhBpp7t4FxK5Vz+PrPW4FZDWJtVsD27SRP/J1tt9
 YCg9tcm6gvLKkncFU8fln+iRm3P8xRTo24pz5nBcyqfQ8Hik3M4KyAy7y24L9QffXz29
 kjhm4isTH2la6q5MgwANsdA4TQVpl9rqqflffCsj+wHRakqcOI8gb4cTTkrhxozbN0Jx
 dWvYMaJdtvtwWVIAqf3gpUfEoHdNvpIgdpZjdelbrp/z+0WiAcT89+ND9G3NcUQOu3++
 +mQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJkjwKI511qpyq0fj6WC0h4OFRHE9yBYP6guTjQiW6iM3ux/MaY3FbojR9bl2prlpo+74mlTqo83s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYdMvwanPAIF15Nd74e7XuMxSc4eO4CFXUxNynHvi8BQWPcI9h
 CzMdHM2rBi4eUyk6OjzE9FTsfs9C9jW78yZTa20Ce0jmDw4OlYIqUuHX9YIlGNqA5rR5fZWyeRO
 563oSDzcszUVAeJgF0AxbjunN6YHeTIotFE+NPLnLpZv7zKcB5RwFelBbuvq+iWYfYBxZn1w=
X-Gm-Gg: ASbGncv3oeDXJ/OZ6N/X4bpgaLTRAQagE6jqIVeQeVF5ITTd3/ptmd7vlWZrDe/OegU
 /CWsbdLpPyevJkQpkVm60KEz6Nf6dwQcSHHl19uZ9f/tUiGj2tuwE6rZw6qp1RmbnM6KxbQ6o5N
 gm+Q2lYLflIKiar+teXdttG76jA16j2XN2ZUNQ8GM783SF6DjDuW9buK/2OVOnVUXTd+/Q0tYdf
 AblOFNNnx7NjcVD5q8NhTdtsK0Lj+HZ/bCgzm+Mmh7ctCwWlWYQx0XvnCmZtm4INHF9v/fGciuv
 FMA3lnNhEnR07qJb4BsOw87/CI2sKaRraVViGNgnIsCexNwxyYMwHaBESFASTwblNv2anObK7Oj
 S7chydcZZsZ02S1DWymy0xmfoH9EfpwOFPgukodyE8fA1+LXukI/tgNAM
X-Received: by 2002:a05:6a00:2393:b0:772:46b5:cc7d with SMTP id
 d2e1a72fcca58-77611f9a1b2mr1873637b3a.0.1757677189860; 
 Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELFvLrg5kPis7j53nKtzrsgs2TLYs/gVlDCE8CvFTY2T8sgBM9bn50GM9tw577E4AAn+xTlg==
X-Received: by 2002:a05:6a00:2393:b0:772:46b5:cc7d with SMTP id
 d2e1a72fcca58-77611f9a1b2mr1873608b3a.0.1757677189294; 
 Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c45e34sm5278760b3a.91.2025.09.12.04.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:39:49 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:39:17 +0800
Subject: [PATCH 2/2] drm/msm/dp: Add DisplayPort support for SM6150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-add-dp-controller-support-for-sm6150-v1-2-02b34b7b719d@oss.qualcomm.com>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757677172; l=1260;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=zsw44VeIS8tPBhNLX2AbLAqsAEVNVFzksn5mBiXdC5s=;
 b=Wiv2VU+0hSjsT91pK/MSZfPi0gQD+MHY26Tlb8S5d2LDXH8c2j+H0K85uR4jH147bspO16+mg
 nDrmZ/85KDfD06aYmXxXgE14luXHDfN2yEFInlheFlMfGQaj7U0A/+I
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c40686 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zkzxiq2xDrpwyWBV8T8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: _gp22wYSY33FOk41eykx-pN5sBs8MSRn
X-Proofpoint-ORIG-GUID: _gp22wYSY33FOk41eykx-pN5sBs8MSRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXxOJwU5kRqxhA
 0k7UbwU5LaMvAq5Bijc7wuiOSjgx5caZURonluirKev76p98ZqZYGfbou0iQSFDO1NV+6fWU9fm
 RDAVrMLY73/Y4Zy+onQ1clW6zxMc0MVARZmPBlPmXxG0JxEauNRxtSeSb4tCVO9aCmKl0hZdn0O
 v+RmVwFRsOh8uROBtzdzjuPTFNVqYU0D2orvpKpZ8a/Gef2InULip69tMmeYLwa8ic6qPv+qaLF
 f/XoG5Oy5rEJNBSdyrxL2Thkzi8ae1R/XIqjYlPN3jQhGe76eKBMUVijYH31A/yZpJIbwUUJJZt
 TnR4kzQJKj9NOb6wW2SXr8MrTiI/JxA85+piMyDEjbfOE5ix7BEmnX3WpQFA3M1H/re7ed9Qlkw
 yyiRDbxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

Add support for SM6150 DisplayPort controller, which shares base offset
and configuration with SC7180. While SM6150 lacks some SC7180 features
(e.g. HBR3, MST), current msm_dp_desc_sc7180 data is sufficient. Listing it
explicitly ensures future compatibility.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
+	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.34.1

