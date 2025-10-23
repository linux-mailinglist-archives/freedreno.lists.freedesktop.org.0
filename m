Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAAC014D1
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2113010E906;
	Thu, 23 Oct 2025 13:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeSnbzm3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60E210E8C1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6MCiR007454
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=lOK2MHSzPbs
 iXffQZgfe3h7iHMKpferDHyC/TWrrCWc=; b=SeSnbzm3H/cw2/2r7DRnoRK4Fca
 8wMZ/x7Yn5bTTaQWB6FSKnvPEpQOe8975TE27FxJWBo6M7wty50N6dzKGmcv8ZGp
 lcyTCnVlYqSztuojTYb3TkboI20wlbPyHUffR2P1l4+7vaiKFSzNyvYls7liJy8P
 EaxgNdE6ANqb0dX+QZdu0Ck0K/LS2TdoASmlhts4SsTjKae5US6wR2BvPKBG1RQC
 iOoEkScnuv6C/yQ3+VxkxO6JhKKsTpxXDU9r+f5PrJBro2XuHleA99tRgx/ycs7V
 u5oP/SuNDE8OmO7Eb8IZTXl0NVfmkHTat05ViJyWVSAUmgUtmoW09Tgfv1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3447k4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-290ab8f5af6so3798235ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206129; x=1761810929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lOK2MHSzPbsiXffQZgfe3h7iHMKpferDHyC/TWrrCWc=;
 b=EujAAuykGk+wAfbm+Uo5h6W0WuGIguJN/w61jMrwT07DlwIr8mbyLCuu5vZHQr9iTW
 /Xh4MXg394Nd9zE9Lfe+UOdidB9g+wh8KMT0edm+1y74FfmwjGZ8Mw8ULuv6x2VqzZnw
 0rj/m94DPxPAnIlrhwTPWSQUdPJHVVWwZ0U00j96BjQ8fS7Vfi7aR5prrla2KqqHfrBq
 tF2bsxgYKUdJ3jx8+CazTAphkd1q9A506hJ6TSmgidESCKVc92TC8WHAN8ecgixmLRYn
 TtyjytLVV/sjgSlSQZVu6nV3XYmMKHCqPihnSEwB0zxpYuT+eSX2Av/cA5YI7skPWFVL
 G9IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHOAhbf0/RN1p6QCGJpESSS+k4zR0WSfJRfGxSvNhyOUuTYRNi92Bhfd7NH2CrpY23mt21IzHZlT8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQAFrsbie8Vwf8eX87lT3QQUecxhGYAVHLVRclSUvZCHRVVIng
 1Ko2eofdX00wOxAfB/QRsuL7hwxEvLLVcKu20tkxB1emY86KUL7XQUx6zMIdiqWKPReSa4pHQAj
 7+X8c2lR+ZqOwwUTLC5LfxbfJLsDPFB/hrm4kqc75vCQTZttAnZg4essGr5Aw1nACymHLoBc=
X-Gm-Gg: ASbGncsc3Qpo64ga4V514kJW3/4eVX0yH3UHPngyIgo1TdNf0nSHD9n5Qk92EGe5Tlb
 HUOB9L/4XeP0xkdLevxY/R8S3j/0ksJm81H7jAc87957rA7PjvqhFIlMwDX5E07ETl2SvMtBIgl
 0JUAYCmi8Lhfk81gS9XUlzSXuni7D3kaEcqLjIP9Bt3ByLts4wGNLhRVQqc9Xy6/XPQS0f34tYs
 9t8vR4u6PKkoKLqV0688BWESwBq3zJ0ApcMspgoRlCdnQRjw/Zo5GjH73ZbChJyLnYSwE8q17N5
 Et6DFdkdHJkyAmv81RppBVvCUiO8qqanDFbi6TUEtntQ14cQABRb2I3FbQGuidXUDldO635eJsM
 FSMKkmfiLqV6n8Zke3NEoJ/uK+DoN82nX2GMroghl+5RJPutfIQ==
X-Received: by 2002:a17:902:ef4d:b0:269:8f0c:4d86 with SMTP id
 d9443c01a7336-290cb66049dmr319783555ad.53.1761206129520; 
 Thu, 23 Oct 2025 00:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0QuIZ+LuMNR8q0/YAebLqe1CyU54eHt5XXlt5BpEpKdtKF5ztAJWGBj2FwTltk88GyCTZ8A==
X-Received: by 2002:a17:902:ef4d:b0:269:8f0c:4d86 with SMTP id
 d9443c01a7336-290cb66049dmr319783175ad.53.1761206129026; 
 Thu, 23 Oct 2025 00:55:29 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:28 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 04/12] drm/msm/mdss: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:53 +0800
Message-Id: <20251023075401.1148-5-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _R4TeNa7zpLsjMVbD_tEn_Nwwq778cwE
X-Proofpoint-ORIG-GUID: _R4TeNa7zpLsjMVbD_tEn_Nwwq778cwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX9SJUeFLqM0HM
 xMvhhOZKejp9FcgioL/9yYeUszyhf1slUNNovUppe9emzUWA0Mb5xC0IghFG6IHpPRINVDA/E34
 duysEN4wnWBCMaBWMqnIULMXfuIBOLpfLhUMYZU0/zCQRUvpFV3qmQqHGqBB++iqKD56K5PShdD
 MOlvfzVk9Db7twP/SRBnJfhZvRgb2zOSq6AHNWTuycDiKIKXB5KOKDBTVv6oGaENWp7juzoPBIK
 XSA/u7253Y4g1vwxW7JeDBjo49Mbhw1At1+Tq2+rClo0IeE7sDBwmA7ApIF/1wjdBNo13A98V/o
 zquPPVSiUD/f5I1Hw39hyNUztupp3DkC3tvWYh4U1rD2Y8GGo7rAJlf6ZLsMcwe294T3maM9YHn
 r1A1W0TnXB7zLyew+r94vqMtlpVtJw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f9df72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=fceNRhxQrX_EhRTcvHUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add mdss support for the Qualcomm Kaanapali platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/ubwc.h  |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c04..665751d2b999 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
+static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
+{
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
@@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_60(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
 };
 
 static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 1ed8b1b16bc9..0a4edfe3d96d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -52,6 +52,7 @@ struct qcom_ubwc_cfg_data {
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
 #define UBWC_5_0 0x50000000
+#define UBWC_6_0 0x60000000
 
 #if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
 const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
-- 
2.34.1

