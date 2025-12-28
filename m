Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CCCE53B8
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 18:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E9E11AE8B;
	Sun, 28 Dec 2025 17:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNjuVKYq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLSG7CVM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF17211AE64
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSBK2ja1937941
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=npwPiqZPrPU3R5s5/Q1G9H
 2LQKQVo5umALTPvs9VpAM=; b=jNjuVKYqLyVHeDRPDfJP4BL7ITLMfohoZXGubK
 njZ2OQY9In69Ksj9v8xbCatD7iglvaXSjQ0zAJxME5igWnxTopRbRXYIdzRIGOuN
 fQ1A11IMpsFQP3ipy8JmTU+nrKrEnJDHQXWyR6H6DhZSHckGHxwFb2gedQZMYfbM
 JhVpLdH4IAd74/fnMHK451q6b5A0ebZP0JEDlUUb1YEBP21zIDbB/Nh3ncHRe5vk
 zzyrxnVF5iyiluh2m7tSNgNDaQQzxaWP8thcad0rIr85a54K1sjBkkjZ29xsXnyr
 oPu5iTz8AXtrKaAfN92inqCwidyplmCmJ7KADnTGRzTbzmJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tntp97-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed79dd4a47so189034061cf.3
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942501; x=1767547301;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
 b=jLSG7CVM66lKqDOqHz/xOKqIEj0N64TgGqcmlTNyrl3JjQL546WWcxVmmB4S7PkKYN
 ZgIv5sr5wvY33ykT7Fhrew2SFFSWE1hAlZkqzYyHyFXovomd9yI8VgqVHEm2xrton1vx
 9rhoU2qD7tPYiJjWQp3sgXvJlmVd2tsaDj8kuIaQVODMTC6cz6VMJE+ueh5Un2nZlgD5
 ML/WG7U0tc/ljnGv3i7FPbB5DUAavsqxwnEh95Lhk1+25OzswoAI+FXQRCAzFS12bZ8B
 rU5E8IOszgfNKLEl6QjIEVffKKMUyntl2ufUL0k0ZQsywuUSKzlFv9+lewpukh0bxCUF
 0ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942501; x=1767547301;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=npwPiqZPrPU3R5s5/Q1G9H2LQKQVo5umALTPvs9VpAM=;
 b=j4/YBXwI85+Po5SRdjvbGaUa8azQJD1wjKuGdJ8R9bMyRcbnGV2ZII6a+Uc1yk+SJg
 bwPA7sAjr/caw+sNhmtDywkwh/uxohObMGdaTVe3BFmxEPRa6NNhoPx//zo91NxhVYI0
 VulCb11f//CXd1bk20CRlqD3b3qNu73G/bKtCOvVujhSlDpMPCY57w3AaB2lJW1nv1v2
 mO453XBbFHPr5Ok31CmxQAuezdwIsTjZl+aHP44uzLFBpk4UKMN6vjo/fzx/DC42PtWj
 17Ey+FyniMEyYwKOt+hU40PgHy2nE6Ydh56cb00ltKsnnQX9oSo994pQPO9L2lwBpRny
 KTuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIauzTbYXVbKl6sXv5t2T2oY6KwehE33mB/6LO7bzPFH8lBxRAFx1VlftTJLs5/I6hM/izfLHIHo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxSOLWfeXsm/UdjSRnbWPU3X3tmYcUAAit1EW3vEpTdltRdK09
 PVwr8jTpYq1ipcjHueEQEAXwYiX0vnyy+JrZ1g/6Zkp9xzmug0ulpXATffJzMfNr9oWjdnVA5Gg
 RbpY/F7anO9qqVD/ZVuWPtqDoVOT6N+mgfaH0diFq0k9wiiOuHf9QtCimJktzlOiTeOs5Buw=
X-Gm-Gg: AY/fxX5Ws4AYjAr9W0yNv30kRwOFkMemYePOdKLKQu7uZ4+M0ObbWXJO4G5Wzt0ppo2
 Hqd4yePEWPnXhpLhYTHKlSROKlbVPzy7fSgS/PBA+G257gUvb/irEgOwvT9qJ25CUNJ1sNlsHh7
 jUFueXqzsx1vAbElIVBuv1ap3dJTX1tgexQAfDdg+usi32ijAiVlWK9nlGOw0zqas/qGNoFkgj4
 xhRzsO5vXuK9YcGmmM+GDDjHuVMPQkchTQ2x3J7Y0Pb16VOXTzJvi8yF6kwybMGk23Be63pSY9N
 2Xq7GfP38+sH+P8WwlYiE0yE9vniOCF8cF/u+RKPZvvhnE8bqN6Bw7nlKHSvQFYUwyoRodkHDH5
 N3QExLU4v0Kmt9Ojv1O7TjUz9iVefT6fTe/8G8mybB5cAS/i4taiwqIM0WYDFZcIVK+3fKKKUtO
 CtEQ8LIHYBAkfc0Uc+IaFHwv0=
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id
 d75a77b69052e-4f4abd16604mr430244721cf.34.1766942500998; 
 Sun, 28 Dec 2025 09:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwPjyBUi1UQCzq/+IC2coGHTnCTbnWaC3MbyIVz6JKpNNu1oBmd8akd4pb25eofkn5Y3rA7w==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1c81:b1ca with SMTP id
 d75a77b69052e-4f4abd16604mr430244011cf.34.1766942500365; 
 Sun, 28 Dec 2025 09:21:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/8] drm: writeback: clean up writeback connector
 initialization
Date: Sun, 28 Dec 2025 19:21:32 +0200
Message-Id: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxnUWkC/3XQzW7DIAwH8FeJOM8dEBJCT3uPaQc+zIq0hBbSr
 FPVd5/TalKlrhfkP7J/yJxZxZKwsm1zZgWXVFOeKKiXhvmdnT4RUqDMJJcdH7iAbweh5D3g5HP
 AAkZb7nXnQhc0o6l9wZhOV/H9g/Iu1TmXn+sDi1hvn1uLAA6DVL3quZJRh7dc6+ZwtF8+j+OGD
 raSi7xjRP/ISGKi6URArqKK5gnT3jPmkWmJcWqwvY3a8Nb9w1xuGxc8HOnr5tvazNmKsDaledu
 EMsKYqn/9K2DC00yjl1+UvbV/fQEAAA==
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2948;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D3eLDF/ONraT+LuQe8030Tgbd5SBZ0lrgjEs8Csfuoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWchvMQTty0uidqYbUpbagdcXDCL/HNaNtTjc
 gXyLfXm79qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIQAKCRCLPIo+Aiko
 1dS6B/9v4YpvNb+8kATi0akALEa9MAmZaPvRBfo2I7SBnNWUTZs62wLmxz9qRqqQCfnQxeADXSR
 kwiG1sur1Im1iK1bk4XPHGEYq3DBHehmUGkjdUWCcts+Urt0/3qBWUscnAKUAXd+cKMx1EDpzMl
 HYSEdzZ+HbmSj5nXgs9nSONxq2uqKHmrg9Bds/IFFFR4oNHSYTjTL4xDNfII/WwBUbMmfnbhCwB
 MnsOx0g/aPtdaSn3weUDoE2KCHq9TQyml8iiAJkSEhl41yNBlbGf4+AQl5EAeah7MbDQ3IMrhRe
 RpISU1QfeWdCNaLXMpRQr3fq54fkXsA+iPtecT4mtcbnbZY9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69516725 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cFjmsF-WLDi_aLc5EnEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: _6-VsfjnjOoIjgsrVOsXiuu3vwGGRWei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX+VGvOsMPfpZG
 7JP2sDzdliUdRhUJxRR+v9a33mb2G6v/9piDy9X+92awPqZi0uha335vQHBJ6k9rJYvqOxkRE0l
 17pEvTu1AiZrJyVf5KpHyAnUJn0on1p5KQ/3uB5lVkFTyq43ZqTEhVF9he1WDjOUjvjzckEit7l
 TDqcXBxnI2IgoZQ1tER5Rzm4Db5WpP5CnjzGPDug8bO3nMtNoGvAi28JERFQlYjPPFJi+oLku0c
 AopafACMdqZ4On0soQBFBP3Md2BwhI3vlgdNW8zKulNgeL+jRfZWjQ9/Wa5izCvwJcR5ZUVAmgf
 WAppH/lB5t2dGvPDSHtymF19FdID1fYh6eZUhYsb9OIDgTM6oe/GUKVRIXfIwrUbYp/XBzRE73K
 1IyW49HCJr3wXlZEI4Ea2xPGHiU1HibRDR+MFixjawo1NiKCdASb23RxA96vElUxBbrEky83G+k
 uI/bIO+YM6AiuRgHM+g==
X-Proofpoint-ORIG-GUID: _6-VsfjnjOoIjgsrVOsXiuu3vwGGRWei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159
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

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Migrate all existing drivers
to use drmm_writeback_connector_init(), drop
drm_writeback_connector_init() and drm_writeback_connector::encoder
(it's unused afterwards).

This series leaves former drm_writeback_connector_init_with_encoder()
(renamed to drm_writeback_connector_init as a non-managed counterpart
for drmm_writeback_connector_init()). It is supposed to be used by
drivers which can not use drmm functions (like Intel). However I think
it would be better to drop it completely.

Note: Christophe pointed out that AMDGPU driver leaks connector memory.
As it's not related to this series (and as I don't have enough
proficiency in the driver) I'm not going to fix those in this series.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't mix devm and drmm functions
      drm/amd/display: use drmm_writeback_connector_init()
      drm/komeda: use drmm_writeback_connector_init()
      drm/mali: use drmm_writeback_connector_init()
      drm: renesas: rcar-du: use drmm_writeback_connector_init()
      drm/vc4: use drmm_writeback_connector_init()
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   | 18 ++++--
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++----
 drivers/gpu/drm/arm/malidp_mw.c                    | 25 ++++----
 drivers/gpu/drm/drm_writeback.c                    | 69 +++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  3 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++---
 drivers/gpu/drm/vc4/vc4_txp.c                      |  9 ++-
 include/drm/drm_writeback.h                        | 22 +------
 9 files changed, 76 insertions(+), 125 deletions(-)
---
base-commit: 130343ee6bca9895c47d314467db7dd3dcc8bc35
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
-- 
With best wishes
Dmitry

