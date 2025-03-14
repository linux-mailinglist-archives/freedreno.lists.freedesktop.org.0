Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44437A61152
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411FC10E9E2;
	Fri, 14 Mar 2025 12:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQB8hF/o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F12710E97F
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:36:56 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E9Y77m027558
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=xEFJu6kED4yenXLknUXHYh
 9PFvJ6uNpQTx9XfMT9RyA=; b=SQB8hF/oVbaJ95UUwHyqnukvaV+ieahASDf8GP
 J8gSZBKBpGL57vlcmmXUD+a8Sx+jbjslLCofHFrAal6tSBTt2XiWxEesv/wTPGvn
 rPYP7Vr3AISEZWuer17Ze3eiino+ag/O41+fLWNGSQfG5OA/f/7Bi1k3N5DQP4Bl
 llWRp18+xPywoWsPEgA8WwifYbwAr1sS1RfiDLNlTvWc/2QMAlCXZn+fZW4VU/kr
 Cp1FaqOxGGmdGgzCzdQEMJCP7RNEa8izByGxafLa8HWmKljD6eAipACjbcLzR7gF
 M4m5iVUbflrcv8Ti6SLSw/Av72E/+haVAmos5AZtuSP+wYPg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c6731pxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 09:36:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e91ee078aaso39877626d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 02:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741945014; x=1742549814;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xEFJu6kED4yenXLknUXHYh9PFvJ6uNpQTx9XfMT9RyA=;
 b=Pp5oHVDTL+tZDwo0hvVE2V7W4f7IjQguckWgArdzxIQU4mRkCd8lF7bqCqljZDJa1U
 yQYL3/iQE9vsnYkIqQVKUlHVqSizqqKpZGnJETl+NSAWVacksf3apJKRRsFYEN1r2MBF
 T7b07yzU6jT3FMeSe250+6E3cgAZU2zQbWbnOi1yNIdaWoc9/4RZj8P4WQ9IQs7lGvKG
 ojCsoiX2uHYLMGWG3AnsyBHJd7oGKK1E+FI8mwvJiziWYnagzRd5WO+vW3i9D+lK58PX
 jyzYgYtxwKusJIiA+EwGQSwnFv1btWTT5Njnv2fvconAaq9z8Ural77K6CVDM5KLbG2M
 w3qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCRtIg/1vk6HzDHjb0Qnf8ngZv5qJVbsz0u16mjQSGAR1k9RD+l4ZXO2YY4yPQPZIjaFraHKJV/O8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytKMBQvIDzI23E4WPpcyy906GN1HwUs8NKlHPHElNtEwYPVP8x
 IpAwoPySiUrhkJ/luV611ZSttov53MR8uUuBiKWjgptMLOiQpdCrt6+aZBUc/f4FXX91O1jqdim
 s6TvH4IrmBX0CO8DoBI5okfPQo5D9G/MV8wq+H+aI6ooZOY48D/0U2j0hu+5P84LXCWU=
X-Gm-Gg: ASbGncvmMnGC6VfHLcWu9AHbHQtJ77tYprrwA9q3qJBF6JzO1rDlgR4X6eg/CWlLgle
 rMidOifSaxUT1VmEoQqOpYoe2qhAj/ekOXcJtDfkqx+URQzqHpi94821zdlUTE/yFPHfumMbnjt
 sy3wbJ1VVQUI1P+RMnCd6krOQSmdLem8AA3aDsBVYfzB2HArs8BYoAqqiE9WG6lirswCT3eV8dO
 /dpiRVwXqcxt9kXXgoFjlDxzfJQjse5CpuNzNsQNW07NzOb5n1ciOjtjFlh1MWwBgDezhoEcc1/
 8LAy35byz6Lw3xDm94qhAi2HPZhGAFuJCDtBygn8ogUD6iNWCz5lgz7qJ+7/tXFP+IiYFCsWrrt
 89j3z7VjSlqbiCWOIfTxwYfkuHyk/
X-Received: by 2002:ad4:5def:0:b0:6e6:68e3:8d84 with SMTP id
 6a1803df08f44-6eaeaa1d193mr24468656d6.18.1741945014143; 
 Fri, 14 Mar 2025 02:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUVgEL9hrI7NXwzP4xolE1ykXkDDf2o48ywvePWgyi+DCZbRXuwlcVbFzwbvCLgMEnJ0WABA==
X-Received: by 2002:ad4:5def:0:b0:6e6:68e3:8d84 with SMTP id
 6a1803df08f44-6eaeaa1d193mr24468326d6.18.1741945013749; 
 Fri, 14 Mar 2025 02:36:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 02:36:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/4] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Fri, 14 Mar 2025 11:36:47 +0200
Message-Id: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/402cC/3XQwWrEIBDG8VdZPNcyjprEnvoeSw+a0c1AGxfTh
 i1L3r1mL00TevyE35/Bu5hi4TiJl9NdlDjzxHmso3k6iX7w4yVKproFAlpAaCRd5UAfLP0XcZb
 KkksUYgguiWquJSa+PXrnt7oHnj5z+X7kZ7W+/lealQTZea+M73ogQ6/vPPqSn3O5iDU145a7P
 cfKVUOhiSEhpnTgesPVgevKDTqABNoEAwdufrkGtedmPR5b7cgn7Pr+wO2Wt3tuK086RFS2/mb
 b/eHLsvwAM/REOKcBAAA=
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0lnm1GJCGsxhP/KdiWVnCi8fZKi2B/6ZzRNe13K9nc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixPim1tzMzoF7srtpwz4JAoHWG5zEfl7jzO
 Q6vMwzKgKqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1dizB/wPfSsLP1qY1awkJB4RwcyNg7yxgR1l+UDKB8XlLClJ2y4VPTUEPztCeacm5TuN1jKyZ9P
 fc1pF7vi6OxLabv+YADsUUMemzeMHeBvsuNE0Q9BBPr/C2M5nUE3Vfb3pMBoVNc9LjfKyjREgmI
 gEHchFcEWccXE8DyLnFWqqyG25wbynBYrSg3H2YdUiv1n9oXsfb8KUa/AP+aKfKczcdxZUw1l2n
 xO8t+OQQwkpdayFyH3KoxIUH4dBdbsFAaApfHABPcurILp/SIUCvjOgRk+RI6zZStDC9zvZQIZ6
 NUy3GHtnZKjqiSGFk7rCLizKvT1Cq9CEzDEY4A0sB6vZJKuW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3f8b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=mOMMeWxa1wVVc0mUho4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7QDcqGOMUrlmrHOicDzqxyNb894GBTpM
X-Proofpoint-ORIG-GUID: 7QDcqGOMUrlmrHOicDzqxyNb894GBTpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=995
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075
X-Mailman-Approved-At: Fri, 14 Mar 2025 12:33:27 +0000
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

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and MSM DP
patch via the msm-next tree.

NOTE: The first patch now depends on the drm-misc-next _and_ msm-next
trees, as MSM HDMI driver was switched to DRM_BRIDGE_OP_HDMI. The
easiest option is to wait for msm-next to be merged to drm-misc-next
(through drm-next).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
  callbacks to the drm_bridge interface (Maxime)
- Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org

Changes in v5:
- Rebased on top of linux-next, also handling HDMI audio piece of the
  MSM HDMI driver.
- Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org

Changes in v4:
- Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
  HDMI driver.
- Drop outdated comment regarding subconnector from the commit message.
- Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org

Changes in v3:
- Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
  (Laurent, Maxime)
- Dropped the subconnector patch (again)
- Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org

Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (4):
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/bridge: add function interface for DisplayPort audio implementation
      drm/bridge-connector: hook DisplayPort audio support
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/bridge/lontium-lt9611.c        |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |   1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 160 +++++++++++++++++++------
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 ++------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 +----
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 -
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |   1 +
 include/drm/drm_bridge.h                       | 122 +++++++++++++++++--
 11 files changed, 268 insertions(+), 219 deletions(-)
---
base-commit: 613af589b566093ce7388bf3202fca70d742c166
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

