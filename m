Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083BDCDD1E7
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 23:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9252113140;
	Wed, 24 Dec 2025 22:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHdIk1d9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVHFqAx6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258D0113140
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOJBiG7464492
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=; b=nHdIk1d96Qc6MtkX
 xuvXp/Zbi6UWSasbYHp5vrUsvuW6ONDvVuD4YhdeIkQeli60rQRn0B+IapRcPmtu
 bA+yn/4P/jRcga0RPZqlbubnY8u/SYKA1rb2tct2YleWM5jAJRdXuzAB7u6oVzRp
 6fJdt2KfdwCxQUxSo5ejZac6gkbEFft1VO9cZ1e1MGc3bcOFCpMIPKql526f9NJF
 W783TpjL3LzjyO7lAv9BZgdd3yxY5rn6MTLB+gquC+uOG+7Eh6UbYs0Mbq56WXQ0
 zfnqQ0TBm06NuVdpu76zM8JgzZR2g59EDvRf7T72H1Aq7cnS5vRh+mVe4rv+fYOV
 6+PoGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p49075u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 22:32:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1f42515ffso149421381cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 14:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766615552; x=1767220352;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
 b=gVHFqAx6vMpzIwa2cvbt4C3tNLuvTxxDisozCj0o0UUMR466RsOCs97a7XXPS4hgaB
 G5e0SWjG1cK2t6Un+efO37gOxmLKu4AGRLIVvtIzr+Qot0GLW6ZYfXmc9HLEhK0ozZ0t
 7y3D2fT1SrZ6bwDjAtsPdZg4T4KEmSVMKRU+/+hgdZ6zotV+3+dVJ3oRaQ+P0AoKBKC3
 CXw4Qcvcbw6gViXmlbJjXgM/9aUOmg2aV5zn5/mQwsGMe4BeSuBMF5elQJcRD0v2eQ0A
 buTH8Qq55hC1QZkVBzelm+oC0OdfPg6E5/xhmf6G7DRkW6bB7/XDTHu4dJxskASocco3
 wHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766615552; x=1767220352;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UraNFuYrxpgysjCGoBJLWahHGNJ2HdExFYPsS3LkjKw=;
 b=YXVgcd1sUaCHNt3CeIC7Lr0WsMoc9tbo+7iO+mx6qC/mlTblxrCipg5buzBYIE/ymH
 AxgYcYXftuzcI5hWuK7xqFWrgoYTCT+ZXF0ZHs4b2V1T8EXIFhmMtv9NPzf+fOvXhTTE
 BggLg95kjZlgVLSexnQ+S/zUIFSL7PCy/EyAwfuErme7cjTcEmpsC8atdnG4d5bV3Yyb
 f516ho/lrGL0nQg5Sp+OGrBLBrh/1+TA5YN4W3GSYqVxEOTFnkyNK9PJ4ij8uIivUirf
 2y5YXjh9YclBYNHcFdxTW2nQr3K4rJ68+I7QCZgSZ7qo4mQDXBGg7VkuALvKmeIec87q
 SGKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhHNu5UhoFq+9dFUudkBrN5M9yIM0fa4k73K4sRmhgOc2i2Tj2cSI8vnmhLaAXC7VRqgzOV8O5cGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz3kTgDquvpkXr9Q7jPaQYLjBFCJ+Cxjn1XgzznwpzTM2X4YF9
 ozsAWC9L6g+EXtoDGINJWh/k2vej+JaTY6mgD4DL7lS9qK611YTDRF8zQi0pgirDJM9L7tiN20q
 a4yMzfUQTDAhR4b63batfm/fdkvSlRQRI/ILRd4wk2kWT8O3XWM1nQ+rXnP6k0UACKCBmokM=
X-Gm-Gg: AY/fxX5peJIUZuZSvtcVEGUCUZPKDrmv0M0m8IieGsZ0riKCnMfFEQnAU4B4/OTrZxV
 ttT1STgAhRiKt+HgC300i348aEaxl6Qdzc3FQ38f5t43yBK6nJYWbrlL0w7ebZHYl3n34KvNKx+
 k8U31Y/K6aPPMeICt40H//SLInCiYrjEeDYvsCgkE9eAZBUOw2hV1mecReZWOkMIIIj4Ebyzu35
 unw1ujfMQ+/xgQsAOZ9No2g7Yql9xfsJJEiXYCWrHK/145xP2pcKThCMHd+IZn3tKPWoWSd7OC7
 IlB+X3rJsIGFqm79r15QKGGEKiWA/27Lu3Di1wOr7cGUroeis/uMQq/dfHxiMf4tIgAO7J+74I5
 JYHGSDHtERtu4sDfYQI7pOIGllVVi8yxsXI3wokl3Y9sJcmit0AeTSj1UbrKj8sLsFt4MpbtEq+
 cW3TIVejCIuB/NaFgjDVpV+UA=
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id
 d75a77b69052e-4f4abd1fd20mr319277321cf.37.1766615552546; 
 Wed, 24 Dec 2025 14:32:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn3E7ooVJGy2fcsFLgGKtHFkRwVCp/umZC4k5RBMwllPtRmK2vC1IGq6txC+42jL9b+1gxOg==
X-Received: by 2002:a05:622a:4ccc:b0:4e2:e58a:57e1 with SMTP id
 d75a77b69052e-4f4abd1fd20mr319277151cf.37.1766615552154; 
 Wed, 24 Dec 2025 14:32:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122693ad3sm42746951fa.49.2025.12.24.14.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 14:32:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-Id: <176661554772.2411515.14289224108428205133.b4-ty@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 00:32:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: gZZ-cgST81pAttBIAwfzfmMeWcWv4ZVb
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694c6a01 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jdnYiPbrDYKY_qMFIeYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDIwMyBTYWx0ZWRfX94qW1QAbcgqS
 gDPcGSoX9PSjifsDqMLQu387eU2X7zIfNHTtaDVP/Js9pOs1uh17ZPl2MubfpAvoAbujn7W/mJI
 AtD90n2OHEJOtpZDL/rnaoQPXZKkY6O9Cr/6q4J0LIkmjnnwP3p4K4lt3EcvjGMBzwBZpsmru8a
 NjZCmp0DPbinVIfb8LRee5awy3ekulvTFhLy2jxS3Mf7GdYmJm/2tyCguMopE8WbUbgl2PDZw34
 jN8vOzNCuNAu3spNd+hVulmxyxUr0doZQWV87M3wEKRHQMz6mZOOwV2YFFm2Y2ud3xvFH8v049i
 qt8A5uHbLNM9zr9a9mO58lMVP/zWCB5CT2jOkNvlYKakb9J2rK3yFpoRKbwmqNY05Q7/bBlU39K
 UvD/6xtqAUzLEPEfU4XVAwS9DkXCgVL6vaweLaySTk45V4w9uEjCl8bbCtH+Byaq0FHZj62Pj0O
 WB5H15E1uw9UNpYwJEA==
X-Proofpoint-GUID: gZZ-cgST81pAttBIAwfzfmMeWcWv4ZVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240203
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

On Sun, 03 Aug 2025 14:53:50 +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.
> 
> 

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: add connector argument to .hpd_notify callback
      commit: 8a717c16ddf261118e9128d7f146d68a2567f087
[2/2] drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
      commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d

Best regards,
-- 
With best wishes
Dmitry


