Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90525AA0CEB
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 15:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD8110E33D;
	Tue, 29 Apr 2025 13:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoMznvEv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46E810E30C
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 13:08:00 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TACanq023472
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 13:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3iycI3ZTNsOLa0MGqAVtc71f
 WejZqL8jSxO6Snm5fiY=; b=IoMznvEvvdlStb0Rbk11LLtBu7NMG2nowZ2iwo4B
 fSEf08qftmKZKeH+PHWsH34CVZjWvTGK7iytfGpnB984TB2Kukc1An41CckNTid3
 Jzg2sneWcJCzRuujj+2RNmczljMozW0lvIn9wweC9lytef2jsgUp6UfNSaaiEOux
 60pQeVIFuygGzFVuXwMy+eKzeKmTRy1vHWD+NEXKfxsuy/go2sFHit33kqG8l2bf
 tOaLec4r3VhhVNDl8aGRO2JYpKF6K9YfgGPUq4PbAwOccwrejy40BnFLnnezIE7Y
 1g8ZnCuy0Qu89+QTHu+pMU5XvEHn/GkfQOGkDKk6+0Vzyg==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5ksgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 13:08:00 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3d81b9bb1b3so54514105ab.1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 06:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745932079; x=1746536879;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iycI3ZTNsOLa0MGqAVtc71fWejZqL8jSxO6Snm5fiY=;
 b=Ko4o8s9a9yKfamQanuhnEidQp6O61jhJUZvWPPJh5dO1J6HZl1dD48mJ1vyBJW80jQ
 QFPcDEei1XMn+I+F9kSlX+VKfIlw+1dX7ohtDlcrJRi9ymx4uM/qFRb4AJYvD5Pl0lMo
 FolAlItkVHO/QMvD0XwCQJNtmElLvuNnde5JiStlJWIJRoiOYC82i7y16t4wUVmlIB9f
 v+8r9upMh5qajEiXNxM96Biffr5ULZ+D+NMPmdswshOEgw51RPX/TIAs4Y8QquQgPcpR
 W4DwmgY3BNakb5F53R89oZJ7bOiWWJr5JL9u2jK6A1Gdlmm+RL7nBDn3Yvl304eKNcby
 Qw2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU59k/xIBJxqqYOyXN5zp1s8m+21ZlfShFC/ZuAqTeC6vdYKUW72WHcbRNs262jQrbpWPOhqh0sDIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvBWv7XEZL7CVegZrQFkwDuOTf7sCAXbDLAXHn62GbSVzbvrU3
 g5udEACV0b7xc5B5Yz82kshnuKQ9p2ZemCC2w8HAi1eP7gSUod/OVyuq90muR+LQKKWr5ZXM3rW
 MvlQKi+SJRNoX3eBkP2m6ZK+m90V8Qjb7Ot6JP0BrKa+Hzh47p8gv6s615nI3Z/wGp5IqfxKK56
 I=
X-Gm-Gg: ASbGncvyBZCQk8VzXbJqMHlnaAc2BudNkPqnZNIPR+lyrYjDxtB4VOgJ6pjGZ45ezv5
 eyxgQWh6G/1oxgiZBplFRhq8HQzBDMXgEgD6Aw4+NKWgT+MW9jWvofUZ2rLJSOKxGqffvqbloAy
 YKVq8MMOr23zbPPJZMmo3BO7rAME6MnJeZyDkUJ2G1XM5YNRavtgSbLGzeCeJD/J3odVoDvHpzY
 eFInmLRWeMb+z4iPxJbYLhSmMOMtLTmu/S7BwyKFDYwt2/NFHj+aJbavlFZD379/fKLd4kPvyTZ
 TjxYoOerBNCpBRG8ovsWFDbxGxzpopa8I7yGkazCMEaG3RtSWrNhknglg60wnLDFiHRa/nE0Nzw
 =
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d95e037fb5mr29829335ab.21.1745932078931; 
 Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxYKe64KrJHOVGDGU//vPn33RLxakuwv3sE5bOFok85OIRMr67JhLX/wsIASignHrLnq4UpQ==
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3d95e037fb5mr29828975ab.21.1745932078596; 
 Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cca7fbbsm1878954e87.159.2025.04.29.06.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 06:07:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:07:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <gcy2ka6d57pcyymaqeilwuo224jydudxvfwd47d2ufkoycjydz@7lf2bjbz7kl4>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
 <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
 <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: XnwHhjcLCiiK16GfnPaq_Fc-tD9V3wTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OCBTYWx0ZWRfX6jjqnzcCzu/x
 fInREXKhbvkhx0dE0V63MuwRB7ZZIrgVwO6qWbUkanMCPKbQsmbt2LoA313B4b9oaAFtkLNJUPI
 7GM4yoyVyZYxlk7tdhuV0vVxY4g5sr7sxK/7AIFVTAr0qtnySs0tywEb2EQljYDAsPNg4bYhjug
 mIVithEaFI2Q2t1Oot155e4jzqXgNz4z8+MyBzy0qyuWxWMmnt4RIH+a3lnIJxDJlphbNt59GZM
 sZNye+UibGVu1jcIZzs+gT6BZU16KStC0DR46qAtXLqNltYOIdwK1xapiG3IrfYlTOycDkUu/dc
 O7cfpuSiMDk8l93e7m0izkAZmnpgV90sB4wX5fpF68XYNQdU7inLbubNOTLHgZs5Rb/HcNtfPzf
 uePY9pY/wgKGORmnGI47CoJqhgXbvgmQ3opvW4oeA/uuhRIyXO/Y4EEOzg91R8Qv3dzFclhT
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=6810cf30 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=x2CRZeuriRqWQSmQ5gwA:9 a=CjuIK1q_8ugA:10
 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-GUID: XnwHhjcLCiiK16GfnPaq_Fc-tD9V3wTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=654 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290098
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

On Tue, Apr 29, 2025 at 12:57:16PM +0200, Aleksandrs Vinarskis wrote:
> On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > > On 25-04-29 09:23:46, Johan Hovold wrote:
> > > > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> >
> > > > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > > > adapters or docks with retimers in transparent mode?
> >
> > > > Ok, but my concern is if they may have worked in a default transparent
> > > > mode.
> > >
> > > But if they are by default in transparent mode, doing the setup to
> > > transparent mode will not break it in any way.
> >
> > It looks like it will, see below.
> >
> > > > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > > > would return 0 and none of the of the transparent/non-transparent setup
> > > > > would happen.
> > > >
> > > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > > to the count or not? If they don't, how would you ever learn that there
> > > > are any LTTPRs? If they do, it seems we may have a problem here.
> > >
> > > Count gets increased either way. It doesn't matter if they are in
> > > transparent mode or not.
> >
> > Thanks for confirming. So then it seems we do have a problem as since
> > 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> > mode.
> 
> In this case, let me add Fixes to the entire series. Do you think we
> could land it in 6.15-rcX then? The second option proposed to roll
> back current LTTPR support and wait until 6.16 will completely break
> DP output on all X1E, so it's very undesirable.

It should be possible, if you rebase onto 6.15-rc, add Fixes tags and
send it quickly enough.

> This series was tested quite a bit on at least the X1E/X1P devices,
> both with and without docking stations, as it is also (v2 iirc) part
> of Ubuntu's concept tree since little over a month ago. You have
> confirmed that x13s also works with this change but without a docking
> station. If someone could confirm that x13s with this change does work
> with a docking station as well, it would be safe to merge the entire
> series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
> perhaps someone has both x13s (or another qcom-based non X1(E) device)
> and a docking station.
> 
> Thanks,
> Alex
> 
> >
> > Johan

-- 
With best wishes
Dmitry
