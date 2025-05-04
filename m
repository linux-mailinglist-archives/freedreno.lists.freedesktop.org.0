Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5229AA87AF
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ED710E0EE;
	Sun,  4 May 2025 16:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0bQyENw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8FA10E0A7
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:39 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544BcIhR010740
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=G0bQyENwGIhr0PVK
 ug3iJeV0Ooe8RkgrDJY8XiTfO+EmvDmYKm/xaClavI87LG9by3tiU7sE5gBwL4bQ
 u2YAfNjznGHiXMfTre2Onw3P/J2YHg2uL2TvS75dKYAiFms4lVZKorf6NixiUqLY
 4D3Amd7+FV7adT58Rb5w0J86GN8RJgg/FP6/1f3j38Q6C/aqZQeXT5wQpN0ufY9b
 hjUJpxzgzVwRSegiBytj72kJ+87BKLaqZ6RxNuT9s/YdVhd8GLeh5Vvi+oM45HEM
 c0R7IzAQ6sbEUgjBzfupiXKa89b0U1hDRuWJZtEoMe/FZxQLQSOqmn0Y9NmX79B6
 /v/imQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7a5cp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c7c30d8986so411520185a.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375217; x=1746980017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
 b=TazGPPqbGgTTNvaztJI8fS2I0ZNtpGk+gtNY8oVPdlstukRVIDH96czCsy23RcCmpV
 JEZca/5fNcETYJWrbRIsFvhQdT6oipdpubSob/cPut24DGXZQQeDY6QPf8FwOWZ9ImTT
 O6k02NtiroMmMI0kgQSFMJq0IfVAXjxu/TdB2rzfgj2ENB3z99y1xZt0W2PRCPYmIwGR
 s9Doq754OEmvybmfRolLXEZAFT04cesPI23YeeZQjSQ6MclJevoZkd1SXMdOTg58WHw7
 a+5MLkwpaonG4EZJ3Egbi+i28VJNk0XpujI29aEUlCl72VHNTjrthqnyQAqPkCoC6+WK
 vTJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUDIV0jI6adpAMaLxh1O0FiaAP8GgdSdzSoJNbEoVROjXBRcw0ABwwwIut0V4hIkPUqvOErOmE7FA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfusjNcwzPeP9rB0GeyoVFT/rsY1Hc07vxIk9GDhPs7ahhnl34
 aHzSS/ZHqK/mRnvuiS9jMmbZgAESiBE5IgHhpI7r5ONf/rjqWcWn6wZ0ykcUNqoCbYm3CErGsWR
 9YBs/iErcrpefU0Fat865RBuZNWs1HAbScsmq3ZDvo7kEQthQXUkvwLXiPFmfXbe/53k=
X-Gm-Gg: ASbGncuuBoyNBgV8BDXu64oaXW6pvMVRP83FgvOr2ZwKZ+DP7N5fjxb5MBkKQJzH532
 2XEF5WXDd2IxlJDGhsBwSasYG+cjFAuNOXO9XzmPpyNw1agY0O+iKguKnYduw3bYk/Y48X2kROD
 K05uB5Kn+AFPT7SwrizdxQ7D3ZZzt7LyYldYr7lsRUh79vcTNfroWHBeFCG52PcKHJ6EBIga6nV
 Ki4bsZToaM0bSUUGttCd4CColFWnBV4pMn9lmd7uAffmmiBkl/9AHcrZffr0l2IhWrbuqdkCGGh
 sJWnVF1Ob0xeSFeFRSZYl5xnDt9ZnW9uTd7gyLYayM39BtikIvI+bMIF3i+Tz0SiYOCNDRl8y1T
 0qQO/8cneE1xI8RK4Idp7Aq3c
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id
 af79cd13be357-7cae3aa3a7cmr721242685a.27.1746375217703; 
 Sun, 04 May 2025 09:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeiOTVT2ymuT82iRFejLq29xysyG8uAckrB2qV1iZnT3Z31gVfU5M2H+L7Io6knC2h1rUhaA==
X-Received: by 2002:a05:620a:414e:b0:7c7:a524:9fe9 with SMTP id
 af79cd13be357-7cae3aa3a7cmr721238785a.27.1746375217366; 
 Sun, 04 May 2025 09:13:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:36 -0700 (PDT)
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
Subject: Re: [PATCH v2 0/3] drm/display: hdmi: provide common code to get
 Audio Clock Recovery params
Date: Sun,  4 May 2025 19:13:21 +0300
Message-Id: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=68179232 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: wiY1EUq5CuMuhIAKiK40tbMVxoR6T5cx
X-Proofpoint-ORIG-GUID: wiY1EUq5CuMuhIAKiK40tbMVxoR6T5cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX3MVZQJ/IltJ3
 igCkEbCvM68ZdIyNOtBBhmoqy+NIEyUCdMH3hhqocNWJdRMnT5vwocE6f54aWQCqAYF44C54o4+
 F9icxNRifDb4hFz5c/v3+l3Xutbw4ZsQrdYZPsawMyEmWebCIgh+7lkIe+zE9plfTSvW3XoHQzl
 jvgzKZKfMsfTanN7hoSz7q1C/P2gieI+aaayz7NK1zAnqyNfzSZLsS530U+E68WDAS3b//Lme6k
 BRQLSqCBW0q0eSq9L9Lp1K8BD1AIHcvc0suDSBsYPJg1y8CmAuhzuwVZPVcudpP5kikYOwyfTRG
 BzcjxBfwqAZHd/kPkH8Pl52jYSOo2rGP2E/vZwzg7U6Ez7688C0/NawlrHlTBjrPM52+NaOWRhS
 AgQ2jZkQg0YKCHIs2EbzZmowIYoQ5X6IRBAb03zSNbQ5peaBn52J4ZrilWA7v2Sm31ODR6h5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=923 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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

Applied, thanks!

[2/3] drm/msm/hdmi: move msm_hdmi_audio_update() out of msm_hdmi_set_timings()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1735917ac44a
[3/3] drm/msm/hdmi: use new helper for ACR tables
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88321e3529f1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
