Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF2ABBBA1
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF20710E3D8;
	Mon, 19 May 2025 10:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6Hbi8mZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8749210E3C7
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9aBKl006225
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=; b=V6Hbi8mZt8Q9rTxN
 i6e+4wxppdu9aIST4QWeF4pbhARFuuYr89ACDnyXrLkvQwzBouNcrRRoLBYlY38i
 Gz7J/rXd85S3MskSUm4C05jkjMpQudqpIsySh/BPWN6vB5KmIeMXr0NOvzN54gkp
 LzZYCLxXpRcDZF2p505v3QF0nTwcCMwwruW8lMwuF3ifBX0qmVHG7xVe1DaHBElI
 JbIdnpbwvy8Zh2tY2eQBrvjGfChY12yxytsktbaYLYsonwBikWVPZpChWeOppgHD
 NbG6BcLcMvoIPoKcIHlGHr9swhnHQMsorBygjnsPR9gHFapdR3SEPkM7/jk/2bSD
 azMOjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m242-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so1503820485a.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652324; x=1748257124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfA7GtnSYSKUo7p5wgEOmrBapgaTIQDubiWjfuODSw0=;
 b=heI3BYQd25UqaqDjNaPWNOf1uOPBr3BEbce1FN3nBTsaKrsxauc9cMlDrEySymfNSf
 2GoR6spaJCqjHK9tZT/CbtZZAMK11+VOl/GCzQUjR8EZL4Nbyyl/sASXqVcSb8pKkGcU
 QJ8ZLqurJI4a8rUXsOsrfrXzZ5Yizbal9s4LGqeJM6LQQAhutw54/jtcEGJ7qa5HsJgI
 O19ITbs5Q11JeRMuxi9sarZTy83iL61wMTnp5wCgFqhbw9LENmLabuCvCf23Z1loraxn
 kxP/Fodb+WUJkWobGueOefjW6BAHoirec0J4C45MujYcvaoyxCdrXk4EK8C1S7h924BX
 u0Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/vZo3luDV1OisXgt8CDv5ixy2DiFNJuvQIlb4lcoK8JNcfgu/uHKrwtnDj+3XT0LwWVQkW+URSZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJqXRT7h3oKj1K1LjAchx7NKcX8JFWzQnIcz5w+/CI32G/Mtfq
 tYtsO7VKSu55RHeySEzdwa98/WgOT/qyzPrTmguHcVlQKBEfQDgIJwsPylo915XxzXaeueIEt2I
 wAXM6EqRcTuoPdiROe0Os72AogtOiGzH5Bo3HKiXh0zLgbVfRjAnT5v8bB0V0AjRH2CWHyH0=
X-Gm-Gg: ASbGncsQ0wDtBmhrMf9QcSqBoAdauRzvBtBQ5flxfwQGjVMj85PJxc63zDNqAE4wR3I
 R9Rw2dM8Py9xJriRYEV27gQdjxkBbmjvqkSVBzx1tUDy/C7Gu3ZUbLN9Qb3QVke0vNw2iw3OAbG
 wshBJIv2bhq0XQz6w1jNZtsIk8GrdCoNmSKYuZbCFj+TBFIZOwLbe8PWW5yIkmwmg9A9GgK2sNv
 2ivETOimaIJ8X7uW3olgo8VdM4gEEj00D2//Pu8f/8jpQ6U5ZD7DX2OwRsTWl1zSwMTx5T2K+xd
 X3qCsN7H04mNJP9TMfHURzy0wJlvmE2Zrj8K6HK2m1/lYWzIoM5I2+jjwwtjI3FUELFp8VhCiq4
 KTb05gNqv+9AtnJiCI/HTpldA
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id
 af79cd13be357-7cebc7b288emr569708285a.38.1747652324676; 
 Mon, 19 May 2025 03:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG38H3cHcZDLnYTmh+6whPIorhfzFE5GyS34FL7x9/2wg2Uv4PTcUIPRws98NMik6MAgAHrpA==
X-Received: by 2002:a05:620a:438d:b0:7ce:bc7b:1d0d with SMTP id
 af79cd13be357-7cebc7b288emr569705485a.38.1747652324358; 
 Mon, 19 May 2025 03:58:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:43 -0700 (PDT)
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
Date: Mon, 19 May 2025 13:58:31 +0300
Message-Id: <174637445761.1385605.12669862804792916978.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: drlrW7aMmh-_3LU_XLO8tCC39ZR4YaQp
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=OVqkDxUf0f5yx8408MQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: drlrW7aMmh-_3LU_XLO8tCC39ZR4YaQp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXwDdeV/P95FG0
 c8p5sNEfiCARfnT9jQs+0YICrmX2VnLnpPT5AsIBqbuiXic1Y40UebBygu1XtZFfAyF7CC3CVNC
 7wONyjLomyxAfyLHRbYU/WhoRB80jD7Vz5ks1DJSlQK8zgm+ZgtpyQrSksTXKt8os8kPP8EctJB
 GL9kqetJ2Z/IRB1ZIeorHBMGYeQ2s7OZQrMifC65zluC0fbez6SPqlHvIlvOLEUNZHpKFZ3rybm
 ows1eiuvsFpWKk/xdzq/yFOlri6e8URN2cfgA6T3+0hA6oaf0GFWS+s5OTUUJ6c988gwHCDnzAJ
 SVMZ+EWaQZ+ehTWsezc3hf6qh+HJn2opEZl7+ixWeE9f/q8EBxczvKpVMZfS3y/2Jod0ilUffAO
 8ZdU/8ZASwnwm5M1QC8etaOUy9M/tB4Q0YvTJghwyryGhNoih+kOcoMNiKMaxITlASOBVUvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=925 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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
