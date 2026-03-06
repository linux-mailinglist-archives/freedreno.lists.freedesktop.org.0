Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFAvOcpZq2mmcQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 23:48:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E0228638
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 23:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9133910EDB8;
	Fri,  6 Mar 2026 22:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpjziD1q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPp5yxh6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D9D10EDB8
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 22:48:38 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626KWXd12623969
 for <freedreno@lists.freedesktop.org>; Fri, 6 Mar 2026 22:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:reply-to:subject:to; s=qcppdkim1; bh=oMUaOh6YZEwrJ
 P6PXRf60XJBVPb36qvAj1oolI33MWk=; b=ZpjziD1qM2MB8Z7mx4oo4106BiG6x
 EgiujczrfDPgrCv5CrY43YLSUxPeDNRwPb3s9b5ZsLA5U+HaQPJpQm4UT7qc5V3v
 HscwjdyVfi7I6JKzGqYQ693xSzSZGrPaDpo7GiqgHOGc3rZmSK2iSOIOx5Q0AZsu
 Gv4nEEzLhSso4cFISEb0iHOWGxKIkkCeiznqC49cFhRhdWVw1eLxDWKXKrKLLJZC
 FfylnibA5QLXDLSTLH/TCU/ytTqNdDvPFa5SYD3w4DvakaP5tt9IJTdUSYAzIK06
 c2SW10BPd4DkHMuq950rNp1j8n3UJlhOGURpQAcx6PUlmAgZG5FMM+WQA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ajfe4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 22:48:37 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7d496d080d8so59023124a34.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 14:48:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772837317; cv=none;
 d=google.com; s=arc-20240605;
 b=cF03oamrVK6DACPNrwwY+HJz0ePEqAgKsxyOGz2ddlSNMeQJUo5vl6AmjMmrzwHZHY
 J7KI9xtJVzUQHcRFdVi27mOlxywB1lzfsCrtSGgJYonB6rCjZcHVsormFVGdjCf6nIAg
 wMq6QQlQX306XK5Jraq0kRx3k26QieAGaXoAlPxGrN5GuBEa0wnb+mgUiy5E5MBw44+t
 xdGaMZ7ixGgZgwPhsBMw1tWxIXPmkgP7I0Pk9kXXMqTq+sf8e2t6zAgctKLvrmzZjLaf
 4UieluMBNzyM2q2TZ/Lr0xax1Gaf/7K5wrhT/hu8oo1dW3xNzYl3uc/sL5bgMQOFzPqB
 Np8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:dkim-signature;
 bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
 fh=z5GxzWDQLlLN5uyCQEdGFEZhe15ro27LIhTnShoReAA=;
 b=FnYoqjH+2GH5baCZlFM6OccZc1Zx+Dz6fzD19chMncAEwUkbK+0BmGEiU0bXlJqCWW
 6Y9uFI+nRX4MvyKXHl+bXsVSBKe2crz4AmQX+b8IZi8CB5HoWL4lsPULmpu0IGWI6Lmh
 +o9/R7UeYG9CUCiMXO7G7deln5sV7UbvIhzGTjvf+CXyh7YB5eqz5PlfYTwGHEfGvJln
 MQWnMlJslm8QXnuyaGvDgc1oq7jfml7qiVOB76vYLxdyuFKiADbKkEt/FFflOxS0cY4j
 LGddpsjllc5brzKbbln5ysxndvjVbHMyLObrHfSvYWfLK8YUjb1zai/onp74hBYb2WYF
 5Icw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772837317; x=1773442117;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
 b=fPp5yxh6vj5kFHw2viazSQoIFNMf03f+OfQSB4b0Be+KWDv6z9aPCXRwrlAlGjlpO3
 22TQ7W3jHu+1sMI2/0v8bJm/3+IHBbJim8zLar0YGe3U77FBE/euk38x+4Uj5rDQ0rEz
 xviH8rfkZNhFsAdSejUhh09Dyh9M8NJ3RsqIfRgq7CdpcBzOJjjYdXNeBhmXl5ZUC9Ul
 ZnB2D+Js+NX+0Ep2WvINL2h2os2mC8dXftM9ysT8ky0Gr/AjI2JSpHRJM990Dowo3kxD
 HAwmbeZEIjCHvgEUJIrp0OzjxynirLxNGb4fdnjbYcUgJKSF75NT8RDDQmu1JIqdJq+F
 QkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772837317; x=1773442117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oMUaOh6YZEwrJP6PXRf60XJBVPb36qvAj1oolI33MWk=;
 b=Ey5Hv9UkAQsK6nIYcqIRBA01nXGVfvLKBgPh/OZkUmfrv/k9YCvte8xmHUDfYeR4vi
 osJu6BmG0lUBaZ/01XD4A49QObqEgjaDe5qcvh6vLLldxwsnahsOgbLcFhfTPf/6oruw
 EbY7Wm+cY4C8GGF6rX1axjynJvWBUuT4fNLVeM8nezN7qCpQCUQPQ4m+9Gxlb6z1gsJ0
 oslUc/b+ThZLzvce1ZG/YYEEGn4K3qjdabLB56y5WOE5vXAGX/PhwIY1LtjJ9vkmEa5S
 5yhyjnrHcri9ipYdxLxZAgVhhyueWsri+dF6dpvErigqm7xAFYrE6zAwdpOhBoDm3lRO
 Datg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgjEpe2zD4beKm84qiH7VWDAEkytIbfA4H1ZSrdV1h7q7VZHbDeCqy7PaxzgTYgNWrWZYd1XY8YOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2xtMdBbQCHpEa/82qvCfeDs1WNYhUanTCLijetCQ3qiuqQJSb
 OGG4/bA4Ji1xCiqfByvxTQZumphrrkhwMloy7Ms9JZx9SiC3JUJh0jOUP3eTDE9CI2HqJ0cstCQ
 K0DUU4gwMFzeox/5gvBYuQthCxE7n2g+suva3pRxbCWPBkUn467tcfDThVqrSbSETRuYIX1qn3o
 wuYOSYzq4fanxWWPYFlIH232XdsNpV8aYMHlgk4UlB1wt3Wg==
X-Gm-Gg: ATEYQzy0cgQr14xv/c2iXHEHoVQZRTCleclI+a/T2SyvUev6XreBZWfvXrsqq9LsUyv
 P6Xjs8wnXXuSMSfzkTkfyZwf40jSDmHYNqhvQ7Ciu4AQBK4GsL9JQJ491jO6i/r7aWXkk52WcII
 G5+zhPMkFBwX9Or+pZyK/KCdcAuUFBjOk/P5f7W+taJmlccXNKxUezeiorTSVPN6uyh2wVSa85I
 4QYEUtwILTXXAT5GU/gcxxZDYFTMLQLn0xHRQ==
X-Received: by 2002:a05:6830:438d:b0:7cf:ddb7:8823 with SMTP id
 46e09a7af769-7d726f574d8mr2889561a34.11.1772837316942; 
 Fri, 06 Mar 2026 14:48:36 -0800 (PST)
X-Received: by 2002:a05:6830:438d:b0:7cf:ddb7:8823 with SMTP id
 46e09a7af769-7d726f574d8mr2889524a34.11.1772837315626; Fri, 06 Mar 2026
 14:48:35 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:48:24 -0800
X-Gm-Features: AaiRm51AYeoEkufoXsxcQxnfri5PKTYQMm_B1RWY1_hpBCsJBI4B6OiBJNeEwpI
Message-ID: <CACSVV00wZ95gFDLfzJ0Ywb8rsjPSjZ1aHdwE4smnyuZ=Fg-g8Q@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-03-06 for v7.0-rc4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: fmN_6j06v1knf9Q8RpQbit7jVeBecojf
X-Proofpoint-ORIG-GUID: fmN_6j06v1knf9Q8RpQbit7jVeBecojf
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab59c5 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=_-K9eTw_oR7D26KFscAA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIxNSBTYWx0ZWRfX3qRZYnJeIHPX
 N++PSia6htv0MnsRXyFPX/VsJqEhkHOawSV95PunH/d2WQ1IeoQ4Av/BfbNTLwjyeWtyTcaNIZc
 1pO2Zy/rgrzLqxFBeiQeIMwzm9k2Fz4iu6a4noMzKrE3SS7mbM0PABAz/akirNOSkZy1RNmMChA
 7ChLYozOR4pY/+j3vctqxec0RR6zN5qJCtn9T3PMfQKMud9Ei/6OkaOg0PO4cfkZfu/V9+HJTqh
 NELStd7qcApTPgMj8I/O4LZH1BEIZiAOXDaPxHNl1D2aofw7e1fUc2zW9bvAnrQq6LkidmJGNgh
 X8iboO+/HQzwxOTXh0Bi7MrFNMKmEzpk2G3g2LNqwEEQvM5SiUdw+BalJ8ClqrNBj9fnY/NgZN2
 q29plmLpZRrFqXn1L5f9y4LzfbAvrdWrebMq50QaGxIkwtCvtVpBIlTW2J/Kh7K3dvoROSiaDs0
 i1pqqHFbnIn83TSNPew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060215
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 528E0228638
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[freedreno];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for v7.0-rc4, as descried below

The following changes since commit 50c4a49f7292b33b454ea1a16c4f77d6965405dc=
:

  drm/msm/a8xx: Add UBWC v6 support (2026-01-22 01:23:22 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-03-06

for you to fetch changes up to e4eb11b34d6c84f398d8f08d7cb4d6c38e739dd2:

  drm/msm/dsi: fix pclk rate calculation for bonded dsi (2026-03-06
20:41:08 +0200)

----------------------------------------------------------------
Fixes for v7.0:

Core:
- Adjusted msm_iommu_pagetable_prealloc_allocate() allocation type

DPU:
- Fixed blue screens on Hamoa laptops by reverting the LM reservation
- Fixed the size of the LM block on several platforms
- Dropped usage of %pK (again)
- Fixed smatch warning on SSPP v13+ code
- Fixed INTF_6 interrupts on Lemans

DSI:
- Fixed DSI PHY revision on Kaanapali
- Fixed pixel clock calculation for the bonded DSI mode panels with
  compression enabled

DT bindings:
- Fixed DisplayPort description on Glymur
- Fixed model name in SM8750 MDSS schema

GPU:
- Added MODULE_DEVICE_TABLE to the GPU driver
- Fix bogus protect error on X2-85
- Fix dma_free_attrs() buffer size
- Gen8 UBWC fix for Glymur

----------------------------------------------------------------
Abel Vesa (1):
      dt-bindings: display: msm: Fix reg ranges and clocks on Glymur

Abhinav Kumar (1):
      drm/msm/dpu: Correct the SA8775P intr_underrun/intr_underrun index

Akhil P Oommen (3):
      drm/msm/adreno: Add GPU to MODULE_DEVICE_TABLE
      drm/msm/a6xx: Fix the bogus protect error on X2-85
      drm/msm/a8xx: Fix ubwc config related to swizzling

Dmitry Baryshkov (1):
      Revert "drm/msm/dpu: try reserving the DSPP-less LM first"

Kees Cook (1):
      drm/msm: Adjust msm_iommu_pagetable_prealloc_allocate() allocation ty=
pe

Konrad Dybcio (1):
      drm/msm/dpu: Fix LM size on a number of platforms

Krzysztof Kozlowski (1):
      dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo

Pengyu Luo (3):
      drm/msm/dsi: fix hdisplay calculation when programming dsi registers
      drm/msm/dsi/phy: fix hardware revision
      drm/msm/dsi: fix pclk rate calculation for bonded dsi

Thomas Fourier (1):
      drm/msm: Fix dma_free_attrs() buffer size

Thomas Wei=C3=9Fschuh (1):
      drm/msm/dpu: Don't use %pK through printk (again)

sunliming (1):
      drm/msm/dpu: Fix smatch warnings about variable dereferenced before c=
heck

 .../bindings/display/msm/dp-controller.yaml        | 21 ++++++++-
 .../bindings/display/msm/qcom,glymur-mdss.yaml     | 16 ++++---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c           |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  3 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 14 +++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  1 +
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 12 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 12 ++---
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 12 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 52 ++++++------------=
----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 43 +++++++++++++-----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 22 ++++-----
 drivers/gpu/drm/msm/msm_iommu.c                    |  2 +-
 19 files changed, 139 insertions(+), 109 deletions(-)
