Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B055A89B79
	for <lists+freedreno@lfdr.de>; Tue, 15 Apr 2025 13:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F16510E737;
	Tue, 15 Apr 2025 11:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6HQItCE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BE610E737
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 11:08:11 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tG3i013127
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 11:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wK/JFVYlOAXErlNkamOHP5njDdOfVrTDiQoYt7ITYKQ=; b=d6HQItCECyDmG7wO
 X8WhwJIvKV9ZaySz9lxRHK+O1V/8I4z+0o7aDBALfFpSIUkltISo1Qqhlp2oJQ+K
 Ax8guywMPt6HXy5Pl68I0bkYi40S3LYvCuYFimu3VrN8LGIHrsV+kQaDfbUVBDVF
 tnhaUBK+DSEy1yvAT65uZwoTIlj9DlySBq/AJaIAkw3dm3W93Ylb3fFnpPZH3sbu
 CY8Ozr1RDijt4V7BC86NPrpOKY79CuV1r3hKAPgKbm88G2+TxBDj9jH04mFC4/Ql
 JtlEtQGc5GP3YDjFygV2wqwZwga15SzDyqlWcSKhvQu0VWwYYfaeon6u9gpcz7eP
 F4+VCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fsg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 11:08:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so813260285a.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 04:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744715290; x=1745320090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wK/JFVYlOAXErlNkamOHP5njDdOfVrTDiQoYt7ITYKQ=;
 b=XV2dXMNrkAojXKYchPyV7G7TG0TXQsVeppUUFfTWCBWNiKSiQAbAqLzWGHS1XEl+dl
 2zeslfy7BK6f8dwm+G0yPtn4ejlwxIzqBbMY3NcYYbL/PAQlhVRBqgVTRyAvTjIPB4xY
 U/drn/TTU7yV1kL84hZ1xpPq2YFcgW/o3fEf0QGkiFQ6Pfpc0sQVgPeZRFwYvnhdA4Cu
 GTEyb92eiDcZTamE7Z9hV2mQmzXSjGFLeINyvE9v1hk+Qr1Pytx05UfOxosfrFw608ua
 qH194luku4+DifcS+TbPsJJfMkE0weXOJkNxR9b06xav7XaAH354UnpPsaw9/t3E1687
 oFIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbsl3MFs+IZUDJiCDHJT9CNdb8wU7E0WjrvffAU7SA+EGEKS74TWplN3z1t5TY19aJEU686GBed7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywuw1zbxGR2koKr2Evh2nag3vsaC7TV2aeqMIpPUDMOxQXIdmub
 Enk97aPoDU7XQS7X+vCl6rUtjZ+56egl1PfQGr8XvF+1n3UjdU7ZrQz0UsdSNL5hgUJfsZSHcLL
 LgOLkOHm1gmhGKrSRKe7JReKQSe9zJeYnryx0RPG+5rkvTO9XCbpNgzoA0MpFsACkuoQ=
X-Gm-Gg: ASbGncsZ5eSziBUpcmDjt0/JFZRifTIx/+jl95uA6JFkTlqYkqc/sMhPKbt4qevgDY4
 BYEH23HLxX00xsyvn447MDvUTsS9C/hMr+5frJFPkMAM38cqpBvYBcIO783rz/yrGzHSVuenzSx
 HAmMZhWqmgiPrS34QurgyjZ1bLeXNDNsmJhJC7KYXes+3zrpG4lb/92C+DsBrfRfSBqYyk7/EOQ
 GUmQd+RnXHiWaP+cIbfGsVBXN31I9PTy8aggr/3f5Tox/0YeBPIEy0NMdgUU6reKqVrnBi22AIj
 DBM1JQKDvBxQ0RY0Gpyb20FkHIQKc5D/Ry0ZprdSvyT3vLOCMuo1D1FV2bgEMlc=
X-Received: by 2002:a05:620a:2906:b0:7c5:5692:ee95 with SMTP id
 af79cd13be357-7c7af12ae32mr2051840585a.51.1744715290148; 
 Tue, 15 Apr 2025 04:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoUA8N73ZaepWJT0jZ3DvxSynJfsHmBtSCM5bS4zH20AS44fmQeKF7Dcsu9apRm4T/YkvPPQ==
X-Received: by 2002:a05:620a:2906:b0:7c5:5692:ee95 with SMTP id
 af79cd13be357-7c7af12ae32mr2051835685a.51.1744715289698; 
 Tue, 15 Apr 2025 04:08:09 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d56b5d846sm443672e87.181.2025.04.15.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 04:08:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/3] drm/display: hdmi: provide common code to
 get Audio Clock Recovery params
Date: Tue, 15 Apr 2025 14:08:01 +0300
Message-ID: <174471527399.25276.2451594776232891809.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: D2X24GRA3vHIXjBZu2yGa-SUyU-wsb8y
X-Proofpoint-GUID: D2X24GRA3vHIXjBZu2yGa-SUyU-wsb8y
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe3e1b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=1CIDf1XVFyXLR-mqbVoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150078
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

On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/display: hdmi: provide central data authority for ACR params
      commit: fec450ca15af63649e219060f37a8ec673333726

Best regards,
-- 
With best wishes
Dmitry

