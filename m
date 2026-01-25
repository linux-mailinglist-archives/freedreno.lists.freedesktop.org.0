Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIFfBND+dWmMKQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 25 Jan 2026 12:30:24 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0C8033E
	for <lists+freedreno@lfdr.de>; Sun, 25 Jan 2026 12:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719DB10E359;
	Sun, 25 Jan 2026 11:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CE8xiR7T";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uf8zTUq/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F9010E2B8
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60P102OQ2350501
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=; b=CE8xiR7TaaJDqZ4J
 ziv47uJOJ+TaOcmRJTU72saCxNT0x8JkgfqazW82hByDYo+4cGiCiFDmOEjs+qB/
 Cq905Lreky86WoHJhiz6/LA9FT4RZ7vfI4keZxwpERwZDtXbQurpUxjEaTFTvfy/
 Ly4SLD5xb6LmADuiMAkm0ej40mEYH2ZN5RpctpnOieVl8eNthUgv5YVifrbc1G5J
 0SxLILSQgbKY30vjsnJtaoQX3WizIKJpUgSvR6wxx3rp58IUCraFXrwcq2w5SMEs
 As9RLFa5icUple2qirTiEjsYFD5pBMw9YWLMsqyvx8ptwElEk2pQ2ia3bQw11raQ
 XyLPeg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9ft1xw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 11:30:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-89467edcd21so198338486d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jan 2026 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769340620; x=1769945420;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
 b=Uf8zTUq/m9vhFLPEGZaY9OwMGZjCso955Kvyct5x6mbirZDYBnGectJWb/2k3V1f4R
 OrcVGTMjzz8IBHKLz/2MpJsu/fJ5InJDOu9Yh1qXdurD08kvBYk+ml2jdJBP8CCi1G6t
 ANRjuL9JQWccFdnx+ZIXPwCjjQbUIHr//YY5DaJ7OfIfRRp24tE9bwzc8+a0PwlsJqtr
 NTpYjNxrJGv2JIDPcUQ9YwFgBy83B9bxC1HB3QA1TxFlrbYSyOELZ+HAUPchkCTngm+e
 6y3jGidY5ypTg9n/UEbSOJ6C/OR/spG+7myyWQp7DoAFzLawdyWtYws8I/CzEd5zdC81
 VA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769340620; x=1769945420;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bra7g2q0HW951sIO8bL8XJstduNpKmclsTNcEgSH384=;
 b=fR3drKl+e1t1v9vjRugKMQ4CtJsm5ktAlcgyKxmtZVCcnwQ3Sp0/KIUkkSCt8TJBlS
 2RDGjB0ufHJgDMe1sG8WjkqABtbibiZyvyrP1ByuOHzQqaeGsBjmvhz6V5MP23P9H/oh
 +ehMwxp9ITqUy9Os82Mf4ZRsaQrUQcJC2HlqUsGWmPpYah7dN7V1kjkT8F18vk7Ep8FG
 drBtJe/rAWnNaoxsVKIVnI+KUAB8QQdr7gnOILKT9cjOQY2tiGb/yYmM3AeQP7DFQh8k
 /VtjpKRMXbPnf2xB428PguwbXo4ZDwp1+6tuIPoPzoH4koLvwTk99/3GXXWpSqyT5vcm
 5aRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9n0YXNicnk0TEWEM0HGgbxXpN6pw+ozIAG9tfDbrrpLDVkBYrdM58U4dcryhRWd1fuxF7tincZjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXZWOlV4hfABtKyXZMqvZCi4qienc4PDpEJEE3Yu/ycB/VDRjV
 h8qUQJqgNZaYE5GTpD9g76S+Klw7uKKfK/EgkJyoyzEXNMim7Ypv/WxmpBztSDpMXhCqz7cFkTy
 c4hS+N4L7kIbJnoWtZ/DShbPdg4YhJ3iLSDh+Y0FDOzZ+sNIoYieGRUQmDgoyZfKLtRbWXKE=
X-Gm-Gg: AZuq6aIIz+39/5HdS6WRltlayAl/a26JWo2NkoKXzDo07A39teVZ4C1jQWefzSYQv/M
 hT4NKtuZzcc989Fxq2fjE8FETcBpX8D2zHgzzU9ykPG2N3L5QZkuamxJrGW7eYW1grp4Tlsa/wy
 MzICCtxqKx80BpQ0/CGNFRAoKpf6+k1LRCgQEYKbbfJVhvHK+uhXSNvo2Vv6ufFXjPwvIrY42/M
 RYkEFmhwpQldLd9V292gPlGOibkuOPoUUgGVLSNc3uDm0OrFLy75e0mPcMmccVTkWWqj2/fB7M7
 8yBr3EfIp1aC89QcJ8tz6tj2rtQ+nGDVgUuMZVhFWxaUtEyDZefL5MjqjsLzfkE8xIrsxzPCQ0E
 DuXDtkRsH0oBgLjoFDneHbSPKHKgG7dOphjglxvy5ouGAGfA6HRxbsbiESieYfRevolHU6beQ+n
 2piJHJvuAGyjBzz1tPxRTDVok=
X-Received: by 2002:a05:6214:2a4f:b0:894:6cb7:da9b with SMTP id
 6a1803df08f44-894b0704cfcmr15283716d6.26.1769340619796; 
 Sun, 25 Jan 2026 03:30:19 -0800 (PST)
X-Received: by 2002:a05:6214:2a4f:b0:894:6cb7:da9b with SMTP id
 6a1803df08f44-894b0704cfcmr15283496d6.26.1769340619379; 
 Sun, 25 Jan 2026 03:30:19 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 03:30:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:05 +0200
Subject: [PATCH v4 3/9] media: iris: retrieve UBWC platform configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mcq8fy61nNX/KrrW1JUbvq89CB28wRxCq24uyk1o/ls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6+lbMPCjA0QH1RNMgeHfzcM/XGXqeAn260Y
 tAEM3hEHoeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vgAKCRCLPIo+Aiko
 1TzZCACNnMq7tmHBTPGuLTSr3885KQC3fdu23yrk8T2C0MRvdzQlP/1sk18N9Sd6NP0KzbVAAX1
 WCPn3s+1hDD4NQY32nuicuw8Kf6oIQ8XkNO0CQ25h7XccnNG0sLtw2M9mdZU3v+ecPFnYCPg8Vs
 UY4AoKkPk8Pr1a6sSGFDtK420ZuNFi7m1b/FtQmOWWLH/VySBCZSVaJkTj2e+hV0svQ4eboHe3z
 tR9wsMsp79LydD5l0hAjweJQb2I7IbeY52ULkS+VGJHTeyJ19XGAkdMr+hfz6U1YDNUvycoNFKr
 khUeQ98rp1pR4KawE37qqBNcIxxbPOvs6txmbcR1mOASjFwD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: prhiEC6Zw24gtpqohMaQhbfg_mqLAGuf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX4Kjss7eLVyfa
 n3XqWp9kvtASZxdwF8rGpxITJd4OkMXfEv7YWCRX6GT2+yqWUDC0HtJTegWQkrUHxIKe1srYz2B
 oAA9s9jiDbUZCUdO8Ie84AeSUmLxJroKik0YVCzS/UqlyqB3khv1K5abAYA9g7L3n/6bnf/JtmP
 mk7YZe6zz5dBmb1dVKHqY+3Gj44D+5VYAm5WdF2d0SGiksyQwkKNyF0wTS8nKcAcvLfxctkz3y7
 qXoagsURlWukDGlfUHZmB7ZMxoLgCaVySUPz68RnB/dreJVXdQi6kZgIYkoLtjYiq5zKf+KpYJH
 j7KJl0QNVpL8v6daoAKhBzWQl2kTSgqQ6bxAuvn/IyOR8stGzlx9WiFj9gFeOlFWy6UqF60dYTI
 cMvgcXENwFaiiPvnQ02V6RJuBl0uQHNDaOJjjoSbDo/cYJ7mu1DSC+r+TB26nQWhjkZbsk1e4cG
 UJn1gVLpQENUz5Tkb2A==
X-Authority-Analysis: v=2.4 cv=btlBxUai c=1 sm=1 tr=0 ts=6975fecc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: prhiEC6Zw24gtpqohMaQhbfg_mqLAGuf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B5C0C8033E
X-Rspamd-Action: no action

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..492f85f518eb 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3

