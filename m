Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FE9D1A738
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F78210E515;
	Tue, 13 Jan 2026 16:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff/bs0zO";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDI+TEEZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FA910E523
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DFsMBW3727091
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=; b=Ff/bs0zOvQrVqQDm
 ou3W1WkFr1Tnln1wod1rqtq7kzJ1TgxXTTtnqi2x5NYwXkbQzcuXsiTihxIY0eFO
 5tHoRzDe5TkGrvUmn/VkA7qn6HpClqo+t45pOF08jIzN6A66pUPYKJerRGNNlKZ2
 APcRUFOa3HjH45T2rgdcnm/ORfXCq2+7gJWCIiKWv0enLnfVwZRoh6wMr2tyAw2M
 d16swDxggPDlkKyuaOkNDJpS0bBKK4YAKOck2emZhF25h8RFV3GqATAalvHKWSw4
 6pewj+blt4iyeylJB/y/21Ozl3FkE7DQkjIrU1pQ+SwaFKpyHgWevYjvJy1PG44D
 /T4L8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu1pgh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8ba026720eeso656247885a.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323456; x=1768928256;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=;
 b=gDI+TEEZcp+goVUBVjhWyS3FnRWRsiz9+UNjY3H/ap2AqpfSVmEBzXEn1ZmG2qsf1H
 Xr1Hbyx/APxDRww+3wFeSyzVbtWsm7DrMmPkrByGrXc5wha2PUgX+Wwjzl8gPG1geeRH
 4bMzbCVCHkpznhYVfaawwOKHwxTADhiOCCHouYMxjjwmCY/rmsBFhHvyCd+INu5Lia/4
 cN8sAk29SsINm5nVnZfCK0xydbqHKwgUjnzO7S8Y1fAxUzTd6UQaaHgW7wgatWuc0Ho5
 G7GBc/P7rkzvvamnlUgAerbpH0zNFlq5/St2LjTzBmxH9rQmDyG38UaXvwasizZ7juK/
 oupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323456; x=1768928256;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=;
 b=IT/8nIVdHXadrHbgEPjE1y10kOaFOxZ5oR49m88NZrMy2Y0QVjSAxvC/iH2gJoBl3C
 IHQ+V8iq0hxo/LpkEir1ZBKyH6bN/8EVTz9pjEI2iU7BVhMI4vqZJDZblwv4o0kxRxzs
 8P27GCOuVHSLBveEJYMFekiDcC2yQRTPdrmAqhFjzInhTIw9UpHBzLgliJUwqu8U6jtG
 bYvNz/3DmiuVmWs9wSxlL18bpW0jvwv1C5Pj/ofZ9KsZO7RYT3AP7NH08Z0yIfxk0FWi
 oEf29AInnKBvaVgqFpgVKSGf+PGb0UNWX2+/R7pKbuvmlHhijmLXK5707Tm5w2CtgW9q
 qjpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdwaBoPRABFDh0EcznhVabr3yaxUUkQq/jq2+fzXT6H93hx6UkhMSjkniup5YEr0PKVzMV7r9NHlo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzS7yOhROBNgSb93X8mxNhJF2ooHrfytc3BdS9EVCCAuNB4Pw+K
 XmUHWu5ntRY8FeR7JAiHhWkwhUzN1dxTudO42JFd2JPfXFvfeKtGtb931xlzX8N58g4wB+x9Lxn
 EGG4u/o3N+hI9+uyZShedw3b7t04MmGt0mVOQ9Hjp8nEVRUEMpReU6Vx0VbxU3qDnyeTBHrs=
X-Gm-Gg: AY/fxX7GtfuiMvQSgXEPbbrRVFWEraP2eo7FACNGFRnlKDWTIy5QIwO0colmY9YEIbY
 4TpzGkznBFFCn9/yqKa7QVu8gJXYEOy6XbhzPTLtAfAtK4Jv0rwzdfGbmyA0e6Tvc8HsyXEpj6c
 DkDFj7yK0gni/Dehseb6WI9AgmWv3KQqhMHBM8SVdv2MmyX0EfXlGzM/wdQWB4tksN6kmyYT63k
 wOih9/ilWBrz/hQgslyREJb8pVqgBWRpip7bieBfkagxxM59No/pM6pe1UCQbdKd3be88KTv6xb
 NNfptkUvyHJdfPkkDSL8awWv9qyRKdCoKlJ2yFnefA4EFdiwqzicuM4YrdfGEjbvzyn4ql4AB85
 ZXZBmLfdTZd3S0EXTnz8UllZt1/SEvi+VVCnBpVQaZwWKNE5qARG1rTgdXCn9fJciYubhykIytm
 SgfDVzQauSmkE5NEvybW3unhQ=
X-Received: by 2002:a05:620a:8ca:b0:8c5:2ce6:dd1 with SMTP id
 af79cd13be357-8c52ce611b4mr133425285a.6.1768323455472; 
 Tue, 13 Jan 2026 08:57:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmMk/PsOtdj2Lo9u4l/QM6jZZRflGFrd3qJ+h6uRlPWq8U3aO6YVpu8Fjn1QQ3S+KyIwtYvw==
X-Received: by 2002:a05:620a:8ca:b0:8c5:2ce6:dd1 with SMTP id
 af79cd13be357-8c52ce611b4mr133421385a.6.1768323455017; 
 Tue, 13 Jan 2026 08:57:35 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:20 +0200
Subject: [PATCH v2 05/11] media: iris: don't specify highest_bank_bit in
 the source code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-5-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=21FS6ewfuqdGS3uFDKer0oeNOooIoTgNJcaXGQoNyaE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZaZfG6U6/vWplOWVLdfkQt3qN896XahvD7t695FAj/V
 G3bafuyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATyZrP/s9wQh37w3yRfxFO
 x7+FPapcxvtywb7TnI9yf4l+V5GvTxYPuhQRey7gQMrhyE+xFuXJX3NuX4u5ZblSbFWkwlOh7yL
 Cqns/7I8/f+34DkNZkbnsaktsgsO9BLKu+RW5dzS1yB74cE5y14+1r6o3zEhlCHySp6/Qy/XtrI
 2/VdjZ2f90N7ltrv9e/fmsoNyRUq3SmRvny78SfrZaIf7yeTsv8zQNhxzLbVqq52VUQsrn+++8n
 RvzP+xM4TVvG62wq3Zz3iowXE2b1SD1J6zH5XKYVVjjosdBn1gz2JQn3TgS9W59X6JPHbu2ftIL
 5tvW177qFH70eW2x09hG7KOASIRs/cw6OfbHmvmxPE5PAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uXHz2Z-qW2kDLL4UXsLBjH4RiKiRD_MA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXwvPZrJNs3RWt
 pwaNGuUDlDAGqGwtsBvqJsKwyDqVNBbCNJhztywU2ZhaJPYxDgU30bvWHb2Np0PO+CUxmnwJmej
 OyY1dJprWBAGn14maWlOMxFH6oPFcnjyV4XfROOXPpFvAfJj2O0FD37liT8LNBeGjHRe3NqLDBR
 G2u+QvYzp2S0iYePotS7YthEXBArKQ2u9QpHXsKltLJpOc+MyUest9ihfH6jVbJQ5JicO5gmvuK
 E7p9P+Tw50AlS5YVUEpPLKjGzWyZxTRkeTnuMdk8C001I70SP84JWDefDn6IKiNlI7IGFv1MQ9k
 qOitAl4qa4pgzM10g+MT9EOUvM5iyPPMucw2lQdE5YSkuEJ4F/nPGUUEbsdv37IHhrSZvL4qyQy
 kpBVXyTQT0gwz1OKK1YsoUw3hail6FfFYu1G5s9tVhPFcGIglgFBx+h3FnF3GgqPDvBzmYFMamG
 zHsfuvwF65w7t4AGQ2w==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=69667980 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uXHz2Z-qW2kDLL4UXsLBjH4RiKiRD_MA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 878e61aa77c3..a4e60e9d32a4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3c5f3f68b722..8421711dbe60 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c70cfc2fc553..5ae996d19ffd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3

