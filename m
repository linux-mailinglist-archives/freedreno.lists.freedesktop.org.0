Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B780B02887
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2665B10EB0C;
	Sat, 12 Jul 2025 00:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK9dcDmu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF8A10E3DF
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:42 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0hS9v021865
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 FtDMkE/nYvcymb9V2MvjT6eL01NcAA2GyDnTtlSRCMc=; b=mK9dcDmu/p4ImfHO
 j8vjU+nuAxRlrek/XbbCsHHIB3y61NLTmrvLRPnmWhwYJ54XNozT3d831EvNG04Z
 q0cXIQjTYyffeEAvretA62opuwVgGo44UV3kGvBJYKlxnhF9PSAawiXtPyx6B0Zp
 CivnL3qqMv+BaDIRzUbFWNmp2GunpYvxgTBiudpkKdW5s8jmAFE9wPiRTokDxB2Z
 ifGLzpHzPnQs8t7BKNTMpYapF5Qn+IPsKf4hXfZks1eGqX5PZSuvSM5G9PbXRg+C
 vrA78rMUIzwfEYzo9ZA+WL9B1a+CdppL5rd/hR2v2mNdbdzKyGDz+6IXgLwuBqIh
 t5qKTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311e98ee3fcso3408939a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281921; x=1752886721;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtDMkE/nYvcymb9V2MvjT6eL01NcAA2GyDnTtlSRCMc=;
 b=xGGDzYbz0VcesZrSbunBgSPb66wo5uNEdevaJ46dv0DSHeuAbZhvJmJc8naMucSmAN
 AIwZiepmo9NB0Ix/HBy6pn2sTJgprRVex0ZqazfvLJ2mCdvWe/tvyBihoi0GikhB8Ut3
 wwBFeWY6NmhpRjbENrFhn/w2B4l7s1HnPrTtxY2ThMarNeiUNcADdzQKBBoI7GiYXTuC
 f9BuJJHOb3lnU21Uv8nlZLNb2KkhzRLixqV7oPV1aHfWdwwsiVLCMfz83axlyEXtLqEe
 1bOUmFi15XGszs66Gt4HzmaAIZy3NdHieDb5YnULjHi9uEWF8cY7nYgPugWfU1TxV5HP
 LbKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV60S8nCvWR1rClciovvhwYl0jRQrF+ovX7Qz3nNet7sF9gPyJy/lW3+XsxfmT365LfWdYKgPookF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtYpeGS+Zib0X85AGDswOgtM6cZBuhtr+5TGjqWMqhoLg1kCbB
 n6Kox7Nm+mmFSCH/QcStYNgggDjQkETpRpd5BTkIvGg6MkY4TGP9gNgj66Fk79T/FC1a7xbcG3F
 TDnS3p8Rd+dFMZDZyMEGzCAZe7a4QuMETAULKoWIyjvzNuUIKIpr9TrjnNjFvprLSpqNfKDE=
X-Gm-Gg: ASbGncu/bFLggON/E2wcWGm2fSXEAF1wb8g3FvU934xGTK5tTW60AQyPmyFgpdPIJiN
 DQCLqhJ9vigQEHG8c1yFgxH+uTIOLIFVSypN2xKytGO0xzkcIszA3QOWpJvCPQm1GJ4t7k3SGYo
 8QliThw707xJ5V1mPdABiy2tzZkNLYGm/P+gKd9SJXBY66bIwJ819051tTTD+LFDlYzvbO1JZIV
 coN1C7kB19t59uDlCf3ZrleXj2lRj9K6w21gtewncq/6C81jpngsCa1f8r1vZ8GzAWSmLYI2pip
 pRyZsWZSoQKrGkBoUXdAFX/RsG0OcqYu8r5+S+LG6Bvemtk5ec1LvFLHGy0+MTnavlTWYsC2pHE
 Trcu558BIL3OoEzoWrpCB5gmL
X-Received: by 2002:a17:90a:e7d0:b0:312:dbcd:b94f with SMTP id
 98e67ed59e1d1-31c4d4cf62dmr6563740a91.11.1752281921320; 
 Fri, 11 Jul 2025 17:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkmyvyut/CURZ5YzbZaUOdCU1WWcrvWnhSu6oPk2z13iP/0OOjcK8+xnbnEI46xI8fV/XCXQ==
X-Received: by 2002:a17:90a:e7d0:b0:312:dbcd:b94f with SMTP id
 98e67ed59e1d1-31c4d4cf62dmr6563680a91.11.1752281920613; 
 Fri, 11 Jul 2025 17:58:40 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:39 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:14 -0700
Subject: [PATCH 09/19] drm/msm/dp: Replace ST_DISPLAY_OFF with power_on in
 atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-9-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1734;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=czxDsq22LT+pLoYLzhxwBsQa28JP07lsZiCICURAXyo=;
 b=XhpMkCEr08Yom6OH/qj4yFXw2PuaeopNT+hn2CIYsc/UvIaRDghEcO05XoTOrr/0rliS3F66p
 QxV+5b5f5q+BLyFCJzJrnez36qE+LlI4Akf6ai4ujGbBP5Cx23+BH7W
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b342 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=c02wphsZB3Yn0AVd1wgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX+jX5By/kJ5ld
 A7fXkGzuJMkQQ5o/7nIBa2j+2+X5bqcT8+uxchWTwrz2uCgrh8yZn1DP8Ed7NCd/bnd4sz3ViO2
 8BG6dTyVIcfxeHMoTGnu+nWwJTBuHqL3AMRZvCrlJWevjWBlY3z4+RnH2/3yF1005FcLn6DsN4o
 A8QZ9rzWhGIAJtVh0zqoSHJwfyn+cxpNltGvXnzxrR24pCxFJoYoGAKIoVuKNkwm/mgTxARMrm1
 3ky9Xi7C4s0pZY4n2rIPIl2oLBYXeZPrf1CAi36z4sFtktifq1rRl/eEJ8L+xVvNTiZGgLJFn7j
 u4vhMkuA8U4f/Q58VX8ad9yX2Dc9zKUd5a6n31Ph3KdsUWnQ/Uyds/7mfcFBvePiyptp16s0bLY
 j/3UPXOJ6ZRKfBZBXoTmoCMu9ilbnC8/WUzM65ENW83nnPuta+HfD9IbBfpxk+ck+YKFp7UC
X-Proofpoint-GUID: C29HgAYsh47BqZicVKU4X3q6ko8pXtSU
X-Proofpoint-ORIG-GUID: C29HgAYsh47BqZicVKU4X3q6ko8pXtSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

ST_DISPLAY_OFF check in msm_dp_bridge_atomic_enable() is used to check
that if the display was disabled while still hotplugged, phy needs
to be re-initialized.

This can be replaced with a different check as it just means the DP cable
is connected but without display being powered on. Replace the
ST_DISPLAY_OFF check with a combination of connected and
power_on checks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 98f5274f123e..6535c1cccf84 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1564,7 +1564,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *msm_dp_display;
-	u32 hpd_state;
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1585,7 +1584,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state = msm_dp_display->hpd_state;
 	if (!dp->connected) {
 		mutex_unlock(&msm_dp_display->event_mutex);
 		return;
@@ -1598,9 +1596,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	hpd_state =  msm_dp_display->hpd_state;
-
-	if (hpd_state == ST_DISPLAY_OFF) {
+	if (dp->connected && !dp->power_on) {
 		msm_dp_display_host_phy_init(msm_dp_display);
 		force_link_train = true;
 	}

-- 
2.50.1

