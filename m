Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHVxJ8r+dWmDKQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 25 Jan 2026 12:30:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DAA80302
	for <lists+freedreno@lfdr.de>; Sun, 25 Jan 2026 12:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF1610E256;
	Sun, 25 Jan 2026 11:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQX92km5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bo5eW51e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204910E07D
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P3EkbS2512566
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=; b=SQX92km5QecDrX9Y
 +acwKvRlgQAKuVY6T2oXyTZXvzufoXXlRFVyA9nb62KDGbdtmIu6KDeQaX6EQc7i
 5wOYHIW4WVX0Da4pXfuml4K7jzvbjiV35wPU9EJMhQmZ8hgbM20Jibo8DL9A/Ott
 F90DygrwK1e0IcfRQ5UQD5St591R1VDAEFg2Pl8DOVv1DkTM/m2H3bL+yxcIlgIV
 kyasXhEt4ZMp1MDwtdmaf4o0Tk9mQDR2l9WlPsbcrT/Cu+4Ez9+Ik/ynkrWYJ1gL
 UiI0exxdgQUqfwVviySHb7UQNrCupCW99aLZnc+o3TwywZwzcKAdOYMmvPE+mAUT
 bvGrRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6ut1fs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a344b86f7so129665936d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340613; x=1769945413;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=;
 b=bo5eW51elr78n/o0xIBbT4Qs7t5aktlDn0tXcxvMboxqZIXuKaDNzr8StEBAacbp8D
 7VnXzlyiXGO9e+wAy9y3qrAQedFxQ4drpp+5pwJDzft+e2Um513BYxYObaWgqYM6r1tL
 +aK+AdK0fdfm0CYmzBeUlbq07sj8pWZduErwr5KSFmWev+E38hcetMve94xFwFPEoRKv
 J8websPg2dhj7JDzd9r6yAtT1sqJKxQxAnNsu1isLqe4LX5Q5n7YDwDFp3cBiIdeLMCV
 V/RMQIe8rT26y7td+mjI6WOpo9DrAKxWA/jSXo2sfaCed7u/e1hQvFTuenWr17WCGpC5
 48kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340613; x=1769945413;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NJcvqpUgtFMAP25ZnC2KVh0TcJY9dbo30bXKJAK5phM=;
 b=nHyuX2DZdON8Y8QA1b4RAQf3trIIuGpKYdibyT3uUNusPbGgyh8BpC1NBK2ymLV4mb
 4ZrfgJg/IK/XoNMOCT1ytk/n6Y+sF9EiOrHE+Gd71T9ANEfiAWkndAV5zfHEqcTBRhsS
 5IzgD/rdJXMyugaLSWQudhIyXOVu5ga7KCUXCuHK6ycvmbzTpVv5OXhaIfco32p8j/UC
 w3uDQ+XlZsLbLrn7bzff6Wj8SUdlETW3Nc8NVebFw17OLOdDVwJF9HcLto0dqpb3S2aj
 FxTo7uEll5Ot9io8ApVOKFW8XpVx3EpMYB+g1m+GKjcc0VjS66/3clPmxu1ML7r3YGI4
 fOBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHvUokOIq7k0WL9NUI+PsshuhaRd9bOFfXt4ZcQyvftN0Me/MKPJSyU19tUaXu4L9yWPBIix9gJzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiES1ht4S5wJNeDLatAn2II9FL/AlNQXVBI0Y+KD+VMCtPYDPC
 r4oXoQi+GAI5RgVj2lfHA107B7vSoiRiS/tiQmDHn27EC+jeqhdwKxS5dBH8y0D2EtCKAfJyM25
 TNadnR0HveMosWUHMxb67WYwq+30cQu/9RMOZghdsrLxK2PQ8UKkuqQQhYJkRf3Patgw0TxA=
X-Gm-Gg: AZuq6aJMSaYcl2U9yUv0gEJmBNL1TJBVWigd47sfGh3+jBRafRnDhUHDHOtDRORTQ/G
 734kuG2mgOmK3RZSmqcIewi5F9pqVX22rvd8D1WnTYHmoLR+Sd3usFXBz/smXCQSh35BogllE/H
 5L0zM7533OD9asOBhJocZgBfPPir4E7CDGYxJwgvtImusvLf3sHOrRZBZC5x92WU31foXuN/VtG
 +6/9cb0+Sn6W9UEmUPA0wQdSATZHqn5pm6kjThDFfzOnniFbj8RGSyzwrQFncchzP33id3w0T5X
 ZwQrME5vxFU12gBuPzdVTwwDdfmhhOYBYqYMwEYDNXmuEei3f5nc+JJW2pf6EkgdIToIhAtU+8a
 o/rcNR+7WShqomy0DyYDVXNG2OSdKMaWta2m7FIz8K7eKa1Fxwc/c5tLd1w+D1B3bloGvcowSPw
 iCqbERJGOym0AImHfsk5iy3uA=
X-Received: by 2002:a05:6214:250b:b0:88f:cd35:cc8f with SMTP id
 6a1803df08f44-894b077cab2mr15835626d6.39.1769340612709; 
 Sun, 25 Jan 2026 03:30:12 -0800 (PST)
X-Received: by 2002:a05:6214:250b:b0:88f:cd35:cc8f with SMTP id
 6a1803df08f44-894b077cab2mr15835336d6.39.1769340612267; 
 Sun, 25 Jan 2026 03:30:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:03 +0200
Subject: [PATCH v4 1/9] soc: qcom: ubwc: add helper to get min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-1-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ytVe+uou8BTNPny5/OojRD5KZD6kFH473n9t0J/PfrQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+rvTjfORBmAGtkJaWo7TYCL436V5jH9N5/
 7M8QvBqPpaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1dr4CACWDCwPjdjT+Ybs16qoXhrm/d4xsBKUhoOVYgecuVhnIph4NPRElf4FQ1l1qtjUMBeMZII
 O9wNUbIDqQg2oGahgMh5iVHY06+BuqtPjO3PF9+FPP4pGFK4rDee0nAJgEuWoE8bXRQtk+2wAWa
 4iLy9p/88N3f7df8zQ2OWgVOmFzvgdk7JuAVG4O9d/x1GLYc9IOPaoDzIGfVULU263Gnl8yGEJR
 OKH35R15GVSBHfUe1kdwMZXGKnkh2mZ1Saf1O5VtNfdHdmbHe5Wd03jqo/RLCuHqe3Nam9x8U/z
 vteYakKw41nKaidjFSZr2vGUuELvOygw7Z7hisjy3gv4Hpv3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX++3gSOfF+XEl
 uXEc1qH9hL3GWVLbSaJ4KyrrYLycP/IiHJY/owUkAeEqhx0we7TNzS6fBETSce0jOICwTiJE5CU
 CI7++MQADxxlEujK8LBIc7/jZly63muYlus1PRw6/l/Ap4y4rQwLyvjT9GJj+mM+jPyhcZsl6b1
 H19f+bGfTtG+75sAwO0YjQKYL6JuWSMhi2eYlAuhyRxXVy4YdBopbyqoUNG+a6SDvM8yE8GcHN/
 i8AdUyI5XvVY7DqC796NVT/5P8YFLN0ae21BDwezToQ9IuA/VUl124Zx5Ss7XJuhzzFRmzSu3FO
 Is+5xYzeHOsVgmt0bjAP4AfyAXVEFOKkexv1yWNX1X3Fg1whxuagN5uWnzXPr9z7v7LGWaU8jqP
 9C00qvWD69CRfwjX2CDBWeG7E3LxOdI0i17Mr6B1au7uAkyXXFnt21QKXbLoPGo8LjegQbGgS+J
 fp/JSQpmYOt79ZPl1/w==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6975fec5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZnE8w8QzOYjIZ_Lrp0IA:9
 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HqC2V9srQspk9bstgWvKA5xTw33uZGol
X-Proofpoint-GUID: HqC2V9srQspk9bstgWvKA5xTw33uZGol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250095
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:akhilpo@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:wangao.wang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 30DAA80302
X-Rspamd-Action: no action

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..5bdeca18d54d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

