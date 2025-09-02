Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D0B3F29B
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 05:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A0B10E55C;
	Tue,  2 Sep 2025 03:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWMSW4mD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6549F10E113
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 03:13:29 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822XAK2031556
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 03:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mFT7TaYN9yFmUBnkUS/DV54B
 AuRMajtXQdEYrtXcv6Q=; b=JWMSW4mD3PTluOAloZo2v2G5SpKLxOuXPtreb91I
 HO2B7mjqxjJB6HZTSE/JG8bM86XKEfm1+HRcRAGizJR1zv+x7kKsmGSkJCgDWBQQ
 hZuZfoYQgstxYme1EFXQuvAlb6T5459ib/NfGUUB/xYAxoO2tNqCndbAgmPKxE3d
 1oTL95XM0ElVnBpABJAOBFwYgig4M1fYxaSZKiEpR+lBWRrl8wbh9obSoNA22z1x
 XMM61AB5Lb+y2lYPLcYLOmBHqTufDM659xl+4Le2NcwcroQNpuDsU1XN0SCBNq6n
 l6IauTpkF2si4mrFHIiiGj1Vyh2HUa5m8BQ41a4jq74tZw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw82qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 03:13:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7131866cdceso47961006d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 01 Sep 2025 20:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756782807; x=1757387607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFT7TaYN9yFmUBnkUS/DV54BAuRMajtXQdEYrtXcv6Q=;
 b=U3KARf3FScxduTQne/kr54Xj6zLY+rdotG44UWXdoKmlkcfIdVcGOEVTHK9JwUTVCR
 WhFwBoImw3yCLXARNjeb+MgzGbCl4jWKXC8zOFPGYLN2gq3CBBU3rCRePh4gElIjgTlD
 v/qZRqeL2cKwrj1ib4IAOQ/jfZKgehStc9YSja3bp0XqCnkJe220v/E7t4kUOS8BpITb
 tOrCpPEGkgD/U6yDh3XUYSMiyyXQwLqARU/teT+jVGwxH8JFR5oxYa+IcyEAFls219Oz
 20c9ET5OFe1NnPwx6d8LwX1d2RCpGF/lASmf2ta/GpP7Z8rBbVV6Ot0gIlhFCh/CeqyP
 FMAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8rqUVVZ+Mbekc9ZSs3YatXFXtyJipLMOOJpc+kQ8RtlP8X6p+QHUCOpfC1huYv1QmRSmUYqKp1TQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwblajaDkAWfhM5s2iRMdHs0TWr0bCeEUN9I3Pc5afzFVkdofr8
 FcIhU782DnH31mfELohsnTb7rmGf79CQtiKsggG8jq2MDngoYYDllElcryEBoTIdImy1VJ6ykQI
 15yFodsUUUmlZDfdoHVFKLanSHZfM/sKogMo+pYNByX/KfTT0U1U/NlQ+DTQGDuExTdA96ro=
X-Gm-Gg: ASbGncvOoxS8QeiEg1Kf8K9ux2eCNIUvQULmuRJZURN6LOvyvhKvpE/k1cbqoBH25ab
 2K4h0NLxXVAr3j6GXh5Zq6fzmCQlxt0LTgKXKaoiyjGUIyt83wx8gpL3QmrSv7qAP65b85v1/Oi
 Ea5sdBCUmYYic7GFQT+YBcrOzIpyn8J6mJimeYoTPl7WcBXNC/eXxFEQuoWCzc6/8JoxGBsHwrl
 9EwHCAy0rYu/iEhbW4kpX1EYuWeGKhWhoaadpR6lL1eLL/P2ijXSykwirlxZZ+3KoQtIE1UQoCd
 qIJh311+UY9RdUndVR9T/Is0GVSaC3aw4/fw5wrBQl84EDhV6GwjFljFrGNTUJPfPRzwFK4wsYe
 Tsdds4Yjsh59nBO90IO60lSJrkfpoOcCrzFxLKR6rjbQQzrCN+Cbz
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id
 6a1803df08f44-70fac90b081mr99124256d6.57.1756782807502; 
 Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx3s/TeSWd/gD8+0Pzv1Eys9blTUBbEzGio/Yd+gCc0H1VU32BQyJUk3uEjCaZ6DP8MJyUzQ==
X-Received: by 2002:a05:6214:2425:b0:70d:bee7:22a6 with SMTP id
 6a1803df08f44-70fac90b081mr99123866d6.57.1756782807080; 
 Mon, 01 Sep 2025 20:13:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827a53bbsm309669e87.124.2025.09.01.20.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 20:13:26 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:13:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 02/11] drm/bridge: adv7511: declare supported infoframes
Message-ID: <4rzkxynpbe7j5uyfiqscjt6l2yr4teothqcga3js7fn6e4tap2@s6npztjtbjbq>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-2-32fcbec4634e@oss.qualcomm.com>
 <20250901-tidy-auburn-tarsier-e7b1e7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-tidy-auburn-tarsier-e7b1e7@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX03AbC+sy5aE4
 vUuEHvyUodnPJ/Lyobsom19rptO/ApD8e4E1q3J3WDCzXKuOOqDsTECztwyuo2jmTcwbDosSpq6
 nMC1OrgKp6RsBHJkbIa1qNSdBFHEADv7wgO1SE237iNcJv9VJufAr+Oc/wGBpZ7bMGoYg/w6HYN
 ZnUbrbhTdjZZ5jK6OdRVKfjWd9hCtfwbShvn6WhsZ90GyA/bqO0Thk5QBF/fL7f6wGtMoaVE7X3
 /uqYr1K2IH93UyNZ81Iw0kCoGRUbUjIlbi8xyhDtP46Sar/lYsM2o2vG8vBZTPmk2xNVl4Aq7km
 hEF1ojwqSSmcCnu4T01Qpyu0ztsXHqzmY/d26+PAsMuNuTlLHS047RYJA5UanwrJrEBoT0rxctn
 jMxtMSg+
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b660d8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=u7Ex-Lb6nDjXBYZR8i8A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: mvb6s2euhefX-Z_UHgF--3Ee-r846_Qm
X-Proofpoint-ORIG-GUID: mvb6s2euhefX-Z_UHgF--3Ee-r846_Qm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On Mon, Sep 01, 2025 at 09:12:45AM +0200, Maxime Ripard wrote:
> On Sat, Aug 30, 2025 at 03:22:58AM +0300, Dmitry Baryshkov wrote:
> > Declare which infoframes are supported via the .hdmi_write_infoframe()
> > interface. Audio infoframe is handled separately.
> > 
> > Reviewed-by: Liu Ying <victor.liu@nxp.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > index 26f8ef4824235a9a85b57a9a3a816fe26a59e45c..fe30567b56b4f600683f0545ed270665e692b12c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -904,7 +904,7 @@ static int adv7511_bridge_hdmi_clear_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> > @@ -938,7 +938,7 @@ static int adv7511_bridge_hdmi_write_infoframe(struct drm_bridge *bridge,
> >  		break;
> >  	default:
> >  		drm_dbg_driver(adv7511->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
> > -		break;
> > +		return -EOPNOTSUPP;
> 
> We do need to document that it's what drivers must return though.

Ack


-- 
With best wishes
Dmitry
