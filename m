Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF18CBCFBB
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FC010E3A2;
	Mon, 15 Dec 2025 08:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiUHDZ+3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIhVdAW9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB1210E3A2
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF8MpYI2483805
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=T5hormO1Tzm
 iMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=; b=GiUHDZ+3mRxBGRkuHWnuU4KxTRD
 BRMMKpl+1xHry6oADWGSvdPkZvY+rD1NVwqvKuZTscyCSpqC5xzOLNewgDYP6YGy
 iQ61YS19nKRVoG12kW4M0mqs9caEtkDSLBDb9ebB/OAAHNzulM81ShFkmb9NG/gt
 0xvcMsDj9BArDuTlawLA+3w84pP4koFgHsqdE2qB5zmkLa+SsjkES55fSvh4fbi7
 qEVi1Fx7a6i4RwFIAkpzx5HkBhFD+v6eLJkUFK4n8OSY9n3CenOAeOEBCuQ3wQvP
 sh6hzVTwH8iXJrkfWwqGmKowSWerkizyQR7S+iBsnRw3Ysich7vchD9iTNg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6ku49-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee27e24711so60701861cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788029; x=1766392829;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5hormO1TzmiMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=;
 b=JIhVdAW9qa46yF0fCbHm1YZIE8id4NSanETOic/jUcvtuS+u9z6wB/19KBBJRp58yx
 eN5RryL1hv2w8G74tHsPnLVGYDa1Dpt9nw2S1xGiovm958B3hcs+3ehmkoN0ZmaU3Pnr
 +zWguvoJLSt2ILZfBXQZ+yUDtfWw2SPFSOIcjCrZgqQdZ7Mcf4Oou0Xs3/TSGO3Pz0tR
 +TLG7muJaRtz2mp82vs9cPuKwzc94APrH0Ix3ysnI5pLHepuaIXOYlrPJfLJQL4gzAvc
 ZvdxXI26Dk4neKmfcF+CCEhCR4B+IKVkVmQ07hQM+8jvhk+S37/FSpEWMHS4cfQNWZSV
 htgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788029; x=1766392829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T5hormO1TzmiMptirNKEBXdbWFDw2mJd8ZK7F/ndOPI=;
 b=R1lBQITpez41hoAA8W5DRAZPzD7yMcXqWmcq2hZGVhaHG83ieAKpBFZ9FaiNO/bnXi
 nNxGLLI2qTw0rZ+XP1afLiOdW7ukiH4g3QpAlU2zMkIfkr5WdWYVE7SAsBi6zrZjWfqR
 m5nk1mC9rdkA5cKwellfBVCDCXzBcrf1zjWNFBRw9XMofN0W8RPBbiE3fchzB1VdBUQN
 0V3s8JGT1LYiRSuVEWeOBHKNH/qnCaBNoloIX2iBEo3aig0coh4gfPJ49SaFPMyaNHDv
 4xFLe25jcN7G3YcNjPVRdibi2iVorACykU9ku5F5PtwYolkZICPbK5jipfVrXxD/5HOR
 vk3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+QokO3MXHFM3ys0Q2d9GYjtpHLGn4isjxjmGD1W6rpL72tkL4xHJYo5weIQt5UdcTaLN3srS8SoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/enikj9NH/AnnAZnzlq/hnLpPQLuOTUtet17e8P66aeRzFjdj
 dpav7uQHch9Y3s2+P6Q86al7ig5adRjLyEMlqEWk27tv9MxIDanx/xMmnKG9RfANuaz5VuyIC0u
 y/Sol6gXyxsBKxZv9cl92sJmkfPhTKVy0W1TEIBA4TE2+iCZ6SJKI3sqsrQ2zgkfGBbaZlnw=
X-Gm-Gg: AY/fxX7usGGuZjMm4vI1q4IZ94keP6ceKElJ2IQJKY+6aZoZbPqh0ZgGAMVYnF3RWjy
 fhWb/6QIxcvjnzsdiBwyvwLkVhBLH6rdJ3sM+9DIyv/xKe2PZznABOGtKuPX3cUloBM4eXCy8W4
 6gQqZjsPIjtirbCsJ7kfN0i4ZSydVqSz+K4+qzLLwvx5SXnttZVj70oMNetumZ5UnggEalsqOwS
 CI58tAk5bYfkoztcrVHe23uESxm+cM2YvuwKK5OrYKwxZP9uxf8F04ftJ4DdZtPnNUWilB6v7SX
 HBGl6uOHnLsELVJgD2AGPv/RGH6iESh4QllqBiGNMpMF+LadQx25akLSeJFu213jbA15n4BYtlt
 ybfslUVIl8WsHUQbry2KXg9iwI2/IhZsgPNOsbbZlATEqJS0fsKodew6Rd2oeRMLCPak=
X-Received: by 2002:a05:622a:4c8d:b0:4b7:a680:2111 with SMTP id
 d75a77b69052e-4f1d049f54bmr115502561cf.8.1765788028601; 
 Mon, 15 Dec 2025 00:40:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE21JM+j2xLBWwUMji/MxEsoKpff5aogjPA7lsLdjIGqhs/FRgyL+lLOBLkdvbMHjyrb9e34Q==
X-Received: by 2002:a05:622a:4c8d:b0:4b7:a680:2111 with SMTP id
 d75a77b69052e-4f1d049f54bmr115502311cf.8.1765788028170; 
 Mon, 15 Dec 2025 00:40:28 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:27 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:48 +0800
Message-Id: <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693fc97d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sRsiwY7EFmHr75jNHr8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: FKbOddUmw6dpSx57V9iYA9sfvar6cJWy
X-Proofpoint-GUID: FKbOddUmw6dpSx57V9iYA9sfvar6cJWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX1Fza4bA1wx0x
 oq/KYo1BB4kj1tjZYNDFYZaUoQtahqpVWqxjSviWTggZdXaTBl/QYp19PXZF0jqGB7+thVKIYvy
 J0GpAK7+XfYrQ6dAz76SPrC5ZAsTwRFgFrnLOqfKYxJNRnZTC2hctB2Br+XJhDRUl4BiKEby4on
 M2oKwmDRXUW8PLfArLt042VhtE0lK/fZbLTRyGR+kpUIriD2rNx+IySZ9zVzYkLC/6SR49QGA3O
 mtUfqYuC8crZImvgkf0UZGVIoB0T0ibHiqYFze7Pz+2CQG+HZczNHJ2hXJ6u8LevaDlnCydN4Yl
 ygxB6dNAxMHdWeUqazM6M3jkm/ui1wlPc+xPXDDWdGx/Del9F06LoebeBWiLWlgfq+jqRw6+HG2
 75j4Xlag3NhQ9Tjs99zTzPBfNOKOMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071
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

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..cd330870a6fb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 
-	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	if (data->ubwc_dec_version == UBWC_5_0)
+		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	else
+		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
 }
 
@@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_5_0:
 		msm_mdss_setup_ubwc_dec_50(msm_mdss);
 		break;
+	case UBWC_6_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
 };
 
 static const struct of_device_id mdss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
-- 
2.34.1

