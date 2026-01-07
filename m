Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E685ECFDE5E
	for <lists+freedreno@lfdr.de>; Wed, 07 Jan 2026 14:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB42710E0FC;
	Wed,  7 Jan 2026 13:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kG3/1cJ1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0CbnjBP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922A010E0FC
 for <freedreno@lists.freedesktop.org>; Wed,  7 Jan 2026 13:21:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079XAtd4136988
 for <freedreno@lists.freedesktop.org>; Wed, 7 Jan 2026 13:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=js9vOdGwDOtrz/HNGFuhKMtQ
 9O5QjU14j2FRmChcdtk=; b=kG3/1cJ1P7ELpcYi4U9ELqLxZVjt72LrO+o8b368
 fi93VpPDiEfi+45Q2CtKwzWuPFKqWY+Mh2EiPw5vd8Vpm2XRAuWkxK31fv+YNbrk
 OSJ4rpTVpu9hHJ7SkXwiYFRpfkTeY9luQTuQ2KYP2RGa+UHizmcikgcC/Zs/WuwF
 kfShAdfmGYD4ImRzKeBScibWpKKQLsGDz07GG52n2IAAbm5UrKb3Ois9v/A5PYBF
 mcHPsICzCwQTnNNr+3AxzepT3h5cb29NlRt3Z5jjNDBDNULEmobYyiKrsOtWKWt+
 IOpcqT84fcn771H2LtNgspTmUV0Pw4g90RXS66kMNU24Dg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e3d6e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 13:21:45 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-93f5265a39dso3127932241.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Jan 2026 05:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767792105; x=1768396905;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
 b=Y0CbnjBPxuP0vMoXC9BD3GqOxQj5mQJzLMLUnVt7ZICQYjv6HEtmlW4uLaJSYJlUMu
 tk4uZS/4reU8YgOYRu+fwro0onFxeHTDXs0GAXKbyaRoGgoA1y79dOOk7Rz6KtGJdPoV
 q0F4Zn5uQaZcw75kNUbBz+PPetULPenQeGm4n29ydijI8Q7HUZwUWx2BKhAaYnHGKdMs
 uSw5O3BECfrRiz9YScpAAyUjL7ikASFWf3WrrOttV/ZosH5rdcOKnoUB9lGnbLq8GmES
 dIQR3VlNsbacih9CXFXFT7dy3tBIMXI4nxsovrvfuGgtQlx7UwS62ORmOQVn30Z8sMr+
 DuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767792105; x=1768396905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=js9vOdGwDOtrz/HNGFuhKMtQ9O5QjU14j2FRmChcdtk=;
 b=AX60Y+CHgwtvNiBArNxZ7NXBSnOpsLX7R3JUDDonr58HHdbTLQJMKI2b9g7XGoU5wY
 eBVyKO4O2DKHL79pyZFkwjOiyrWYzkJK+x07mfu35rSi08ca6RygTYXXkg9lQHfhtd17
 5D/fUqDYGuMxTTYmAegnbUPjmYsTrR+CNytwMYBXKszJ+a03dJ8ZZjzzB+xI7hGfrdmq
 sylrg9afmkU2N9Q67EMjOIKdtPut3YtLV/4xZ7oJhPyZfHCgrEA/CzjU3tlApCeEzW/k
 rsR+UPd1aQWq4Df4lLZBUSh28236G/nsTxjKcrOdO6AQVbAU+52TWuSxvkOWgMEkD2cj
 88RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2leyHry46X/lFBIb0KJ83G48U198RMlIuFSCinin6HJmRxyrfRzJbdnXC+lANX+DgItWQ1K7jBqQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxIB9sbSwQC5Eey+u63DUXeN+qLeFBCV2Rnw2Q3AtxrNewIr8X
 fIRlm8OewZF9u8PuQGC8BSG9y6Oqb7qkgizb230Y7MaWoCXogr4Vo8Bd0kFgmohqb521aXbAkYp
 Pod789tyah98Qi5yWOhx02WZbBxNFIMQU7Z3RdWXuKJJi2uRfN66mPWLcReJMqUmVAhKGL4c=
X-Gm-Gg: AY/fxX5fb3eT2buycTWkCJaybze/vEzDrO9DTadNIL9xBj2t0jZnh2Wr95sj6j++9Ld
 qFFlCwRiwUWrvxUgBgRtyWTFY9fHZjN53u+kBwljbyx9rl7KBiMxVYVEuVZJdQojyCj1PBABLl0
 hCI854g3QPAnJJx/ZUxLx1HKFfqM/ZqDV9A2gZH8zVIzH89sfmuKdXWcqc/5NbArA90pQyvCMtm
 2UiPDY0MmJwmI+EDYayjENE+DsPWAyvFmLbegLywItBNgyGLjwIqgCBkD9ZC76HfqD/wDOx2R85
 aFXIoZ6dP6bsluWVO6sXloVwL6MZV0UuFu/20KhA/sT8wscz+hgtILInJ5eM1Ko0xuKacerHOu8
 sQZtS2jXxdjci6mYWry2BKw+RBSS4mgFxwD147ZEl2ft0uyDILgXLAiYhka3URcwjhwTcNgJ51Q
 vxpn2OBqjPnjgk9S4xhy+0Ltk=
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id
 ada2fe7eead31-5ec752dbfd5mr2097440137.0.1767792104912; 
 Wed, 07 Jan 2026 05:21:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2NXBDg7wVXP/zTsrowEn5NsyiVqeMK7cDHudpgAqGMWRN5e4UR1GPSBvYkE7wBgLCTq0Y4g==
X-Received: by 2002:a05:6102:32d3:b0:5de:a2d2:8076 with SMTP id
 ada2fe7eead31-5ec752dbfd5mr2097376137.0.1767792102812; 
 Wed, 07 Jan 2026 05:21:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb8dadd1sm10295211fa.34.2026.01.07.05.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 05:21:40 -0800 (PST)
Date: Wed, 7 Jan 2026 15:21:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Message-ID: <mccxwmemwxp4fcyjiu3zofuydk5ahmhnluqucwau5a6aiw67xr@52gynmrblml3>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
 <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
 <20260107-fascinating-boa-of-fertility-1886a0@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-fascinating-boa-of-fertility-1886a0@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEwMiBTYWx0ZWRfX0Ca4stmF3pNZ
 sU1biTQlc+EuLBEYgSloeyxoMe0aIl7Z0oRAprJ3oFFDWWZ3Z/ph/QZL+sD9+XO34s//IWjwlfD
 weMjlc0uqe9lPsl1e4yxvWoSXhmPHgHKlnsu3zpVj99VKHLq3wUVrCc8PVY7P2/JG6X3bP72t64
 FqDz1ldjn0P17bC7pOWGyuuswvLDoFQ4hc13d1PiCFjaG6o4Bb1Hh2zEwFKhC1RiU5pYruQWkeO
 kqrilnvXtG2esgBY+PGX+2T7SvHeyRjqZKHM1H6wnFo3laBZWjm6F+4dq7uQT7ZWOxLh1WVKXTW
 eoaBd4e/HyAC7kOh2AWowqud8XB05RNHd1r7Di5nGmi71tD0T86UVkluE1RghzPG2LF9nH8ZrlY
 uCmgbLxSiL9vKxuZDSVahkgqqYielO9LvR94WLAqctHk+7nfqCKzTo/py80nzsSlcdMvSTnfZ51
 BUpPvvQlGIbjUsQkWkw==
X-Proofpoint-GUID: nRfWZvdIbkcqhMHo5BRjWHoxxjxryyCr
X-Proofpoint-ORIG-GUID: nRfWZvdIbkcqhMHo5BRjWHoxxjxryyCr
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e5dea cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3wq6KaL0rsEoTcXXugkA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070102
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

On Wed, Jan 07, 2026 at 01:50:51PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Dec 24, 2025 at 03:02:56AM +0200, Dmitry Baryshkov wrote:
> > Updating the InfoFrame if it can not be sent over the wire makes no
> > sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
> > and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
> > an error if Audio InfoFrame callbacks are not implemented.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> IIRC, audio infoframes are mandatory if you send audio over the cable,
> so maybe we should do like you did for drmm_connector_hdmi_init and
> error in drm_connector_hdmi_audio_init if we don't have the proper
> write_infoframe hook set?

HDMI hosts can be sending Audio InfoFrames in some other way (think
about LT9611UXC, which manages infoframes on its own).

-- 
With best wishes
Dmitry
