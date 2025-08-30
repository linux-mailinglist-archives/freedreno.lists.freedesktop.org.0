Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A14B3CFDD
	for <lists+freedreno@lfdr.de>; Sun, 31 Aug 2025 00:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99DF10E031;
	Sat, 30 Aug 2025 22:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3GnX8W6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB4310E286
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 22:29:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57UMStdK007966
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 22:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GNi6qlMhUO/dlDLKPCpe1Eoh
 MUP/BhLmz8wF/QSm9/A=; b=i3GnX8W6MzF7/jJqLQfusJdMEK+lmRXnmxPfHHY1
 JPvU271NEVX0/v6y7ODjamnq+H35oviI2R0naUJNBJpMjQ372GejEdRgYAaVwriD
 UuP6g6EZHnfjp6jRkib7fwem4DSzBXnuwGFWs8Bx/dKken7qgT+Q47BDBEnHD/fW
 AOjVS77HhoxWByxt9zCkSoPxghyGfIfk80XXJk/y483CHjFMaGP4kjQ/AcYT6ciI
 i0qD3LFPO0B/sa8mnRCx5iomQnAJyXkhrVP00urFpwzbtyFGPxJgQ03tWBSnsQAX
 T1fqATL+5HD27JlCxMLfLyKmM7EZNQWozZhMbvA9sqGkOQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp1e9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 22:29:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70dd6d25609so75081796d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 30 Aug 2025 15:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756592958; x=1757197758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNi6qlMhUO/dlDLKPCpe1EohMUP/BhLmz8wF/QSm9/A=;
 b=iDKMkI3o/Sl1Vg+DgIjI5YLc6J1hIzLMpXcktvrZn+C4tytYvWjfVcGp07H+pRRbP1
 GVZseDCVb0TftjLH2g5GYPNbM1rer5+Hg5E5nXPlyMWwGfuAuN5tTdE8uIZmtDIokb5Q
 KYgZIi4zvnkXZ/kOWPv6l4EsoBEExsu1fweUQVN5RyeEN+4xZpvzVumBvtk48gRe2RVq
 ubcaS28q43hCCcCUGnozas8UGy+pBloSn9h6bc/wfpXQUrZXb4LeXlP5DAujRXnQpW2O
 HHDg3tarCZtcQea6w4n9vXZtK2HnFvIPzUxieOLYX9WnZhv3eOo/6rCg16SR8RtEB8VS
 9RoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJdLF6F3wk/F1CN6IvcPWSAb5RD1qhF1sk3WvhOR6CITl3WobOlUAPxrny4Bo/VLhJF/+wiJe8uTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9XwcIBl+v+B0S4bmLkU9NiJMMCPC0uuKjg9ladUiCxyye01iv
 bdb1GXPJBGdHvHnTTA5LPOzkMeUDggKsw6m8gZHUeKXi/FdK/s5PbwUMZtvb/ZSNLhwiTERsVxm
 w2FjIEcGliCxCHdM6ES1rxSQ+Kfny97Q7K7Qh0IwTi1enEt+pwnC6zV9WU+jAy7uhDuejibQ=
X-Gm-Gg: ASbGncseV4s9jcgBNmxbKfp1M5jOiq+rQhP532pBrEpkaCk3nwGHwh/0z2ctj7yd66M
 F/SZ+jIVN310l6MozeIu0fn7hBAIo6OaxdocO4ZsO1TT86JUpCDxfSry50ROBrvocm0WXIBo3cg
 AnWNSZIzvnlHwKDpwboOKwB8k4ODIGiEmc+TvaQw9QchwKeD5I1XvwK0VsuWjA17odAHgFJHZhX
 vjd+Aw/y1OG7xLluCnmFr8TRciMSsHANz8cnIu08FzTl54LGJE716iYtfU0fCtNmAXmQYuZQD6u
 Nh7Hpb+n9m3w0IqNNj6zedwaKUJ4FsGUIQt1ImCHQK0zLEosE5KS0LGxGn91jdq9fWL9LrOS4tD
 3CuK4Ess0BTMA8IFQfEUY8nmMgEY0q7ae6zesewzMGDJODC/01rlZ
X-Received: by 2002:a05:6214:21cb:b0:70d:c6b9:c256 with SMTP id
 6a1803df08f44-70fac94115cmr30677786d6.58.1756592957771; 
 Sat, 30 Aug 2025 15:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaqdCzqqQwp+xBjOwKvWSPX4p3qiZ0ZzV9L7+TYukjcGa33kntlWRwDlkYGow/owafc/jjnw==
X-Received: by 2002:a05:6214:21cb:b0:70d:c6b9:c256 with SMTP id
 6a1803df08f44-70fac94115cmr30677306d6.58.1756592956994; 
 Sat, 30 Aug 2025 15:29:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336d0e3f3absm4929391fa.37.2025.08.30.15.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 15:29:15 -0700 (PDT)
Date: Sun, 31 Aug 2025 01:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
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
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
X-Proofpoint-GUID: -jGEB6cPtMdzqYGoLrllggXsO_mO15lu
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b37b3f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eLVs-IFDZWC_gK9YM6cA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: -jGEB6cPtMdzqYGoLrllggXsO_mO15lu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX22dIQvU6O4hr
 Pb7YVkJm760kiVK+Ld+W1lIT98jrMxNdLN58YVRaNxtKRgZdA6C7XKOfR3aM90dLyNyWFHPw980
 T+8OAaN7SWWYUO1hg1uaOwSvShxyeqaUKgokBXTa5daqCHiCO3IW2uV0DF742fNGP9PERIWwwRP
 jWf8iF73uHKs1zeGBzJfvX7iM4Tjps9eoiJ1sFl/mdRTWsxv7d4S5ACIZ40nFq0zE7a1MNPpf78
 EuTbUuTIogRxXOcYIOFfw912XavgcBe1aBR+qV5zTn7pk2sFzKB5KZWCOL3/zwbvusFq3gbNiI2
 mVDUyq1/mYWQQ3863SyHPE9uFY1/lAbWSsEKmpW8amRpb3n5hU4U6Wssi0OcZTSx7S2Jg1/FTPa
 IcX+QHyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> Hi Dmitry,
> 
> On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > It's not uncommon for the particular device to support only a subset of
> > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > a model of ignoring the unsupported Infoframes, but it's a bigger
> > problem for the userspace: we end up having files in debugfs which do
> > mot match what is being sent on the wire.
> >
> > Sort that out, making sure that all interfaces are consistent.
> 
> Thanks for the series, it's a really good cleanup.
> 
> I know that dw-hdmi-qp can support _any_ infoframe, by manually
> packing it into the two GHDMI banks. So the supported set there is
> 'all of the currently well-known ones, plus any two others, but only
> two and not more'. I wonder if that has any effect on the interface
> you were thinking about for userspace?

I was mostly concerned with the existing debugfs interface (as it is
also used e.g. for edid-decode, etc).

It seems "everything + 2 spare" is more or less common (ADV7511, MSM
HDMI also have those. I don't have at hand the proper datasheet for
LT9611 (non-UXC one), but I think its InfoFrames are also more or less
generic).  Maybe we should change debugfs integration to register the
file when the frame is being enabled and removing it when it gets unset.

Then in the long run we can add 'slots' and allocate some of the frames
to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
salvaged as another generic one)). MSM HDMI would get 'software AVI',
'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
want to use). Then the framework might be able to prioritize whether to
use generic slots for important data (as DRM HDR, HDMI) or less important
(SPD).

-- 
With best wishes
Dmitry
