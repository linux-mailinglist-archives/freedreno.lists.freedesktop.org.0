Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904FFA9D13A
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 21:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A1810E9A7;
	Fri, 25 Apr 2025 19:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVRulpmP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362BC10E9A1
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:10:45 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJppA031931
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=SK52ISjMMPAwyYoKNjOnDdT8
 tXPIN0birzElu7YYr84=; b=VVRulpmPP9Rz357ZIYahGqWXDWnoImjedTsJaoL3
 guwDpfGCAY28V5D95reMgP7bnrJpO98xH/XBtzQQoSQVX7bgea6NUjedHo5xDrV0
 cDXbOcmQvJR2SEkWlviPbJZhZMyb0XgaPc+oWF2fFplpMmo+FkMLAygPtMPFifa7
 cxPfx+evQc7xgDbIIY2vhI7px8H4N3wMrfwrrTQY+g9GjzFucn2MaU7MMuia7mL7
 65rhdQzeyqDogaYLmhbjfKap6Yr8IzLuCOCodhn4mrVnzxSZzX2yYLdn3/81f6HJ
 fxBr651m7bAAWHkIadXn/xvwPBV18tD+OPpL0dGsCJGh0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya24k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 19:10:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c92425a8b1so432191285a.1
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 12:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745608237; x=1746213037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SK52ISjMMPAwyYoKNjOnDdT8tXPIN0birzElu7YYr84=;
 b=Q8zeQG0kO8KBtjAaiFOwzfx5nEDC5xvyw0GjDJr0dYp1ietlhXK+3mW6hjpZEhsUvv
 +TaPjn70093aX0udVzfD9ccoTWWmx3yw+6t/PZFIb5nLillVGSmwC3JZN+TAudN9Ps8Q
 r7BBsbCUEpbrb2ZGsOHYq0VNBc5iwi5+3tzfYT3Glj4PXB4rrjahXXAUQNuv1N8NU8/C
 ns19CMJJc6JlrB7KKb1JCap7gfyXIKxL8cDtDGPPqHYEa1D2ULNVv/bOEglVFwslxEO5
 43TJgtN/TuDFXabekq/89Ta18eKs+1JUb+I5GrWgbTYJTR/UL4c7fypK7gwc4TMRV1bw
 o87Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGb/hMQBVQfiLGuS2YqzpgDkpSRaonranqsSSjAeB5UpDMETAmFQgPlC5evEHQuPNsdgMQRotq/C4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy5KR+bZ6NrTQxfK6C/mRjlkAuJoynVN4025edZm46TczqeYMd
 ROPQ9gUKq1vcbMBwsBuxTSov1J991jheJSV6RLmruz6hqqwtZoAYrFAPf3eRVY1crGUoDRdDhUC
 VtHkTWfCnY1AJOMDQ7OhfWiZxkYQJ0JX7/8ak7JL5vYVrlx6VvcckCkCs/tuZQ/I4Nho=
X-Gm-Gg: ASbGncuvO3mjs5KYYJf61XJTfx5KRef/bDAtkXBoAZokcRrMBEHmjW/RRYQ2rXNjoIg
 teJtKcmkXmgKIyxl7TzzS7TCTK9tZaBFf0GOrdh1vd5REYnOhkDfZhEPf+MOp3DVO31rL40Jp7A
 ymlKR1iTCz0TSDO9lYZzDt5sOMglkIFVPsFrJ6gR/D7y01M34i5iwP+g79+D3fce824y45DtaRj
 u0hTT0bfWfmdcYx824E4q4ja60qpXV+z5saEUcdjf7+ONBC0XsfWBZ+LJDx+8R/RgJfyAq5YDYN
 w8fbGGVYVhrxjLaBOGVGq8RzzoGtsJd4hysGOUUuA+sHUWkxvLIN6X/WxWajISN1mhVPvRcBm34
 =
X-Received: by 2002:a05:620a:d89:b0:7c9:222a:d858 with SMTP id
 af79cd13be357-7c9585c43a9mr1080781885a.10.1745608237564; 
 Fri, 25 Apr 2025 12:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7y2gVQYWKUcd3rSgI4jl/cjj7VjTLLTsX7uyEAt1iz8D5sKZWsC2LPXaLmIw0Vpqi8vjwLA==
X-Received: by 2002:a05:620a:d89:b0:7c9:222a:d858 with SMTP id
 af79cd13be357-7c9585c43a9mr1080777785a.10.1745608237194; 
 Fri, 25 Apr 2025 12:10:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cc9e921sm706334e87.152.2025.04.25.12.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 12:10:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:10:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <4isbdbp5z2kr4pnkp5gstridtwv2pyceqfea6lhkxaa7s3epvw@7s3qtp7m6ovl>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06448824-81a6-41de-b44f-32101b889258@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX770zDpgLiPrF
 jQo/SvVAuBXA8GllTOUg256UqLzYwhRXjA7DogL80N0Vr5ae6sG57nJqjnmvMjovYZze/8NvIxW
 XkmqN6JbbH1CSXc4yBNuOMvBwmtz1EFAoV4BA2pQlOytTobyP95znAV61zLgul7hMCTlFGkTIUq
 oSCSon1KwOBJpvZjozWqYUZur7jNvMqn1455OUiisSwalNknQxL/owd+U3s/1wV8vyzCC5GLG9Z
 01dWh6w4u7WWHRJvMI2hzdJh2upsSLfDO7A8XWYVrXT6OuDlSUgdasHkJ4sWysH4wSuAR87GBBX
 nJWttvQmz9RGeFn+TqFBXXAe+kfpktljonkEuIb50Cy4tTsl3iulCoOkrACUV5EOmDo5X0I0j/3
 1yAankcFJhJJ0nBMdePYbpolVurmGs3MrOW4OwAqPEKj9unyN1lIGM0eloKhzPR5ETJ4sS6H
X-Proofpoint-GUID: fknrDvv5hj2yzeYuxWibPOdsq8Lpqc6k
X-Proofpoint-ORIG-GUID: fknrDvv5hj2yzeYuxWibPOdsq8Lpqc6k
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bde34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=M9OHNA7gU70stU2frQkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=682 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137
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

On Thu, Apr 24, 2025 at 06:55:50PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/23/2025 10:52 AM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> > 
> > The MSM DisplayPort driver implements several HDMI codec functions
> > in the driver, e.g. it manually manages HDMI codec device registration,
> > returning ELD and plugged_cb support. In order to reduce code
> > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > integration.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > support. Present DRM HDMI Audio support has been written with the HDMI
> > and in particular DRM HDMI Connector framework support, however those
> > audio helpers can be easily reused for DisplayPort drivers too.
> > 
> > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > has to manually (and correctly) implement the get_eld() and plugged_cb
> > support.
> > 
> > Implement necessary integration in drm_bridge_connector and provide an
> > example implementation in the msm/dp driver.
> > ---
> > Changes in v7:
> > - Dropped applied patches
> > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > 
> > Changes in v6:
> > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> >    callbacks to the drm_bridge interface (Maxime)
> > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > 
> > Changes in v5:
> > - Rebased on top of linux-next, also handling HDMI audio piece of the
> >    MSM HDMI driver.
> > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > 
> > Changes in v4:
> > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> >    HDMI driver.
> > - Drop outdated comment regarding subconnector from the commit message.
> > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > 
> > Changes in v3:
> > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> >    (Laurent, Maxime)
> > - Dropped the subconnector patch (again)
> > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > 
> > Changes in v2:
> > - Added drm_connector_attach_dp_subconnector_property() patches
> > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > ---
> >   drivers/gpu/drm/msm/Kconfig         |   1 +
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> >   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> >   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> >   6 files changed, 31 insertions(+), 170 deletions(-)
> > 
> 
> Looks fine to me, just one question, please confirm if DP audio was
> re-verified after this change.

Yes

-- 
With best wishes
Dmitry
