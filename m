Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF03AD2D2D5
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 08:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B340910E818;
	Fri, 16 Jan 2026 07:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPXYdylT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGICwe1z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BF110E814
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMksKa3892842
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=; b=fPXYdylTR+08QfgM
 AKCjVblPIbGwHjlsNIzSCpT9j0JZc8m1a0PgbPuvcTNlz53dqk4pzfmwW0b+uAe9
 ACU1FuVqEHiYAow1Pmm19b2KyJJ2bfztQ4Dq8Kc34KJ4h++uWDhIsgf+MobwRUoR
 qidaMlvuLUu7UAvJsCu/WgA8MeHsJOvFDK6OAB8zRJo5kVYgRqPDHAsVlEIXYCea
 RQzUirZpmSWicyYOkdGlFD6eooBF6L77W2QnOfkf3Yd85KYYk98gg3QKB1My/UOG
 zXZ1hYhA1wDg/uAvNl2VLOr59ES1eBUM/vDMoL0TQqOk9akfL6QQ/X+6XOS5iiBY
 fHencw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b097as-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a5bc8c43so240899285a.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548470; x=1769153270;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=;
 b=kGICwe1zrA2XEQN9UWHUO369t2QMvkLV6Rkep2MrW38Y4MiMLaPqXydw+jD2RC+zCr
 JGTR6eUBKmI229KGJA48fKQNUpLzAwyBjo3GPjy4ouJR63nClAlpsAvMBSA1kLPeWZ7q
 v1BVguG0U64YxwT6O1cTSRLQ+DH40bkZy8+wZGZFcnItLT08BoaxYDBZIy/T+BwEQJqJ
 67DG7nof9gsxs9HjRct+Ak9+7p/lzrqhdWAtrBYxN69WZ2ZAZvUghd7jgcaW6jeYxWLi
 cLJ/6H7/95T8a/5HEazCWI/xhILY7rmCN3sqJo6Q8M1YAW9ry/99Tbvw2jPcPh7TJ6sa
 5IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548470; x=1769153270;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6SqJm6kDIAzcW4Krt4Gxm6Mk8UAj2OVBwGK7fUIbwoM=;
 b=vG83va7+0IycNHcUPtSAaZyYSg19N+/jhVkieG/nupEAz/S453r8yO6ayi8hDalfvF
 zObLiEBSKuEBuNND5pq/tYRYlfd7NqwHGXi7m6YS0RITbUP8JtBZ/4Fngn4VOSLXCqJy
 oS59AQUGLXD7h19tB92CgOVkOC36ALeVAgAf/J187tnqAMGRH2gcW7Wd5Mf+CBBCFVWn
 iyVzZOXmp+4p57Fo5YeJ/5LWh7kQpZLGKcUCxAQNLKd6vB57A1XaYV23VXLHPZlLigmN
 w3RKFE0nFvvuWx+cbWWvsx4D0VP+vlxaiNtb0hv/jrZFFE5UHJp0DB9qetbNPWO+onDJ
 xtAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2LrrSVpUSN+NwoKVrQcW16U6rHx692Htdk2cFR7WXpiaJt3ByWsf6Zmf6qgF4hUoAx3vCIJ+2S2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzctW0d9pJlWWWVIN9E1ru4/E3rIXbY7+lRWwuCVLAWom+ojK7L
 IDj2R+PdF0vjqhc3CneuU4uZmwv+LhRRDW4j7ZcrXNXX+uAgrKqcZgipKuESaRWoORZ7wsKwPmm
 Ju1HoZVwRP3lh9CNnuaM5MxQ3aR19Hc5FGzAzVGyh1QaNki5rTLXviL3yjA0NMU8PQfuS+bw=
X-Gm-Gg: AY/fxX5rULgjVRGSYqdeGEb4Sz9+kXeMPW/Mf6R2l6HDdvJn2bEMg9VIwtv2pTdvNwQ
 uI3VSoWcpMIZ99bZMFnspvuE/k3nt91wlgXD1JjdS0DWcKJHH1OX5nTTCPRyRgbcSLml2DqfNqS
 6iZHOZBi8f5r6oXALrBZeYWIa0yq1DKl2DPID1O8h6NlaV+MO9Lln9NepKdg5ApTKfGtxzspWnw
 WkUIfqybGQ8C26d85y8TtBUUCVr/RaDXyX0PhoIykQBVKauiJRznqGSGhoPW7v4QJa40ATQbRQW
 kxTecTqvh1F02hfcNoERVaULckXienutmjYEm62sU+kmdXO/tHrsDG4MfMe3rGqGWn7cetJOqBs
 K0OhokxWDNJfy8PKgxpq3EcIPlNogAHq9N7mFCxV5PoupLVGqubJBPR1gCcKN6bK5ZHNtc3JbQG
 KvwR+7XAF97EvlynWHeOh01Hw=
X-Received: by 2002:a05:620a:1911:b0:8bb:a27b:a111 with SMTP id
 af79cd13be357-8c6a65fcaacmr291175685a.0.1768548470505; 
 Thu, 15 Jan 2026 23:27:50 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8bb:a27b:a111 with SMTP id
 af79cd13be357-8c6a65fcaacmr291173485a.0.1768548470052; 
 Thu, 15 Jan 2026 23:27:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:41 +0200
Subject: [PATCH v3 7/9] media: iris: don't specify bank_spreading in the
 source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-7-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2351;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TBMGAChYXcRd+cqTtCm5cArhh1vfJdQRxPrvxfqxJi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehq/i+EvcJfs7BD2mcwrDQr+u6wFEl2Q+zxH
 Wsi59FtErqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoagAKCRCLPIo+Aiko
 1RKbB/9E+bGNVmGoLwsG7R05MoYhqO4MfVYSyooQgbTCN2LCKtGri3Yc9J3s/J+5jF0yxyltaKl
 H8HiJ2cgXNl6XfSJ8TAyRPKFUep8Q97W62/e+ENrkIyIjs24cpnb98GLBndH99YvYu9d67jH1U6
 kCQkw/+5SXh7vzrQARfOzIg+4q9rWWQw8OULKJEPzgWFcDQ9EEF05fOnZmn5Zb8l34IBivqU+MO
 5gj54tPrndMakA7aa/Jrc+0OFEJazd7iolQOb5G0brSQ5eLfGBb2Wn/9XE3bz845LpfH1IRrGcz
 iQ2YSw6COpzsLmAckHmEDJ10ZuFegsm4Z8IYO+70spc5cWz8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: VseipJH2KdbTaVRX0loGdDLjwCpyE76q
X-Proofpoint-ORIG-GUID: VseipJH2KdbTaVRX0loGdDLjwCpyE76q
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=6969e877 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXzULLlsWpgpjj
 5vZRhrn0yOBMdElqvVJQvs9/cbjAEirnkeqDXozyOlM4jT7lNV4uAwfQTDfq5G1NBllnRSdeAbf
 pQwVtgHI79IPcSDK+0ujuKQGoqWFK3+SHYjAgHSXt4sVkLEb8BIhot3C9XalUZdFm0JY2PxhPK1
 VxJO12GmkwxMRlfW+6VH7EZDQKkGzX7T6R5Wkm96V6x8N2VSVq+/iMT/8+woV3ZACFv/ejc5uLa
 /9yiYgtWvyxqviVaM9ez7O/8s16mJp7NuY7yu9fk1nEhpO6TbOEfvc5LVttYw41qHYhy5CBaV7j
 piX9boyWYEsGazNxuYLouNt63crurk6Lk8N6U5jhOV4hh41023+CXsZ1ZTsKbOUGX3IyyXwSACZ
 ExPeL45nqG04GgpBD9b04m41EIIipuBvO4OIDwhr8JTfFyRzZCeA6SJzE7F93YPtClrMnE2rlEB
 LuF5herNIpLDejwDXjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4d9efdbb43b..a49394b92768 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -200,7 +200,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = qcom_ubwc_bank_spread(ubwc);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3

