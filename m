Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD97AA87B7
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7B910E2CC;
	Sun,  4 May 2025 16:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGGVODzD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1B110E2C5
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5448KBo5012776
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=WGGVODzDyzMk5G2S
 mkY59L1kxpwBZ2j3zGyB9hlsatxZhWI3y17xKjPbWLyvMHBlQc81X1NlLMkSSEUk
 GPS47xc0CSyz/Lx+Kv75VOFA33okDO9YmWQL3xzwLLfDAE3B5ZyyvJsECkPC332M
 CgO0cO90tYitEJvzcWiyh+k0kfNFfJEhQBuWVKwke9chjD0xOosEhCFUvbIg+lgG
 QbxGMQ/veayEzFGVS9EK62iZRHxOzlxsovoh0KeIkbulhNyTuDljYEkGiPfAdEPH
 LxW+gq+Xr7YNfNj0OvrwKo5hDqVxG/yssC70FUd6SyffRTrOV+kzHdo+zuajr0D0
 XrmCOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55t7ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4767e6b4596so66654381cf.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375224; x=1746980024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
 b=Y0l15KvYBoPADyFstnff+PdHkf/fjlNF4P/X87VznazLjsFgYDczwwKq8ZOGPyaWEl
 ZIq+qG0dhdDoLlo0Tje8UU26ol7lD4KPhTwHwYU5CdQ7K3YvH9xFq35YMBvj8xSyIQnC
 p771Hkk9X6S7NDupF8rCz7FOtGTitl2TX2F02Ab7i0FE+XrAnYyLKWekvpsYFoseDRwx
 mN9y2z30avoHi5tpiEixFPJlsybon5Pnqomv5n8LWP/GAPAjocGkRGNswHEh94yRI9jp
 1Lni9QTyrqg0rzmq0Y6kIM6o8KwzhdzHwq00FmU7LB19DuNNKiiAAxCQqT6Fh7KSilDu
 JYuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlT9OgscYi6dU/jEO31PUX6DLE+/v1A1K6FZXxNScQnQdeUjU0JP6k1VNsjZDh67WL+6mjdQDN7Sw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4Xyg2vOQNgBbQMLyjbphH7XsNQlgPbk9j5Diddb4xacsGdTOw
 bI3S5i2fOqROfeY78aUk+NmLUADr6845SOEAkCNrHInVKHCbLUNpwnmJWiY+OxVSIORvT/bRUc3
 7XGujIAnh+ErCHNQRDJIS1aoP6C0H8Vjwpatr+g9TV38tX2zL8jsjWh/BdLuZ7iWseLA=
X-Gm-Gg: ASbGncu177ZU2peivAGy/JuyjsvALIU7DhB6aW1KbggFpa7E/YRv0wAG7kBw6xZ22TN
 axDXSMOVOv/M112l4pHWRI/BZra0gCX5VAjizibvPhE3F+NcdC0UviDOefIRRFOWOFElrtNBkZV
 fQrUn2JWlCyjeYuoKyvq/Wbn4ukn7ystXtFrbvB5UT0Nu4CXUIpaLvQO6SqkdHp7ibbZSQEsYPp
 IP4g+TNZUm7Ws+2UqHg/7aURs8Hm2O47bqfSpqWOfJODa4IfVewE+VDhcNe4CohfP0oeT8955DR
 YCODUlUYHBZhVcLrsr3aW3FTJrnijBuS3VxM2lUI6Dfsf+MRaqzKu2k902igK+P5TRHX7Bewbcw
 oJaZF2BNZzvrl/8otcQdEEVuP
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id
 d75a77b69052e-48e0183cb3bmr54064891cf.51.1746375224167; 
 Sun, 04 May 2025 09:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH71qwpN6e0AWx4hQF0CPbGvBpbvyols0nzZVR9KjxAriV0LNGtW7IHLvJUL4f75onAKh328Q==
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id
 d75a77b69052e-48e0183cb3bmr54064441cf.51.1746375223770; 
 Sun, 04 May 2025 09:13:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:42 -0700 (PDT)
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Date: Sun,  4 May 2025 19:13:25 +0300
Message-Id: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXx8YhZODnV9KA
 7UxBTOx9c9nOWY3Yystm85eWc4KNGA2LRAt65c3U4MkK/rbGK2oBITI6zV3y9X0Uv/ss9QOBp4O
 tstWSj9rgXhuuwjT32nFPErNlMtnbeU+DYIjQSThrN6em2Aq3bByYDGAYgjTCyK6gohgIZ71O90
 LDMzxXGeFHLYq0QNpfnlACWkjgykwvuOatMWanvkSXORVTknBIAt41k4AmOeKads+lRWiNegEFj
 /nw+17ME4VXq25nSAxZyo6BicQMX76PfU3nUNj+u2TVh8tYLD2yz++mIazH3pp3OOlOEGyg9qlP
 txFLo6VSG5gHZ78RwK/1u0EJKBiYm64X/mNqakZFzOiZVeifEcuy5zk5WY401Gh00YJLFViCvZi
 vl88FPWG9GXtmdjXyXq6uRCfG8Y7mdoSZrflM6dn+tERGfMX8jmddWyBMY6WxE8U+UpGZ7R1
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68179238 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: KODcloK7RBA5CxbY4XDeSvQ8frcZA6Je
X-Proofpoint-ORIG-GUID: KODcloK7RBA5CxbY4XDeSvQ8frcZA6Je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=893 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
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


On Wed, 23 Apr 2025 20:52:45 +0300, Dmitry Baryshkov wrote:
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: reuse generic HDMI codec implementation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98a8920e7b07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
