Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE1D2D298
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 08:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8987010E80A;
	Fri, 16 Jan 2026 07:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuPrK0fT";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/i1hhnE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF8F10E809
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMksKU3892842
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=; b=EuPrK0fT/9XHNzF+
 ZB8VSizQXr5hyryxGJO8uyWVCTZoKvP7tlY7cP8lplXOAqmOl4dpWVI5SzMz7MSx
 Bd3bYrnp/ezRalPooys/OHD1bH5VxZBTJbzGP6V1kvIDh2WWO8y3ogjAARIu4ECg
 owGi41e1wcWW3SoK17Ngn06+G9mTqgQOIS7+/qlzti9QxAdYhN+MDMbxf94tGeqi
 fd3OsxNi3ZLX9GbipC3sBRPssG/sutsg3f2LMuS7C/zqrVL5renb48JL4JR3g5bv
 KVLUaKZiCJor8NDuS8BrX3pAjaX7wViBtw3MxmKPypTCbCWt0j0fY5690VbDc4xp
 0FTe1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b0979e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b22ab98226so798084585a.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548462; x=1769153262;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=;
 b=c/i1hhnEUF1V2S3f+xMQF64eQr86OZF+jr8Ys5chOZqIFlTDQnL6UYlTt7whjzsDTV
 FpuLa1Qk4PCgoWrBRi03VoilJNfc4xRAp9eYErWLMwnXzeo29noGYbxoCLc568oZijCB
 sxb+VoiNd7ag46+b7u5un2kn+mjvci6MHWv+4G5gyMSV78p8QHaqp/xodj7mkfECHum0
 wg2jM09LsB6PhOWMacsvNwu8RdlQxPSi7nbxUotRmT7+HM3HGSS5fBXHnDiUVluyFNF3
 IGy8ocix9EofeO5bJYp5fCYbx6n+ICr7QRKWLELSZlnnJ9Zx7BAgZqRa+mmjyUrF8rHk
 hMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548462; x=1769153262;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=;
 b=xLjULLwMMuu/IoP0EbNdWMlr48GYDjsgM2kEOQSVTNn/EKIeJJpQfA4Tm93MCkZwe/
 DmNByl4Ds887+qSHZ0W3baPrUlo5QKQ2ey8kQBBFpGgTLgnK0eKp2Dx1FiEA5V/4Ftl9
 +UVnmx07zIAX6JsuxeygZ6+LPM+S3krUuU7FGfjuhpXwcs6c1vwHRnnltAKqcO7Idtlq
 OPPO4Ni25pDowvBGJ7cZap41NnwmBmIM1smRleklB+mwIG/WzIJXBEHKNbzSKFjKoX1f
 kDbllbQWs2UFZDeqSFIyvGe091HPWixL4Ncxqk/Z3TYbmvcawnJXlarM4Xq810LHpnnO
 zVzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfcg5D61AH/7dne0tcPyp4g1+pgpv31xSaCS/fU9Xh7C4EoruTAomV16T5Atpd1edwfCtGJJniAO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK8BoHyuGZoKMiSL7sJliC/PxZfn9C/kSPoB297nrYxxNhDqmq
 fUWViJd2jmefHhQeAe6uxSL4iAF0C8nI/t1znz4tdvSLHxoF3M8M5sUa8zaYDWPvQTeoj0QO6yo
 IDlT047Rgw3EyFniSrM1vLsfuFmA1PK0qoY85bpKhBu647sWt7mYZj4bW7AU6Br7wCWt/iOg=
X-Gm-Gg: AY/fxX75yPbspguXz4alj8BBEqWdr3G6irRyX7GItTDzpvnGDmd/1HTpdVNGB+AaECu
 zUrpjRoGIf6zk/YL1nkC2MhozUhyFeNL4dzRm/PDlR33czCZr+6debtSgw7RfX8QmAG+uh2/7uM
 exG6xifkrV8U/n3q2t1NK/H0//Tcrur/yGZj8Zf5J4V3TemdNBYQrZSYri/jXeks1sQTqL2qlOX
 X9cAASQrkFmYcI+x4mYrHDAiDmcLO0qQ1rcBQdnMnndXtyTjnntsPtpsxSMIMBg8gTrJ0vnMZPZ
 vGeqeYrVgF/Q3wvPZkaxd7pTLSN1WVuvePNnlo59JHjh7sYXVbFIJhDHnuvP+uZHhkqhY+OHN2B
 YghjSbmJs6azPcPhPqpqBdq+Oa5hO/wZH1jbJtln5lmMAHHYWsO6i68YQtYcrD9LogZM1dyFWQ6
 33zaRH4Oe5zIaNhKUYVHvG9Bo=
X-Received: by 2002:a05:620a:1987:b0:8c5:2e15:ee7e with SMTP id
 af79cd13be357-8c6a68edf15mr273149185a.1.1768548462268; 
 Thu, 15 Jan 2026 23:27:42 -0800 (PST)
X-Received: by 2002:a05:620a:1987:b0:8c5:2e15:ee7e with SMTP id
 af79cd13be357-8c6a68edf15mr273145485a.1.1768548461871; 
 Thu, 15 Jan 2026 23:27:41 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:36 +0200
Subject: [PATCH v3 2/9] soc: qcom: ubwc: add helpers to get programmable values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-2-662ac0e0761f@oss.qualcomm.com>
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
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=f6HtLiKKb/4Affz7e1VJ8PeslNVW6kXZOqanD2Gu5FE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpqr0DI/T4fzPhXcMLUQDO1d03tFKGRdCkS
 CTh5W4hgYGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1SIbCACz74dN96rhxETe3r7bYueM72qOgA2EXJfBPvIDyxk9w/kz7CFKGKgzJiMHrNNJ5j2bsgT
 O8AHYHbc7KH/5PKFNCRmoX+E3CkiQJKta1DRQNJEfrD3FI4ESwJZwSXSR6qsvcbgNmB0ytyfMVW
 cThizBKwzZPMiOgNlX+l4y9uUD6yPGVFm2RsGY7GE0ArYDEfx+RiiLeE0U0zjWllSNB5vPhjFS1
 ItIszToX5EZvXjn1TEOAiehcNiSOH042HlYLowcJwoeZM3CrN1BKOy1Jh6qh9YEBWMjYO1xh+2f
 GGj3pOXAceV2/nrJHHnCnmI+NmLhM0u5f+ET67YQFmaFT6Tu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4WLtBkESeMeBDZ9GyF8tiKj-oSfAEqgv
X-Proofpoint-ORIG-GUID: 4WLtBkESeMeBDZ9GyF8tiKj-oSfAEqgv
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=6969e86f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0nnIczzv09DC-zKiMkwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXzEdDJJnphiHv
 1Vi4ElsBvUP41X5uIclpKNPASnLy7n4RGt8Il9jUKjSSc6P0YfywOfXgXYQTO8EsnJ1ShsEHfWX
 W+d3UHtdoVxJxnO0Y7f9ET76n1i6jwaG7QWcdrprwnIs648eA9RaMjIi6Ca2bv9M8NaWrmQk6j+
 U9lkZj8zshrJRjyDwYsTbaNBHaKEMa91nSmDeNjey35UpIszQQ6yfK3ntM5R5ahd1c+770cKo7x
 UQuaXxRVKwrv55D60KWT4GfI2IiwWrQNCa+sYARxE71tgeApcXNU7QkHZjPOMMiX4NE9eggQbIa
 v1veVTjtRv+bkqFr4Aca3ppRyZsq6vjV3vXwJWHvJUJxRSasN03G8T6WflwyhQxLAWeJpUb/OhJ
 xkYEu6M4rSztmENNJ1KyR2Ip6Mt1zmkFi3hYtg5cQMgrjCS/j1DdcTr74IXB46Fyo5gci5uxAJX
 hIdiVkjT9af4wRi8FIw==
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

Currently the database stores macrotile_mode in the data. However it
can be derived from the rest of the data: it should be used for UBWC
encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).

The ubwc_bank_spread field seems to be based on the impreside data we
had for the MDSS and DPU programming. In some cases UBWC engine inside
the display controller doesn't need to program it, although bank spread
is to be enabled.

Bank swizzle is also currently stored as is, but it is almost standard
(banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
being Lemans (it uses only bank 3).

Add helpers returning values from the config for now. They will be
rewritten later, in a separate series, but having the helper now
simplifies refacroring the code later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 719b31c8fb3c..4801f288af81 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -83,4 +83,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 		 cfg->ubwc_dec_version == UBWC_3_0);
 }
 
+static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->macrotile_mode;
+}
+
+static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_bank_spread;
+}
+
+static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_swizzle;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

