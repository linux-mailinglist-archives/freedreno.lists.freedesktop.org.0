Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAF4BD2FA1
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 14:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485E210E32E;
	Mon, 13 Oct 2025 12:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RG5gfZkD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B474010E31E
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:31:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DANV5e017135
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cYNxqbays5cmz2HSt+aik4gYTlT8HzRJE2TAcbJc00E=; b=RG5gfZkDPqOcbesY
 rfVW6bPEGX9tzIziEyGZZR8sGsmTBwq27ET3o7go0P3gkwiHQmViKW2ezPPKShIU
 5PRayu/Zk0QPs0Li9tMb/in2D4S0jkp/yDhgXdrVJFHDtoeZiVmWK9wIAKhPWRoy
 ezlE3z89gkWNjqJ3Twrwo25XY1kDNgvzl9AaDWNBBXkurwP8PGATBG8DLk+83/7K
 CCNpEt+RhRRO9hvVxPiOlf1eopM1xx6h8HLnb2iqF4UaJ9p8o+TWtdFmE7Rgf/TX
 YJzAEjSzx02ty/fzRU1OtLfFwyJMN1n/jeYwzcNLyGpjPh3UkWytZyU49Ql+WTBT
 qSIJdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk4gpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:31:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-870d82c566fso2080219085a.1
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 05:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358708; x=1760963508;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cYNxqbays5cmz2HSt+aik4gYTlT8HzRJE2TAcbJc00E=;
 b=wO8Z+OsuFMTq6+DkIwA1NCzc59aijOklfYJyBbWAbsjY+qAxeVzTirXrFiIOt8+7R9
 pJWmETB0WA9/X+5iJr4Q0GoRUnOfvL9Up2Rh0EOHleMpkJDYk52cFdXsswSyQNdtbFcz
 l25kIMPzEPfDGENZSqmqxKvVaSVkQemO+pXTuyZGqaj3htmWKsDXw85ed3AuGTbTTNhU
 WGL6sglYEEzEudGm0ca0OFXeQk52ODJI0/55YkboccoScLIIyn8NV9ZMqRFxeWzwnEBc
 Iz6EM4O7DQ/zXMNrKdq30zgQm1OAeMNG2lQ8Yk8p4AlioGNdgmCvbqrtvT7knNniU2O1
 RVzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxsgNOCU2FcWk3fEUJAnC2tSBJSLDsjgt2Q8VHMHe0wfvUHIAfI1JZlgf+dxf7RzqOteV7CKYK2YE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkeZQAytm2JfGiUpXRom4mVcHATfbJh2PYWjuD586bUuwhumHA
 nYkbeP1JnEX9DuDH3UKKIQ2gTZV543yt1xvwxznm8B+tijgyT/29GXNULrRGF1SpLq0ScRclRkp
 60o9rK9eTB9G7mgS7Y8NvLZvWJP8c8wtx4Izmr/d9JYCrRJgHPYRkTnfdHPQILx6eQ5+0i14=
X-Gm-Gg: ASbGncsMbRDBDweHGEVxqO4Txr4ktaKk459ZKRKuMye1I9kYHqcYKaEHoOLV6qmBlYu
 eR+HX2J/eLDL3u0o5cq65dRvHXfG1H0xOZ9pf0hnKgsCPN0fTUuJtKLBb9WDhI/EVG0QzW2UN89
 YG6uCu/kfQz3R6wnkCcnL3zVGRrtEUmo8jm+2OQibMSBbU0tIfSbI1OM/IudZB/v6VpSV+1gsIf
 WoD8cAr/FNtW3r6l0Pufjgqt7eIGrtTgDyh/tV95HCFGYgPgwFpzdwpvdwe9IhWkizmpBPX2tqb
 /UMV2kZLjY1MZBpfGvuZ+Y+wKYGFoTOhXyidZb0A5II65nxImV9ex3HfV5v/KMSz1u+EEv6a92P
 FTHPxMTT6rP1xCxxmBzvoD+OyOAcxRQfpZa60uxEwZqEaG7dTpqEV
X-Received: by 2002:a05:620a:3954:b0:813:3a81:1a49 with SMTP id
 af79cd13be357-8820b47d622mr3460911585a.12.1760358707752; 
 Mon, 13 Oct 2025 05:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxWv8jBSeEMJrjh9fglJwfOjWcpLkZZq9O6emnAaN6L/NdN9TASZgfwtditG4j7n9Ie4Y6Dg==
X-Received: by 2002:a05:620a:3954:b0:813:3a81:1a49 with SMTP id
 af79cd13be357-8820b47d622mr3460906385a.12.1760358707218; 
 Mon, 13 Oct 2025 05:31:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e7b47ddsm31234111fa.21.2025.10.13.05.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:31:46 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:31:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <icj24ghckurcunjormsfhhscng4wfcxiyadl2z5xduitxxqqmp@iws3pssew5dx>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
 <20251001135914.13754-3-caojunjie650@gmail.com>
 <cwgn24f6tnmytd4omr2tul4e5jjin3ijji3ff3qkumqm2xe3t3@ntayu3m5kai3>
 <CAK6c68jBwykcWZm3ckm3nwab-X9Are4rD-eauE4rXA2+XvuX1w@mail.gmail.com>
 <9cafccd5-35d4-46c5-aa57-1b0b8ec116e8@oss.qualcomm.com>
 <CAK6c68iV=n3BvMMa30FuehbMs7-U01s0saZnsYwPVoiyw0VTrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK6c68iV=n3BvMMa30FuehbMs7-U01s0saZnsYwPVoiyw0VTrg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: dcE8p1Xj0MKRA0pTB5_aOuUbqIuP77mR
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ecf134 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=RAbU-raeAAAA:8
 a=pGLkceISAAAA:8 a=Vo2vBpsxqBqMA0PNVwMA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: dcE8p1Xj0MKRA0pTB5_aOuUbqIuP77mR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+8rcPvC6t5ws
 7rxR5PZNbSl375cWFqskTzbVeLlje4LlhF8QoUx9JTXUETKpApLF8KM6NjSXY42m/f4lfKQMWqb
 m35iGRLRBNZiRdaOJaWSH0dvaY84Th8aJX2S2bjhhAc780UPpZyOx4HtzgyAbkCwVWZFuohRNfA
 g0EA9Aab6OFm+4PSPZpM3ZArOpF2LpVZTNvhYEwNy46x4lUlQbdH4DkYoG5lBZkKPuLwWg17ZHk
 7ETQFPyPPw/uRG3F1ayplMCHFC3xrffFjoKkr1dbWY0qfGzHKfCOHjj2cFIl6u/VsMIL1bJ2hHz
 dDeoBb5tnFzGYtGZIgxwjLf+1LU8m+MABQ8H/av39H5VAtg+P2IY+BzBktpEUa6FqBXkdEJPzlP
 29MqvTlZQygyYLXTdGmM1YLnTL6cXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Mon, Oct 13, 2025 at 07:04:43PM +0800, Junjie Cao wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年10月13日周一 17:39写道：
> > On 13/10/2025 04:52, 曹俊杰 wrote:
> > >  >Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com
> > > <mailto:dmitry.baryshkov@oss.qualcomm.com>> 于2025年10月2日周四 10:04写道：
> > >  >On Wed, Oct 01, 2025 at 09:59:13PM +0800, Junjie Cao wrote:
> > >  >> From: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> > >  >>
> > >  >> Some panels support multiple slice to be sent in a single DSC
> > > packet. And
> > >  >> this feature is a must for specific panels, such as JDI LPM026M648C.
> > > Add a
> > >  >> dsc_slice_per_pkt member into struct mipi_dsi_device and support the
> > >  >> feature in msm mdss driver.
> > >  >>
> > >  >> Co-developed-by: Jonathan Marek <jonathan@marek.ca
> > > <mailto:jonathan@marek.ca>>
> > >  >> Signed-off-by: Jonathan Marek <jonathan@marek.ca
> > > <mailto:jonathan@marek.ca>>
> > >  >> Signed-off-by: Jun Nie <jun.nie@linaro.org <mailto:jun.nie@linaro.org>>
> > >  >> Signed-off-by: Junjie Cao <caojunjie650@gmail.com
> > > <mailto:caojunjie650@gmail.com>>
> > >  >> ---
> > >  >>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
> > >  >>  include/drm/drm_mipi_dsi.h         |  2 ++
> > >  >>  2 files changed, 12 insertions(+), 15 deletions(-)
> > >  >
> > >  >Please extract the generic part, so that it can be merged through a
> > >  >generic tree.
> > >  >
> > >
> > > Sorry, I don't get it.  The generic part, generic tree? Do you mean
> > > the drm tree? `slice_per_pkt >= 2` is seen on the panels of these
> > > tablets that are equipped with qcom chips. I don't know if these
> > > panels are used on other platforms, and if it is necessary to do it
> > > in drm.
> >
> > There are two changes here:
> > - MIPI DSI header change
> > - msm DSI driver
> >
> > I've asked to split it to those two commits so that he change for
> > drm_mipi_dsi.h is more obvious for reviewers and so that it can be
> > merged through a drm-misc tree (or through drm-msm tree provided it gets
> > a necessary ack).
> >
> 
> Thanks for your clear explanation.
> 
> I don't mind to add the field separately. But should I submit it
> with the panel driver together? Otherwise, this field is unused
> for a while.
> 
> However, as you mentioned, this is not a part of standard, neither
> mipi dsi nor VESA DSC. Recently, only Qualcomm devices require it
> to calculate parameters, then we use them to program registers. Why
> don't we parse the field from devicetree?

Because the value is uniquelly identified by the panel's compat string.

-- 
With best wishes
Dmitry
