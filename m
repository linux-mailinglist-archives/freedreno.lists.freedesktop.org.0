Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D7CDCBE7
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 16:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE76610FEFB;
	Wed, 24 Dec 2025 15:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdcfKq2+";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="deqVwpeP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5137510FEF5
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO83XvO1056453
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5Y26BULJ8RBq8/D+FuknUz03YZBdAhneAsR52EWKMMc=; b=pdcfKq2+jePakO/b
 CoVMhtu7dP34cKaxKjbEmc+r+NA9ry5EwIOlfXIUWZHfhhMasj+N2rusf7OnhBb5
 /+RPG0bbnqiBKtn6UyL1LuF0iQgGZNsG3On8YmBOx/7GqitFQHkC2UVXfnN+dQjY
 betrPxljhxoaJOcYAmTLjDQK2S4em4z+HamiIlAkc0vuMkJbboKukm1sJVImBc5R
 4YCNp7/K9GKLVoZpriTWcKnOfRAdQZToTll55sQOs2rbZEFP08nC2oxwBjZSCkgU
 ksbQNorHIeyKij3CgXfjyVk1mHBaFhnsprmHFy3Voul5/8vF7JSqg1AQTuZkYe1W
 DpEvMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2u0t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 15:42:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a366fa140so281504216d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 07:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766590957; x=1767195757;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5Y26BULJ8RBq8/D+FuknUz03YZBdAhneAsR52EWKMMc=;
 b=deqVwpePVpwXYlP+EgUfzlOjswA8BplocHcCNGnA5bS0Z/a49gAoi1GWJ8xl5bxmr4
 GGq8JUBOBAWWd99Eazz2cx2x3qUREANVKBbL7TWORKxWEPLEO6aSEIQ+cb95WYRLee0d
 PiPd+KkRSob1rXmLiJgjfrLRpNZHlaXgXs+Fx0mBwTP6lRAXy/yvc7RFw78/+VlvAcXU
 nCWmtSMe4LHDolmNIJgyUVBRWRHa+0D3QYM2MPXJOIrZDcOWw0O5ZMhPHIdJClA5B2RX
 4+gi+uv598QcHnmH8Yrbbax6Wm34pfWjVhHgH4jCAvbgds8b4SgBQ2mlSoNgxVlVb3GR
 tKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766590957; x=1767195757;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5Y26BULJ8RBq8/D+FuknUz03YZBdAhneAsR52EWKMMc=;
 b=cJ9/HAMGQRsYQCIk61V35GMcvGxexNA+BxHOhMiQOj+u0e0GfMHhzvftuuc/vjxTxs
 pv7sgnfQz/THlaJmZvK7941WDqaz2SN/Ru+wZIMQ//77UMXfZp4xRL88g8Le47sWocdK
 QHQIWPrFs5b+sU+wqpekayfXpEBWGD8LnCts/K6HHcwpOG9jWfLT8KojTe7dE6AvvEnJ
 /OyoRlNaIpDKTof286Z7fcQbuGl0E+b8SLEOyL6Hb1xm3NP3kObFJzCSEQv8TCriBCE0
 n8KSSn+1lb78MkC/N400X8lG1KZ/0iz8t8ubBIqkGV3BS1u4EhFsdjxkA7y3Ska7Jha+
 Jz1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE4ISn9iU5qZ/RFUQFcKfUlTE3RLXNT67GNBCkoprE1V1psWLmfzDUAdRcLAxuzOJmhaDZMDyxeN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4WjlyK+7CsYQhdWADaS6Pa9SFDZpMgO+G+2AQwUI1R3DJzz5d
 dFcioiAOkIEoJobMa9O5aoRLrTtFQvDUaEtqyz1m3mWBOlR6vO7IDNgP31u+E9+xQJLOymta6cg
 xDhXqLnxoaYRVSQGQA43LCSKnCiXBTiIFwfQ2xgeU4K2tzCD+qmcQPwbzaVw10zCnsSXPnTU=
X-Gm-Gg: AY/fxX5nN2EtpyKxsK2TvkCEHCBBj5pMxxAOz1obW7hdvoYj9rZ/qVhgrErnuMy2+v8
 gNkDy+Z25qnJRxDEiDEbMHVn8vof9kSwDdtIIc2kYrbXXp6tBlzV78yqO7Xw+UcX1oESKpOGJYP
 VG5d1HS0wkQZdDzNOuPfVrnWeNOKaXE9+s5rxawJ+Ziv0FWNU1kk1Gg4xjySCNATXWiN/6BXqP8
 drqHrU5PGY8mng6pheK3bpIgV8tWBlLpL0is/R4E+myZrlk+yb3LIPSbyuAoLcpCAxmzz0Lm6j5
 /uu/RPXS99a+rbvFGs7rwB1QB6GXwFs5ykkAZaaxgT+fqxwf8FtARMmjBA+5wTvKrHX4lIg4p0G
 asT0jvPxfE3/S1ztX4koiHuYyvvADyyhQNSzyW7CPwnNeQGfn6ftlVXpCXFsBzmfcibLo4L8WZM
 OVPWQr/icAuGyltcLGS3g+/Xo=
X-Received: by 2002:a05:6214:238a:b0:882:3c0c:a41c with SMTP id
 6a1803df08f44-88d81663888mr284522266d6.11.1766590956638; 
 Wed, 24 Dec 2025 07:42:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnAa6clq/X0DdSozBEnJAaz2cedKnSHfL12U6OniShni9Ox1I8Tiigv3QBP6+58KmpndEaBA==
X-Received: by 2002:a05:6214:238a:b0:882:3c0c:a41c with SMTP id
 6a1803df08f44-88d81663888mr284521896d6.11.1766590956154; 
 Wed, 24 Dec 2025 07:42:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a1861f2e6sm5071562e87.69.2025.12.24.07.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 07:42:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:42:32 +0200
Subject: [PATCH v3 3/3] drm/msm/mdp5: drop support for MSM8998, SDM630 and
 SDM660
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mdp5-drop-dpu3-v3-3-fd7bb8546c30@oss.qualcomm.com>
References: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
In-Reply-To: <20251224-mdp5-drop-dpu3-v3-0-fd7bb8546c30@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10672;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ArL2dpKAJjAc+7mXNblJNDmtmUpgtot12YPCAF2ieD4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpTAnnwk7wn9W0zOGcuVyon8TD/QKjjWIyUVc8g
 BtiL3LTT1uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUwJ5wAKCRCLPIo+Aiko
 1W4lCACSU0EXY7KbJvUM636h9kO3PUW+3agLE6nhiNjzl5+6OOQK/sQrBs9VBwyNcFwLJ6heQXj
 /LP7Z18CkjLAooXAsjGzclSFTYp/Ra1mTweti3t3MpSUTDbT8TrHolP+ACEIV3xfG4JhJfVyxgT
 T/ISGOAkKLqRPR18kEZmg01byU7mMfjL72S65p5EWmArowgX4zkrzc5QETNjn57dG6GBZuYaSVZ
 JktohQ03NALVJ3ewlWaS1vndJtl/23qPBPp/5nbCLG11jdkyKBBd6MWoYEm6oCwlQJkmhAGoQjH
 crojxKZlviS2+tVzqA8404KIbdvJsJk2FGhopBlt8r0Nyt38
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzOCBTYWx0ZWRfX7NKbgTmUAp9r
 tSlhOFlg4z0pdS+jQ1mWUnd/EJqDemHp47W6+57wnQB7Ul6ABecnnqFEgw5MFB92ixv+NFyaeJS
 rVXvsegb+91mDl3Zq7rES4/W1aNd9arg3XbUomc8NfYYB8RTRR9EczOeYB/bFFi/S7srtEcW3LQ
 epsXGiiYviBYZrOAV+4Sb3BJ99bhfEm++A9V+p+fHOgyxtA3WflSR6hQKwzKDSNosMa6yzurQ5Y
 r9ltsHXYkCNOR0e5AvijbDlVLQKlXhZy1zZ93PJKsjiLbzfYM1yvLVJ7ic6GfY7M0L5xRLVvwGi
 vLyvDoHTGfg2yhMzouqs8c/onKW+Ae1p5NZ466gH0tGrpLFh+RUU648t/PkjHf8mL4oEzm96Hq1
 TZvQy4NgLU4yqmjzSI9nAW1+OPgnLhTFdGhpJXRTb2qqsKU2dqtQzcesmeZmbSQ2sqQtxwD15QW
 gE7Rgh+fxz9rYYdWkUw==
X-Proofpoint-ORIG-GUID: eatnXp4AzENPtMjk3EayNiLiTX_ao3TY
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694c09ed cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-7OkC1N2hDg87y89b1EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: eatnXp4AzENPtMjk3EayNiLiTX_ao3TY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240138
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

Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
by both DPU and MDP5 drivers. Support for them in the DPU driver is
mature enough, so it's no longer sensible to keep them enabled in the
MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
string. Drop support for the MDP5 3.x genration inside the MDP5
driver and migrate those to the DPU driver only.

Note: this will break if one uses the DT generated before v6.3 as they
had only the generic, "qcom,mdp5" compatible string for SDM630 and
SDM660. However granted that we had two LTS releases inbetween I don't
think it is an issue.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 314 -------------------------------
 drivers/gpu/drm/msm/msm_drv.c            |  16 +-
 2 files changed, 13 insertions(+), 317 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index df464f7c05bf..69fef034d0df 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1097,310 +1097,6 @@ static const struct mdp5_cfg_hw msm8937_config = {
 	.max_clk = 320000000,
 };
 
-static const struct mdp5_cfg_hw msm8998_config = {
-	.name = "msm8998",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_DSC |
-			MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf7ffffff,
-	},
-	.pipe_vig = {
-		.count = 4,
-		.base = { 0x04000, 0x06000, 0x08000, 0x0a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000, 0x2a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 2,
-		.base = { 0x34000, 0x36000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 6,
-		.base = { 0x44000, 0x45000, 0x46000, 0x47000, 0x48000, 0x49000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = 1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 2, .pp = 2, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 3, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				{ .id = 4, .pp = -1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				{ .id = 5, .pp = 3, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-			     },
-		.nb_stages = 8,
-		.max_width = 2560,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 2,
-		.base = { 0x54000, 0x56000 },
-	},
-	.ad = {
-		.count = 3,
-		.base = { 0x78000, 0x78800, 0x79000 },
-	},
-	.pp = {
-		.count = 4,
-		.base = { 0x70000, 0x70800, 0x71000, 0x71800 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.dsc = {
-		.count = 2,
-		.base = { 0x80000, 0x80400 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800, 0x6c000 },
-		.connect = {
-			[0] = INTF_eDP,
-			[1] = INTF_DSI,
-			[2] = INTF_DSI,
-			[3] = INTF_HDMI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
-static const struct mdp5_cfg_hw sdm630_config = {
-	.name = "sdm630",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf4ffffff,
-	},
-	.pipe_vig = {
-		.count = 1,
-		.base = { 0x04000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x34000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 2,
-		.base = { 0x44000, 0x46000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				},
-		.nb_stages = 8,
-		.max_width = 2048,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 1,
-		.base = { 0x54000 },
-	},
-	.ad = {
-		.count = 2,
-		.base = { 0x78000, 0x78800 },
-	},
-	.pp = {
-		.count = 3,
-		.base = { 0x70000, 0x71000, 0x72000 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800 },
-		.connect = {
-			[0] = INTF_DISABLED,
-			[1] = INTF_DSI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
-static const struct mdp5_cfg_hw sdm660_config = {
-	.name = "sdm660",
-	.mdp = {
-		.count = 1,
-		.caps = MDP_CAP_DSC |
-			MDP_CAP_CDM |
-			MDP_CAP_SRC_SPLIT |
-			0,
-	},
-	.ctl = {
-		.count = 5,
-		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
-		.flush_hw_mask = 0xf4ffffff,
-	},
-	.pipe_vig = {
-		.count = 2,
-		.base = { 0x04000, 0x6000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_CSC	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_rgb = {
-		.count = 4,
-		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SCALE	|
-			MDP_PIPE_CAP_DECIMATION	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_dma = {
-		.count = 2, /* driver supports max of 2 currently */
-		.base = { 0x24000, 0x26000, 0x28000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			0,
-	},
-	.pipe_cursor = {
-		.count = 1,
-		.base = { 0x34000 },
-		.caps = MDP_PIPE_CAP_HFLIP	|
-			MDP_PIPE_CAP_VFLIP	|
-			MDP_PIPE_CAP_SW_PIX_EXT	|
-			MDP_PIPE_CAP_CURSOR	|
-			0,
-	},
-
-	.lm = {
-		.count = 4,
-		.base = { 0x44000, 0x45000, 0x46000, 0x49000 },
-		.instances = {
-				{ .id = 0, .pp = 0, .dspp = 0,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 1, .pp = 1, .dspp = 1,
-				  .caps = MDP_LM_CAP_DISPLAY, },
-				{ .id = 2, .pp = 2, .dspp = -1,
-				  .caps = MDP_LM_CAP_DISPLAY |
-					  MDP_LM_CAP_PAIR, },
-				{ .id = 3, .pp = 3, .dspp = -1,
-				  .caps = MDP_LM_CAP_WB, },
-				},
-		.nb_stages = 8,
-		.max_width = 2560,
-		.max_height = 0xFFFF,
-	},
-	.dspp = {
-		.count = 2,
-		.base = { 0x54000, 0x56000 },
-	},
-	.ad = {
-		.count = 2,
-		.base = { 0x78000, 0x78800 },
-	},
-	.pp = {
-		.count = 5,
-		.base = { 0x70000, 0x70800, 0x71000, 0x71800, 0x72000 },
-	},
-	.cdm = {
-		.count = 1,
-		.base = { 0x79200 },
-	},
-	.dsc = {
-		.count = 2,
-		.base = { 0x80000, 0x80400 },
-	},
-	.intf = {
-		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800 },
-		.connect = {
-			[0] = INTF_DISABLED,
-			[1] = INTF_DSI,
-			[2] = INTF_DSI,
-			[3] = INTF_HDMI,
-		},
-	},
-	.max_clk = 412500000,
-};
-
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 1, .config = { .hw = &msm8x26_config } },
@@ -1416,12 +1112,6 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };
 
-static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
-	{ .revision = 0, .config = { .hw = &msm8998_config } },
-	{ .revision = 2, .config = { .hw = &sdm660_config } },
-	{ .revision = 3, .config = { .hw = &sdm630_config } },
-};
-
 const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
 {
 	return cfg_handler->config.hw;
@@ -1455,10 +1145,6 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 		cfg_handlers = cfg_handlers_v1;
 		num_handlers = ARRAY_SIZE(cfg_handlers_v1);
 		break;
-	case 3:
-		cfg_handlers = cfg_handlers_v3;
-		num_handlers = ARRAY_SIZE(cfg_handlers_v3);
-		break;
 	default:
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP major version: v%d.%d\n",
 				major, minor);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100..abee7149a9e8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -960,23 +960,33 @@ static bool prefer_mdp5 = true;
 MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
 module_param(prefer_mdp5, bool, 0444);
 
+/* list all platforms that have been migrated from mdp5 to dpu driver */
+static const char *const msm_mdp5_dpu_migrated[] = {
+	/* there never was qcom,msm8998-mdp5 */
+	"qcom,sdm630-mdp5",
+	"qcom,sdm660-mdp5",
+	NULL
+};
+
 /* list all platforms supported by both mdp5 and dpu drivers */
 static const char *const msm_mdp5_dpu_migration[] = {
 	"qcom,msm8917-mdp5",
 	"qcom,msm8937-mdp5",
 	"qcom,msm8953-mdp5",
 	"qcom,msm8996-mdp5",
-	"qcom,sdm630-mdp5",
-	"qcom,sdm660-mdp5",
 	NULL,
 };
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
 {
-	/* If it is not an MDP5 device, do not try MDP5 driver */
+	/* If it is not an MDP5 device, use DPU */
 	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
 		return dpu_driver;
 
+	/* If it is no longer supported by MDP5, use DPU */
+	if (of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migrated))
+		return dpu_driver;
+
 	/* If it is not in the migration list, use MDP5 */
 	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
 		return !dpu_driver;

-- 
2.47.3

