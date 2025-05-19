Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E95ABBB9A
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132CE10E3E9;
	Mon, 19 May 2025 10:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgMTqKBm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ACC10E418
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9sxVh006521
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=AgMTqKBmMNCFRM3d
 QmR+FeI7IoPU3llq3T4SCH2Hfx8Oet0nJ/zWjbnHMg5qQKZHW2qhJLn4I32vWn1S
 H1WjjmW4q32mwrRmapFrMFAzwTo5UXwChnWes5kAuGwYkYM5+kFImwG2SSMZB7sZ
 tEjMXc//6RKqHdcXXj5978JejS6taGAXEjRUDrm88wtkUsOWYEQARJXuoF1Wjj7J
 ZIYzmgKcoYZ5a76Y/l2jL+IjOKL/PjpzTVUGyTP1rLR6eXpHEIs1+qV/pUO+X8hi
 XEldOAP6lKYg0454DFIFsmcqoyOVHYynk7woKlVs5XShCB6YZ52tzPNB22kvNk4J
 rbTWoQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsv29c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8c6ce05e0so29247626d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652331; x=1748257131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
 b=kO84zgqlmkmrC8qyAAnz5ormjSr6elQ0MhcAv5ZB3EC7PIAWn4UovaIHtJMY72EHV0
 ksipP9ELiiLr3Q4hUqxzRYOUn1YIWZFpk/pUI62hCMsntGV+QEtkrsyShArrsqiGt4Zw
 lxW9oaQb8NXUL1rYaXIclBAWhlVqZCpCP6LIB4KksCqZeTzSK4N6Ff4gUfNi1DGNoTQJ
 tAASsVyuGQcZepWCgP0URXmxpAUh26OEBEy6ZGdvwlfDQIO4Rvr87Idz3zG2AZ4OyKs3
 4T9mUodUzhThWwWuptV8XmjntjXZk1iepL4r8MmBFYiDJAx14QfpRRoDdGjHPVoL2kY+
 ULPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViNSs9UNJRj9qB291wLXDfOkQsfL2N7/Dg4eyWnMHmLA86FLHenFEO8nJfRGWUs6mB+1q7SPoB9hM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx35tbbXTlyE1L/Z5mKn0GACp871kpeYWd5wOJQmBEChxfAurJm
 bPiW0BpM4nO4rOiEnSNNPG1QGHU0uYXfsfnxwiyq1gZniSt+zbXhN47Sy4yn/SGH/c5GDwj3ft4
 hj0WRQgAOu4vwfDljb5jxgOA4wyDuxNJ7HU4PbgTKst9fNY7VeqRN6wHryk66hKqpMcSq5Aw=
X-Gm-Gg: ASbGncsc9OBuRQWUAE3Z/Q+Qi02tMf5TsoB1P7Um7Wp+kzMJ10bLgfedk1hTGLbTm4X
 M9izt3RSLvIkYb7knrDixzQrjHthTDcMTsD2Mi1wNrNQU2De+oblukes11jM4On/mCQ5XXskVSd
 k703+NAI+quFcJ3kwjoGqeRiUMa2U6wcar6FCHMYNUQ4L8JLGx2npvGdSdcm0nH9hHBzOQDQN60
 lJ5cN8LYTkqJBm0C35AuXFKzOhXyh6CYoZEDvubbrBldcpNx3ZzIunZdmiMnW0kAWUNGZNMfGzH
 fSWmEbR6+9sAEqoaSJshvRkJixljw9PealmfosQUL85plcybrlFrudr+oDw2swyvEgd6hGy7moD
 uQzkEnvkd0d/JJDyWD/8CS0QL
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr224935636d6.23.1747652331149; 
 Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRauQlOm++SfaTq2hFhTkCOAP4U1NEnYr+eOjzxOglAC03Q1vWVud53//B6i/067FYK6Nu1Q==
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id
 6a1803df08f44-6f8b08b7479mr224935316d6.23.1747652330775; 
 Mon, 19 May 2025 03:58:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:49 -0700 (PDT)
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
Date: Mon, 19 May 2025 13:58:35 +0300
Message-Id: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7rJam7go1lmHoQDRcS_zfKjj6tXBmIO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXz2dgWp+Wsy40
 naFxMmUfoBzaZhmQFaIX4b7BaUFap1Ks1O6mHDD8QxdTcs9FZI8fGPEfsyNXepzUcotm9TAs7YG
 yuciAsPMfLWw7Ix+gAQX3fF+Iq7gDAd86o3NWOgoBGYft8Aao24vXSPjhk/OGsYRjJ1o1JgTzvL
 DaHDlIs99fC8tJQlCM6a+4YsnRnPBVkQtwgcU123Nq84NNu5/0MhW58LcPns7cnB3uMyBlnvTN2
 FBxk3zQbBENuGgwURjIp+66tSsze8AIuLOSRmFZRuk+ti9mnszLJJ9QA6YfcIjcbvA5HeFQiJ9L
 l3bcXbWcmpWEG+uEQTbbFh3tSZo+wBAvL6UFvOatIq1ZXGq7FilQUK1jDJbNt/Ct6VyDuLMbEJt
 zkNLrkbePFD1rFZFEXgybvFAPLRfryMHcTTZie1q5stAKj1oisCRL6iPtkBfL/qflaGjfa4a
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b0eee cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7rJam7go1lmHoQDRcS_zfKjj6tXBmIO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=897 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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
