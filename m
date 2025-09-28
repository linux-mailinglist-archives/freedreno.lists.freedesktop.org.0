Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35CBA6AE6
	for <lists+freedreno@lfdr.de>; Sun, 28 Sep 2025 10:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6494D10E0E4;
	Sun, 28 Sep 2025 08:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMqOPF2R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AB010E0E4
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:24:57 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S4uvV3021744
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=rc2O4wz2Xp3rHoz8/mUbsM
 fKLduyX74HJKpJIAxeyFQ=; b=IMqOPF2RwTNjYzv3tzCtFIDfj53rMbYzw9zi5a
 Y9LeTo/S+tjjGF9oJRxXAfKeFY3aIlPfVF7ujyjbB4MuT9rzcb703ByiNhpuxby1
 qY0pQRVdJB2gbPUSLPeC/V20uBZlwzoVbN2DgFnVxwXKYzHQnBqoXB+3wj89AXTv
 T5iQOHTFezAh18vkMe3bQuChogXu+EPxkSeoMcBmKrv1gVIRYH6ojpNWd/7URQAt
 HHBtgI5Qh0P598ZSc0tiu+zecOUipf5VdRGswtuO7JomOBiXqVek9SRrPBZ1H2MM
 5uJMjr/0yRfOhNGRl7NkImgXclV789e+a33pyEW5mTgSz5IQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 08:24:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d9a3ca3ec8so69427921cf.0
 for <freedreno@lists.freedesktop.org>; Sun, 28 Sep 2025 01:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047896; x=1759652696;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rc2O4wz2Xp3rHoz8/mUbsMfKLduyX74HJKpJIAxeyFQ=;
 b=dBpUJcs2Y0aWNMAWolpovmTcXu+5fx+ux2Nqzkfprj9GCRLcqvntj8/1cJc2sg1fQe
 q3TS+idS+r2VP5J0tSZ/MWyz0eE/ue1QYyFX1XBHUG0bo67icu7WJs7hhCgCVRGxVhQt
 rq+lhdHwRLj1qXVq3cvvsXVJuZVqYR0l5bF9Nh5vLb5q0bZJ0Lajt8H0ne+5ZCHtwC+/
 HuDD1iUok7urm/3Ta2fnnd2kZHlZggk4XAt31KEvFmuWK9JrMZfCP7NGvRigM4mJggHW
 qUMWPhRYIropVWbcWaFDEoVGbiRDwPOZzuViGkA1theC7IklWqKms3X/QyheYk6Wh55/
 6MmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxHAawwPlVTqXbOpn9xU3l4C5Xj1ZBMP8xQv0VRfbNCEjZtdBT54s/NcZPnzbUApnCgzKpXsfxiz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaSGlBIt2U/Tq0i8LQBJOtJELcjp+igNSt2ExHhj04bBIxlBz2
 VXJk6NmkCEFPqzjzTG7x3N2Xw6zbuj7gjgJOLpIBwzeR1oKgq5VCLae1x81cO8+cSphZX2oMkpT
 VAKVGDDIwpoiTEozB/2c25HkHShNDLc0voxat3lU+zn99jWx7OUNYNmE4uZIIf2tkdn4roiU=
X-Gm-Gg: ASbGncsS9Tz7AwGnGOABzUiJhEYADku0/VoGLiGNincNfXwgQHHi+ftoG1aQNqmLoJ3
 obClMgwhR+YKHPBMbbhiDM9cdsQ+daL13f6pX3XWgN+tj/qjDU1TvGnpoSDpAZ/XETr9GuKxyRY
 rt4GwmQGdO3a01NZtb2DuXunxZ1mDNP+/ak/ps13UW/OVu3NAfwYMfEseMhm9VQ71HGpAdd2e6I
 eXOHA2kFCn+jRScTfuCu8NUw1P8j8T2UrSrXNn5jBnTQ3VlVU/rZnH+CXpGEEYudmuPgMtF0KGP
 /6PNJwEcHEIwjH5ke/Rb6OTXDMMwfCqtuTRXK2JsoZe6sjBGGBK5V065ONxzEbP4gGcyDo60ZaI
 EJ1QKFHXYvBN81ht8g6oY/NoNOwC6QnjFqrblWmrXpDsswiDlFk5f
X-Received: by 2002:a05:622a:19a3:b0:4df:194:b46d with SMTP id
 d75a77b69052e-4df0194c12cmr55268841cf.80.1759047895949; 
 Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSQGqS4aJ7VDAivVQk/ANpuwQy7ctS7IE9D3fgBdrHjHXtkW+JEen25AcKMFhLLPIqmo1upQ==
X-Received: by 2002:a05:622a:19a3:b0:4df:194:b46d with SMTP id
 d75a77b69052e-4df0194c12cmr55268701cf.80.1759047895487; 
 Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:24:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/9] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Sun, 28 Sep 2025 11:24:45 +0300
Message-Id: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3w2GgC/32NQQqDMBBFryKz7kiSEiVd9R7FRdSxDhjTZqy0i
 Hdv6gG6+fA+/Pc3EEpMApdig0QrC8c5gzkV0I1+vhNynxmMMlY5U+PEgRfkeYhD8oEEDVatO5N
 1jmrnIQ8fiQZ+H9Jbk3lkWWL6HB+r/rV/datGhZWrrdZtr6xqr1GkfL781MUQyhzQ7Pv+BWNgR
 Ue7AAAA
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
 Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXdpgIK2nMReHeFFkBUwQqE/S6v5i1Ns3S0QQzaiDpU=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTB73mP/OiC/2SDbHHGonN3evfKMNBf+mFV
 TAqz55+BLGJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1QGaB/dCkhCFXM3rS/LZOxNFSLK33p0eqjXUwRLj/k1HSm4nPT5ACqB10fJ3tODSDVscNubP0oR
 jfmyJiJzo6t6DoZD77G8Nj64HnQj5ie1loe2Gq8taQC/i6+qO0ReHUV68PcRZJ4/RjIU3SFWYGr
 B0zT0V5KzHabbu+gztU9ddfmCS5QCau8INJXipea8RT1wLTnGNAWjHjycLW4akzsWGYMGmTD3dy
 eYpOMrWIfTBaRqxQh18GUkTypkJLT/cx0JwTR2Tg040mVGp2fCpVCbTwweZgCSWyuuaRHRVeK52
 pmZkVNSrt+Wnj6FEnoqFtN3ELK6yNEwAzYWXHwb2GyWEDPE=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9j6FscS1uC-_-tXyBQ-GXWfYjooY6shJ
X-Proofpoint-ORIG-GUID: 9j6FscS1uC-_-tXyBQ-GXWfYjooY6shJ
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BiG78YgtQv3mHEaFN1cA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX9ilO7QVUg2Lh
 9ldKvjM2bTNnkrJY2jNUh48kdEeVZIdrIEbd6RAPgX5GEPF6kFTPbHF/TbaIUK9J9zgHNuLTdbp
 H+/v/MB8a6i2rx8JIVhSxo6mZPAlLWNHyp/9NIvqFwOIoqE8xWTsAqqdJG23HOZowSChIsBF/kF
 nen56+l8yBnXzZ9zcrF6qYxkgM09xdqbfsZFZhfxXxiCImNd5/hLgbWiobS/vxWV9hGn4IWtnye
 T52Eg84TRMGeqqqeq6cJ01AaDUrCTE6PyqYgmi2KfmqWk2cQm5d0aE5NC9bwpzUFlNOAgZtPTWz
 87rk/INuRVuJSofSz1lgdKjAVSYJ088RuAhKR8SjyZ5iYPNML/UtY+F8Kj9HkaB1AI8Sbj52QDL
 0sEK2hnr1jWz4s//8nq5kYZ8SemCPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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
Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

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
 drivers/gpu/drm/bridge/ite-it6263.c             | 27 ++++++++++++-
 drivers/gpu/drm/bridge/lontium-lt9611.c         | 22 ++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c    | 20 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  6 +++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 19 +++++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 47 +++++++++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 39 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          | 51 ++++++++++++++++++++++---
 9 files changed, 208 insertions(+), 43 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry

