Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0639BA5703
	for <lists+freedreno@lfdr.de>; Sat, 27 Sep 2025 03:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7B010E137;
	Sat, 27 Sep 2025 01:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXxXeZpQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1FC10E137
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXDEA018334
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Qc5ocY3tSciWpBAvhCZm/2
 AVYNgu26K/bDoBWBIx65s=; b=XXxXeZpQoQZGfQAi2J3GHrxvHFMaIqSGA8mLTB
 rnF2pRGvy4DfAWzwdfPwq1G1VkzwbRpa+DNA/e4Mod/7Hg5r4jyvIHCBDIYiVxjJ
 pnYpMjy6S9CKxRLa2Og1MkeO64/smHZWkYXXCODCFETfDud3kKM3TPx0WD0OBwx1
 NrFXorE+zOCSYPwPageBqGT23TBYlS4T4FXqsup/uf0BepZ1JVUjM0G3PFXYZyAf
 0yhiJZ3JSKwjWYtM02HVQDEVOTT9FMznbznv042MZBgS0UH23Ek/vnQs9A+7P7pr
 aaZWbwxX+5336Ur9HGVIokMuoMj+yfa3ZP+n8mBet6CxwVJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dt3g9u1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Sep 2025 01:04:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8635d47553dso149637685a.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 18:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758935078; x=1759539878;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qc5ocY3tSciWpBAvhCZm/2AVYNgu26K/bDoBWBIx65s=;
 b=gD6lKJULJ7o1jD180rph9hs0uG7Skw50eAY5HrBrs2KdulJdL3omV653Zrhve6ua8w
 SpRM7ApK5C2hueeP0y/vhW5y1CTOcb5dDvosMlCd5o4lKh+TLNRonY5F3HUc/BQcySZC
 KS4E6oNOvOhY/yVhtGqOSp8gih48RC8lfD19kHmGGFwUNIRVJ08Wfws09eLa9vpz2HT9
 f2GFzprW5Cm1wWcEPF4CmaAP35BoAx2B1rB+JU7hn3Rr3CutocYkTIfM+FbhXMTiIpSB
 Urg6TMqVzyE4NGyGpSeA/cMthNTb2NKBpXjFconiiSs91vXN1FlHxmGFEZhtkRjpcdfg
 4QIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrm8rv6WS80be9EDAgSQQsgF/sWa1uwKe7hmVMripyqOCuWBCDOgkZN60/B36z9CSqADTMXf8TsBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN52SdnYcIp+FbCMIEY2VTTSuDSftnvRg7KG8NgGM3Qn8dQw/S
 C7lHe6diRdlMY4vN78mWnsUNHq8HJWGNwvV+37GPy3dhyal1CvXLzFFHpa0n0MCfiBH9+HFPQYc
 QoA3+2PJqWAAxIQzQp3PwdNKkxE7/0g7xoUGmsIwu0ZVVpCE6z6bzVK5d1NqNJgbIijpXDmo=
X-Gm-Gg: ASbGncsZ8slKysEVEcBBo6fGjb5jWljn88dR9EH32ecvnsE7k62PktdwKsjPVTcN8ob
 8xol5DpG+ETKCbeXodwnfXyOxeZ+JEFMYuMmfP1zLe3iQX/I7zbdzafwxgCTvJHlrUDHfLiPw2D
 +KkzPnlWJbgMxl00KhD+IvgIeqnXS7KCt9l3jQ/RCf/NiqDIeU84/LFfy6YN2cD8QKNDgtXbarZ
 v5qSN2QpHlSBrIa1LClM2OU0x4SEEDnzIOUKnofit5Cdd+pRkFdfk0iHH/GARl1nXMW4dgLjgb7
 nNwLLAENRD62Mu+X3oaHFUwBy9tM80LNtqXyyZcYlkbv2QSp+grFcZsxojnhjoUKjm1BTDhjvrZ
 Be1+Qli1HEFglntMNXPcs9Muzd7j8e8vtd7Cp+UciUMpGrkTq4rxC
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4da481d940dmr135262481cf.17.1758935077684; 
 Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfLcwV5gyaQhWH6cMHnOYm2QjhypSrV9zAMf4Mjq0wafZNaibNe24/I99cJs5+682pxDxsRQ==
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4da481d940dmr135262141cf.17.1758935077228; 
 Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 18:04:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Sat, 27 Sep 2025 04:04:29 +0300
Message-Id: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0412gC/x3MQQqAIBBA0avErBsww2S6SrSwGmugLDQiiO6et
 HyL/x9IHIUTtMUDkS9JsoeMqixgXFyYGWXKBq20UaQtrrLJiRL87qPbOKHGZqCaDRFbcpDDI7K
 X+592/ft+cVBFNmQAAAA=
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q78XSS/y8JtPNnJI6s3J7ArXOP9v75Iaz+LCtP6FojY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgfvqV9tNwSDjjNu1bYmTuEZAt+bf4bJeYD4
 z1GvExeq5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4HwAKCRCLPIo+Aiko
 1YkbB/9JgqkHjaGTaOuUPOXbyqKe3xWoHX6CP+gZcmjWeLTPttNPll9tRPecwLTPJJzjqwb0Tpd
 eqnyT/OKyrEuPOjBZfBfYDV81Oe7BwMvlG9l+8UZrv7ek4sTJTW213DoX/sXyAsI9Pv4Xl9cAD/
 YZdFvqbUbR/PCDvU8iqBDjexW24uxIMybn+ywBSLeIRCCWkLYAkFXuvFTxTv+zAD/rqZXMfU/1J
 uxHBoTMU2CSIFXyngR6Ai9qcFLfRK8BZqqdUtMEVYvWvtKnlcfrNLyu0/IuFaKyobHtojURMCfr
 0qoCsi5cPINJIPi0VMgx0EIAwXBhbcnQKrtLOHJq5CDQ8gDA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=df6NHHXe c=1 sm=1 tr=0 ts=68d73826 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BiG78YgtQv3mHEaFN1cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4RwxNF4S2bSLZd_W55Qf2wwIq-iHDKLO
X-Proofpoint-GUID: 4RwxNF4S2bSLZd_W55Qf2wwIq-iHDKLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwNiBTYWx0ZWRfX8NTaqpIpBXwN
 XAFmiFTic0MO5rrmbLWDW26JMDiDLvTj9GKRB3ojVFxPNwBZ15NugYLGD/9WcYtpVcHNv288NT0
 SXMnkEW56SXxR8CjL254t/C+MPJa2sl/dkWwUd2/QDh155c8dk1JCahIxAOy8UxvjQvXDM1Sz9z
 28SzAr7HdYct5jqhttoAniTish0PBZMxjt8jMdzkFzcpAl24uIYMDUNxszQ3ZY8UjexVy1DG5Dz
 g3tnu97FmfIVM+NMMuzwQt8DbLEHlqK1xeJz10FpgwY6ooTa+fyJ0Lkktt1uODP26YpIeIIAr6N
 bpN0b8ZdcF0gSV+fJmFZbE+IbZKITDFC33tn2AJrj//W6s9WLU7wd03JyVRkF6cCwjSiiAc7IWA
 OOdnk8l8ifJ1+Ha8H0S3WzdJTK4YWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260106
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

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- In atomic_check() callback verify and disable unsupported InfoFrames.
- In write_infoframe() / clear_infoframe() callbacks return -EOPNOTSUPP
  for unsupported InfoFrames.
- In write_device_infoframe() / clear_infoframe() functions warn if the
  callback returns -EOPNOTSUPP for the frame which is set (or was set
  beforehand).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      drm/display: hdmi-state-helpers: warn on unsupported InfoFrame types
      drm/bridge: adv7511: handle unsupported InfoFrames
      drm/bridge: ite-it6263: handle unsupported InfoFrames
      drm/bridge: lontium-lt9611: handle unsupported InfoFrames
      drm/bridge: synopsys/dw-hdmi-qp: handle unsupported InfoFrames
      drm/msm: hdmi: handle unsupported InfoFrames
      drm/rockchip: rk3066_hdmi: handle unsupported InfoFrames
      drm/rockchip: inno-hdmi: handle unsupported InfoFrames
      drm/sun4i: hdmi: handle unsupported InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 20 ++++++++--
 drivers/gpu/drm/bridge/ite-it6263.c             | 27 +++++++++++++-
 drivers/gpu/drm/bridge/lontium-lt9611.c         | 22 ++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c    | 20 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 19 ++++++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 46 +++++++++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 38 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          | 49 ++++++++++++++++++++++---
 9 files changed, 202 insertions(+), 43 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry

