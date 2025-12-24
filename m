Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43363CDB040
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 02:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190910E2EB;
	Wed, 24 Dec 2025 01:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy1JAWIw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVnKhkhK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A84110E2EB
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:28 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNNjtPd1924369
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Qy1p7dz4KTgtjDJxH7zF/s
 /gw1hKlABNOIK2uPdIh+s=; b=Qy1JAWIw5RxuLOv5JvoPQDQ3fp2u1Bt3JcmncW
 eKmUgS6Ym8+vieeKqVJzLTpZZSTHiDCrqEvyKQDTe1lZ6YKVl7Im6YwwtdaUHVuI
 vm5KPTtIZT9tBcv9JEaiAtWz37t7lchbtbti2t6D+xYTMPA6v/6W4QAKUHXQMuG8
 7NUFdw/gT45rzolt2V9zL7KnSFGWM7MwjyvYjLh/xseR1yTYTCCLhrPY2Re961RN
 +2DeqPhnzjcP6Mako0ao8Db3AJO5qxu9UsjuM1ICh7xNMIJHbRtAek5E43CbeYnY
 YpcwpAXRwKi5kKtEG2XRunwQSnQXi3OEnVOXNFWJnTmXyMPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9agd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a2f8e7d8dso144835786d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 17:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538207; x=1767143007;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qy1p7dz4KTgtjDJxH7zF/s/gw1hKlABNOIK2uPdIh+s=;
 b=eVnKhkhKAYvi6jm4M4EDP+h7zareEZtRk/CFLzopma5mrEMfFakdfY+kfIybSDAq5P
 CfgWsHzBDP6+qC2l9OWX6iyY1wiiU0TYzKfnENpK72GgQ5X4iEBlXY3/T7RXsMBorj4S
 rIo43YstgoE/iGAazjdRVHGjMM1fvQjsoZ721e508fvNAv2sEJWE/7Id/46Dw4N+v0dc
 cOH8OTdV8ht59sd9oSqmq0OL+gdb39R9xI5QGJMf6IHxbd+gDFHZfVGY6cE2hburlcJh
 bKXfrL+vpi6YfZIkOghzxlPYf5GnL2DLQYQ1yZwFlnSs1sZUQPHjfIikY4ezmrEFG2x8
 KzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538207; x=1767143007;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qy1p7dz4KTgtjDJxH7zF/s/gw1hKlABNOIK2uPdIh+s=;
 b=fmaVbnB6XC6vQd4aYOv5HNl56Y9xc3BQwVKnF4NWdMm1oXUFaoj88oEUGY4WiWSU/l
 f55NdLfA3kCabwVOsNhqyYwVElTwrHc2kuul3I7O28F88md7hXLRQvsTchY8P/1SUu/u
 joSOOWtBRUIfCh7dfJmKYXMkMja/HHdrlJ/5XI0eglt2Kk5AJjc9yRR62lfzKlb/AkeX
 17S11G/bvBAumQKuk8Pq1nLkHkTESl9pVIf5wufPLUjH32fI0JcG2I/bb4IyEnPdc/qO
 Qcd1GqzYEQ5uUn2dvY8KedOkN3P13YliVbX3cTnrzx/uzHhtI71T8/O6ASC6KiDK/W5j
 1WcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1TvoiLzzGsNb2usbCEAcWD9gvCYvbmTQJ2mzC6FOYhb21kpxc3tyVr/ys4hUvCZcHVw3KLdkIxeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsf9FyRt2CuhjDj6z6JMVqGNhkp+hdAfSDBR/h5xoIG39o2lv+
 9r/3n3SVz1iY0wnqH/1fFvvhZRBBJ1fS2lTYa6HX+PkraUnymGAVCCH72Wo+wZkuLJE6gn9Y+/Y
 KImu8KujkRW8YUTpt95yPeo9sZRF64Y6hJF/LBgJa5EffT+O6LS74WZFUM8xgGOa4pd5213E=
X-Gm-Gg: AY/fxX7RAms/zaM5bB6qiUDd2vsoiQMyfgRnCINGxwLoUWqUrdrzm6CRZdkhxuDFn43
 E6Iqy1oWtvxISv1XHqjthcsPiZJeVaEx9a4OoMUei9Yss/utvQHSAQYEF1lsy2Kz9amfQ1heBEE
 In7uXQP0mgcADCpqayin9mHsC148fEFjLMTuM//Jx2o0FTGXW744aTeZCNUJi05voNqr0J+vXR7
 uwOTq+XkWIC1QYHW5kqqCWHk7q4PZDd3GquM1u24bZhHOR4cTjMNhoVTH6VKXLfhEwY5k6N2bkh
 uJIEh2zjyEIP+iXwTf8vM6prF5MQPfSOA5J2yQgRMVdP0J7ROimDu4h3v2mfHigLVyXjoz4VrVE
 lUge7dya0jYzLQyjE8Z5iRByTckbHCguDRmB7hGtbIQnSIGNz96HRPwiRq5TvHM7p8W5RZnIO40
 /gGCE1PT5o7+MHn7AUD+QsdcI=
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id
 6a1803df08f44-88d833b5f7bmr300845956d6.35.1766538206531; 
 Tue, 23 Dec 2025 17:03:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpimNXfH3oYorddWUqgTrbXV1EPp13vtXQqLBq5K7iNXJf5pz619uZUKkotZ/5noUnChRCWA==
X-Received: by 2002:a05:6214:f0c:b0:882:762c:6b84 with SMTP id
 6a1803df08f44-88d833b5f7bmr300844926d6.35.1766538205726; 
 Tue, 23 Dec 2025 17:03:25 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Wed, 24 Dec 2025 03:02:49 +0200
Message-Id: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALk7S2kC/33NwQ6DIAyA4VcxnIcBFJWd9h7LDqhlNhHZwJEtx
 ncfetrB7NLkb9KvCwngEQI5ZwvxEDGgm1IUp4x0g57uQLFPTQQTkilR0xEtzhQn44zXFgIVtGp
 VAVIpqJUm6fDhweB7R6+31AOG2fnP/iPybfuXi5wyWqlact72TLL24kLIny89ds7aPA2yqVH8S
 s2hJDbJNEaanpWClwfSuq5fUggn7AUBAAA=
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3625;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8Tzjobm822RrqnHK47PTxRb1kubRyL6ECDVZddDDmG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvXIbwsPmKZGaTML8UxKouye9UbF18LUF9dB
 OPRCcT9gdmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs71wAKCRCLPIo+Aiko
 1TjRB/46NUvByKDGyDwWo/bdFXCvMaCYCrhtMnS2CnzdVUkBWOQJlGAUXoB3wgO8QCfRpICSP2W
 INpd5UxrZkAO42oYeNdfDx9bRfJlcwUtxLc7db6mthobHJmKl+I5N0AfogED8Hvx74hjRSCWqMq
 0grAUH6HRdRV8dnY514V1FOVRkeFgLB3TZG9iUGZb1sBJL0psbTYtrX5Bm08kmyA233ESSy+Yx/
 5TfM2F5sL/SA+jPiyyJQvV2vEMXoBYQGoTe6Lf+FK4s6VRPPxlEqKzNwHl7dibcDXxpHkQxTISf
 uj/97ZaUsT+ooSkpOia7cPAXHcz4hjmR1XSw4mh/qatb3yss
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX0mwaqvnZk1YP
 p9uNwpIZ/q1wD9CJgwvUF903hApDvnkC8mJN2u7VQhZHr9HORo/wBXzDgthzr36uVJH6KArugz2
 dkaokHmoXvnEDUHeDTc5q+UI5BALslJa6+Sq33ZfJS38pE5C80AYu7ShPUHAAvweJn0RaFyyLOV
 Gxfnv5gvqmxWn0PNHZnFyCePLKStQ1aBg6EVBLoQtjMZ4DLHohBnZnUlYIxKENWtL8DksqWd/Y4
 yFoAqH5cpoDG3u0Tl5KBDXN+jHpk2gcT5+UnrR9MDvzKp3Tw8rBfJ2pmi1UQniWBL8elVFOnC3a
 0cnAtWmeSniPkyqbPrJ88UWzcy76MQkD8baq5ZhHxn0pcm256QgX45NTm5HFJwxFhx2m8aqmP+o
 E31NduG4N5Zyy1HZxWibCF+WcY+slF3Jp35CEe02tLDT5SYRJcV7SuNqCQClEcfRWsTCwZib2qD
 oNOV/tSYYDPJQPNpZoA==
X-Proofpoint-ORIG-GUID: 1BXEOIERkpXss7aIeVck1H7Lr5FSqH7c
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3bdf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cAKecciHRQCNmb6kppMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 1BXEOIERkpXss7aIeVck1H7Lr5FSqH7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
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
- split function interfaces, having a pair of callbacks per each
  InfoFrame type.
- write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
  for unsupported InfoFrames.
- don't create and enable unsupported InfoFrames.
- limit debugfs to provide supported InfoFrames only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Added DRM KUnit tests verifying InfoFrames behaviour (Maxime)
- Reworked the patchset, having per-infoframe callbacks rather than
  extra flags (Maxime)
- Link to v2: https://lore.kernel.org/r/20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com

Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      drm/tests: hdmi: check the infoframes behaviour
      drm/vc4: hdmi: implement clear_infoframe
      drm/sun4i: hdmi_enc: implement clear_infoframe stub
      drm/connector: make clear_infoframe callback mandatory for HDMI connectors
      drm/bridge: refactor HDMI InfoFrame callbacks
      drm/display: hdmi_state_helper: split InfoFrame functions per type
      drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
      drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
      drm/display: bridge_connector: dynamically generate HDMI callbacks
      drm/debug: don't register files for unsupported HDMI InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 180 ++++---
 drivers/gpu/drm/bridge/ite-it6263.c                |  95 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 143 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 110 +++--
 drivers/gpu/drm/display/drm_bridge_connector.c     | 190 +++++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  94 ++--
 drivers/gpu/drm/drm_connector.c                    |   6 +
 drivers/gpu/drm/drm_debugfs.c                      |   7 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 110 +++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 195 ++++----
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  47 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  47 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  42 +-
 drivers/gpu/drm/tests/drm_client_modeset_test.c    |   3 +
 drivers/gpu/drm/tests/drm_connector_test.c         |  19 +
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 525 +++++++++++++++++++++
 drivers/gpu/drm/tests/drm_kunit_edid.h             | 119 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 105 ++++-
 include/drm/drm_bridge.h                           | 127 ++++-
 include/drm/drm_connector.h                        | 105 +++--
 21 files changed, 1762 insertions(+), 515 deletions(-)
---
base-commit: e05b08d7d0162cf77fff119367fb1a2d5ab3e669
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry

