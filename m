Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH0SKzyRcGkaYgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 09:41:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F3353B8D
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 09:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6935B10E70C;
	Wed, 21 Jan 2026 08:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TxMwatJv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRD+IsXN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2855110E70C
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 08:41:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L377CY3991357
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 08:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=yeMFdnZhct9ypef2FzFYAq
 U9V0XXunlpmva7L5DYImc=; b=TxMwatJvAWfEEezD9TQLcdUEnuNhAoQ9zJjrei
 I7IDBjvU0rv1leDvEXd6iVG+hzrGcktfwuhVjeUv4oVwIWntBw7bwSGysmZpCtpk
 FEpKXG34z6ObY1FIf6N40021MWgpXMdty7VAD9ON/lVI9NlCP6qunlIpAFjaFuKL
 JbreGAk8fxxL+UcNs4H11vjEr5NWB0EMh92MzBiLVotGZST5oAfUMGWQ13wAUiv0
 BiqsXY2EMKTCN5lSHuslHS6qxdX9jcusgSJxjuR2ks/n5cS5KbOwq9SFm0VCggu5
 N35Uoj5S9KHV0PuM55oWNFOwCWsSe8xUmdINZMy4VsqZe5yQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btpm4169w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 08:41:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8bc4493d315so1698354985a.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768984887; x=1769589687;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yeMFdnZhct9ypef2FzFYAqU9V0XXunlpmva7L5DYImc=;
 b=bRD+IsXNdA3BUBF7P3xyzzOEvsQAzC1la3vkbQjw+jKJ0QuSASgfuH8KH8TcgjkXx9
 6VYsud8vaMVO/myLgPws/B1K0f9FSDRWIb6NIf5jI3f72AZFSUsA1dFIK2AuqWNE6lga
 QtufGqvJ+otY7GBF+f/OP4AvvcJo3MVOwyN8AnODB7D6gN0dq+9HF4E1ryIDmpqAI5nV
 8bLrt6XAYp8oRy5hNtXEiHVbQxZ9LgNpuNFoOVYlRhcRBY0Gmqet903rcLKY7AZdubT9
 se8Dcbf9JxR5GcTevbVKgE32M3EWRijgDn8Gpi6ScIQ3IWp5DmCt16ToETfB0I5dhSNz
 UzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768984887; x=1769589687;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yeMFdnZhct9ypef2FzFYAqU9V0XXunlpmva7L5DYImc=;
 b=ffXd5d/anbMReQBb4XqhwLJbrM5TnC6bG88IFxOf/nlhfHLt5QAbx5tToYfwfMKa80
 No8sBg5xAu/1FGyNl10GDeKxgA0VGIaXGqnAl8c4C4+tHiPb9jCothI0zngdv/SO2BzM
 3gGkqe37L1Oq3bZd+pjqRao6FnRV65Y8W8JJBKjF628yq/KB4YUjxnGIFk11gjwPccLW
 LJwL+egbQRrc/2vRkWLPYxzTwTaRAoOkzHqlzpi5OepdumBYwgNnAirNNonL+kKghiL4
 woYgO5r/HOSxZR0lSZ/lYcwcamE55xCkdTML153oH8hpoQOASzBJXn2yrfv9v0knOGfc
 hM8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkJVrV+0XdshGNCaFAAf5NaDKYAdbNWIS9AZ0vmW9LBvb+uNE37YxUn2HfyZWA6NeP8NHoOWFiXUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAkuz334DMEKbvAw1Xzdw7xCCXx8EW2tsknAjQF9aB6Mv46C8L
 sSarglqbvJ8X/QKgG6tC9i3sDYzHdHhfuxExeriFmj68gwy6RCLO3CO2uCK7PsA1vgqV2NBJ5iX
 HRP3k+QjXI1c2NSD6hInvkLa75VindxaZjT4HDzzOJUvaR8cx4hRmDtr7KvQv5ZAr+XDm6/8=
X-Gm-Gg: AZuq6aJF5n17dfy6K9ixmCyHdH6q3OBFhka/n+ei8V3p6apfXpX5msOvPSTdylgsbdS
 wK6K05tLmeDWjdCReDGHCJnrB6lZG30w3hsFMRK/xLv0MWO3pz1wxUl3NdBQqKiW2cE6iXeHs9g
 9k6LFR78OqKMBK9komSzr4rrBrwllPWRxIUOExDlg28WP+Wjpb4Nvf/VT8wqVtgOs7yIG/VpX64
 OVBZ7p1D72ae+hWVJrsrUIQdZMb4+1rFFqSHNFhaq8WkZ2tfIW77uvBRubJTk77xe/9T1mXWhbb
 WgDYyOCKNXuSq3s543OVXMioAfOyzD0GGtpjnJjqpr2zOhU1+t1+G90d1FNlvYKTIZIuVbIZPL6
 czObEpYlzAk1f46if3pOj+wZVcXrckMZbM2X7lwhEpoHQVy0l7kYoWCRkh6umCfBJZJjEMtizs7
 S9erPORiV/UWm2CGuWkJO4NdU=
X-Received: by 2002:a05:620a:1aa3:b0:8b2:e1bc:f2a2 with SMTP id
 af79cd13be357-8c6a693b4a1mr2256020185a.54.1768984887427; 
 Wed, 21 Jan 2026 00:41:27 -0800 (PST)
X-Received: by 2002:a05:620a:1aa3:b0:8b2:e1bc:f2a2 with SMTP id
 af79cd13be357-8c6a693b4a1mr2256017685a.54.1768984886832; 
 Wed, 21 Jan 2026 00:41:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384fb8ff0sm44465851fa.45.2026.01.21.00.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 00:41:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 10:41:24 +0200
Subject: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADORcGkC/02NwQ6DIBBEf4XsuZuCrdL4K40HZFfKAbSgxsT47
 yV66WEOb5KZt0Pm5DlDK3ZIvPrsx1hA3QTYj4mO0VNhqGTVSFUppGnBbLV6SfQujonRmRAMkh2
 GppGG6SmhrKfEg9/O53d3ceLvUgTzVUJvMqMdQ/BzK0IO9xKMvM3wL29FUddKKn2qDRFSniZ0F
 in5lRPampSVr561lu36gO44fscVQW/XAAAA
X-Change-ID: 20260121-dpu-sc7180-ignore-gamma-dcff660aed40
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Federico Amedeo Izzo <federico@izzo.pro>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tGll1NZ1pA4+eOdvi26PS3E8EZix7M+Uzc8MRUn/cMk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpcJE0vJ9qnJj640jYv7D4WAB0CGmIqVK9Myr1L
 //sjjLua4OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXCRNAAKCRCLPIo+Aiko
 1ckRB/4xAwDRi6sP3JPena9Q9IIv04FnFRN77ZfySBh/iCCpAK26tMGdSCoJeID61W+rgMDiHXi
 J30FeyoZ3vmRQK1t5lIW9UYvhvG429IEqU+gSum2ZJeh9l7+ECI1eD5MCDn832HCKM2x3bFXRho
 P7qZQuRpPQ5CD+Do7Fj0zQvLDNsz8aH2lonteSFpzQcj1oZcdcLNdwRZx4fAXlFMClp2euOxWF2
 06f5i8xlHUjv2LuW+E0MaIhmU561tWQmsw5dGLinDzCDUa7kaf9sY8SvOzn+SSIvQ2RDJWE7c4C
 CiXx6wL5sQQHIQwfmmOhT3WXPnYZWZ1+gy3j5dM6EzPOmQvV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Jv38bc4C c=1 sm=1 tr=0 ts=69709138 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=k6hloDn7IRukykq9zegA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: -5bNlzv47bvY1BzNWGtBZDq3gHDFZjo7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3MiBTYWx0ZWRfX3PFUx0Icx9Tk
 n2KpAynMT1hprVAf0ML2ierOe8kTnbcvSlyQ9uoVAfEm2vo8/EbNYzIV2V65gkr/Em8bbqoFX8b
 RmB1/ETE7PlhFCcVAxqP/N4bhHLyRfZ6aHm0m8b8z3PtQaMdzUvx6qI0Z6H/HgbUX/gGnQNahu4
 omnF3BmE108qvyMZK3bEWRPlWrRicW7mZOyxgia/tcJ0vdL3npJHHxcfLvZHXlkfatFc+udBABu
 lC+l3gvl+Y7YCVdrkd+oTGZg2L9cXhYULPWDYIMmZSXNWF+tIKnlAjw7Zq0tL1hbvckvK7EEMq6
 HZP3Gt1Wcrd2fDvoDIHv1vJ7qW7Kiv9F6YiVkNC9/8qk7Ji89jnec7b1DSiQ8JV6DlxlYD4agbO
 Kf22bAbfofHfJQNJ8RMoVdlAPR1iyj4dMwR5JtvoNudKYDhfXB3DQxPn1s98wx6ZkdcWQd+r382
 kBP+5nuj936l309KmZg==
X-Proofpoint-ORIG-GUID: -5bNlzv47bvY1BzNWGtBZDq3gHDFZjo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210072
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 09F3353B8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It seems, on SC7180 color conversion results are not included into the
CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
tests. Add gamma-related tests too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is the fix for the IGT failures reported with [1] applied. See the
pipeline at [2] and [3].

[1] https://lore.kernel.org/all/20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro/
[2] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587979
[3] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1587942
---
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt     | 4 ++++
 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index e4a8f8352cd6..ae36a39619c6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index e4a8f8352cd6..ae36a39619c6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -6,12 +6,16 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
+kms_color@gamma,Fail
+kms_color@legacy-gamma,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail

---
base-commit: f185076da44c774241a16a82a7773ece3c1c607b
change-id: 20260121-dpu-sc7180-ignore-gamma-dcff660aed40
prerequisite-change-id: 20251017-dpu-add-dspp-gc-driver-c5d1c08be770:v3
prerequisite-patch-id: 7a52c31208202effb5cc4b7aaf6d6a75eb9a258d

Best regards,
-- 
With best wishes
Dmitry

