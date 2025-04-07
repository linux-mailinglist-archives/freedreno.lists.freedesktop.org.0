Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB95A7DE88
	for <lists+freedreno@lfdr.de>; Mon,  7 Apr 2025 15:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C25110E45F;
	Mon,  7 Apr 2025 13:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6DAHguz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A886610E0F7
 for <freedreno@lists.freedesktop.org>; Mon,  7 Apr 2025 13:09:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378e4px028420
 for <freedreno@lists.freedesktop.org>; Mon, 7 Apr 2025 13:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hAFJIGd25SE14xpwa+KhUSRa80h97UsYN+TeQKpPB9k=; b=g6DAHguz4Gq0/Frx
 Mz1CwKecDhKrpZn6+rg4Xq9oRH/S3CdY2l1ELTu0/ex2PkqC5IVXTsPYh6klLHKi
 YRv0W1ToJBAz5/8kpaS6Rm+ifSI3Wam8NA+Lmk3bxNoAfgKpXmu62++ZFJLXghTV
 K4Dp3tCgQrD5ImfBLRQ95hV2s9KuRbHu6K0VaJ2ZYv3nXRfrutNn99fZ+V4L0z+P
 B2BpE8Dq3X1a5OvaiDlllrN6/8zaXXJguUOEYkficfhZ7SzVfCYyMCGcLk59+ZPa
 i3jpvWBoQa8k/h2x+53IsY8jj9U0GK++z/pfqIRA1UVmnS8ZzzyJnn00Uv7UbW44
 GyOBDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyvap1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 07 Apr 2025 13:09:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so419832285a.1
 for <freedreno@lists.freedesktop.org>; Mon, 07 Apr 2025 06:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744031347; x=1744636147;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hAFJIGd25SE14xpwa+KhUSRa80h97UsYN+TeQKpPB9k=;
 b=C3yLfP9D1Fy3UEhhxIoLUpEm/g3FowARSLFLdv1NKQOYDSIOt6T7jf5ZyX3aaZ3Q+4
 MC0XcT57e6NQ10jCADwjF4P4uEyW4mr+FmSLDCF+L0LGf/A5jVLv6evqhZDJMIJpB9xq
 6I9O918N/AuGt9bYbgoe+NVStNO1PPZizMZhAS6gOTwpD/aUKUqMdvFGkDyNK6x2BAbf
 me2LUGzETbdbaoyJHAwy162c3dGruwzE2JvKcK6FeVXT0mDEaZ0w3jAdh4SFkGFs0b8m
 QhlAFlHAf+qLV151y+BCIX+x3p8ilWDwAB/Vp2vg2Fi+bmTzrajEDvrRXsw7kRydzld1
 o/gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSS1ngoH9gR7QiZaOT8RRjmA3OyR+MVr9ehKs8Bnbo9QVERa/uf6g3DIxbiTtux8E6NnwTsFIi0es=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8zej9p3ACP1J3MNa7dMgXLN4X7BEpo+KGKf1y9j+ANfZ3Kwbw
 skUg/xJdH3uJe3CCsWDqBieu5qnSvMkLw9iJVtqHfmU0gG1nN3bT9ItoChOeSWPjU2Pxj9V+fPx
 wcXSMXv7AYp71rvmmK3RzZP7E2TZTbUTgjPSzbGc7WlB3SyWmLovVjrfzgFS3jHplWCo=
X-Gm-Gg: ASbGncsLPT6IHtpHF7sUGn/STYDcQ+44RJiOwXBO1e7Nd3V3S1ZYCASMFWXKG+Dm8BC
 1YA073f1OiK0l8/hehaOoYvTlqAJQKAsIWu+tVPoPt4n+hOXL2nBu8psfz+hpqvI7q6ApBJYjFg
 H+Jep5DbFsLmFyNI82j4psbrj+EX7LcDz5q63BrRmLzMhi1F0hhMECBHe7ZhZQ3OA371Cir+8CA
 GOIL9vmoi30G1L36ULFs8Y8DRnyvNQIMJ+998YJXs2yu85RFsDDRSklbcZdEPAowLOlmAEx/L3Z
 YhogENmw3uOTCmRq1aVeLfx2QSvcFp5QgGRPRrJ9ajcSw0WffO6WQpZSCiWkX8BsKnYbEKw21dS
 9jkk=
X-Received: by 2002:a05:620a:24ce:b0:7c5:e226:9da2 with SMTP id
 af79cd13be357-7c775ae9e54mr1621401785a.47.1744031346750; 
 Mon, 07 Apr 2025 06:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe7KohhBIGgD1fDaoNscLqxmlrmjcjcccMAiZ1cn7+YLrzEZrX0CHRA3Rk601QkVQkjPsAvA==
X-Received: by 2002:a05:620a:24ce:b0:7c5:e226:9da2 with SMTP id
 af79cd13be357-7c775ae9e54mr1621397985a.47.1744031346391; 
 Mon, 07 Apr 2025 06:09:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e67141csm1293819e87.224.2025.04.07.06.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 06:09:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/4] drm/bridge: reuse DRM HDMI Audio
 helpers for DisplayPort bridges
Message-Id: <174403134393.3385678.13559826981567818455.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 16:09:03 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: WIXcJzGqprAzJLkPcIfMtHt37aeXeF5i
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f3ce73 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=5uxiH3rk7msUY6mfsOcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: WIXcJzGqprAzJLkPcIfMtHt37aeXeF5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070092
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

On Fri, 14 Mar 2025 11:36:47 +0200, Dmitry Baryshkov wrote:
> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> support. Present DRM HDMI Audio support has been written with the HDMI
> and in particular DRM HDMI Connector framework support, however those
> audio helpers can be easily reused for DisplayPort drivers too.
> 
> Patches by Hermes Wu that targeted implementing HDMI Audio support in
> the iTE IT6506 driver pointed out the necessity of allowing one to use
> generic audio helpers for DisplayPort drivers, as otherwise each driver
> has to manually (and correctly) implement the get_eld() and plugged_cb
> support.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      commit: 5d04b41889596adab613b0e2f27f76f6414cda66
[2/4] drm/bridge: add function interface for DisplayPort audio implementation
      commit: d87ecc232706ace682a900a45018d843f148da56
[3/4] drm/bridge-connector: hook DisplayPort audio support
      commit: 231adeda9f674ece664b09b75b68a4c023180fb4

Best regards,
-- 
With best wishes
Dmitry


