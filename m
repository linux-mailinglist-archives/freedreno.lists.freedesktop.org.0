Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD97B0A110
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 12:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D8710E94E;
	Fri, 18 Jul 2025 10:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQ3fnn8K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D8A10E94E
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 10:52:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8UF2i025177
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 10:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z5VSiGr2ZsbWALN5zUGrP4LvnTpKbEmqDudeNgwiofk=; b=XQ3fnn8KWQnlFULU
 5L3W73USuyaN7s2dXbIcdUf6p7jmGnYi+oke2do1OxoajZRizQRTxrENbqmhs2Hw
 GYvuHVhwEm8qWnR56XeNF2cuT1eRtQ3D0HZ7PmoP3fhHB+StAnc3DDP/30xVU2+h
 Bi+OeqluFL5oHg1PycnzPfWSVOJl5Nqqrg6hHQfvskCZsQKbpgD+7/TQISiMldkB
 RflRK94JMxxC8YJLNfsEcyQc4ez8zmq28wM3y90BXwId2VNXTM2Dj5LL4b1OehHE
 AWstoSXfcxsCwDemu8BRjgxb3GyFCYPFBL8S5YwYx90GYdPU1MW6p9BplYHZTiMm
 9Pe8vQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqfd3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 10:52:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fd0a3f15daso63020826d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 03:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752835935; x=1753440735;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z5VSiGr2ZsbWALN5zUGrP4LvnTpKbEmqDudeNgwiofk=;
 b=ZoYLDoxBkyciEwtJVTbRK3FdbBDarZ/nZ9MwXms0HWCaOI25bVSOEXaP5kRYt0Yx2E
 E01n+wZa7le/8FhWKT6aN8YGykE8Z+nUHTM2/fbaSw0HvovabW0UjShWoMPX9RE/DgW6
 s33scErrLvqVWU3e5HSd1+L3jO+guqdY6BsW50CHrfvDnD11Yi7wvYhBxX2EOmoxVzX3
 qdNTkHM6GINZ/wCyw2YWBNmujCFfNV7bkxFVChgf5ccZZc1Pfmn4KVQ0A5mRqNJZuO+5
 pDe36jEKYocwUeTz5bXP2b8K8C0LUTcZrDnP+jlb6t6ixaJbmYHXYo3AFABOnIVxP7+h
 6ewg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhU714jxRRPnRgjpQJsSj0QWH1InevSfZALMiKAy2YQ6/3rMxy9/Qp+b2SlDDsd+ZAp0b75luz1z4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx40TDxyvSUX0aol13lhYGhLIqSyFr04LsqHcLoPVPfMO1Qmeu5
 TZyMPZp7+ed4lUl9NBxbmpkOMt45E0uaOgYGaww6jw4HVmahJJ6Bd3psS5C+BPItavlWppxE+uh
 GjlTBCu1N61iknfNaejT+plvmOzuY4g6gaMOoaJ5PttUBLiIg2zTUkcw9/4oxD77fkLNmXfA=
X-Gm-Gg: ASbGncu87LlkodZXn/MNIUuUPR+b6G3SzOMAg/8ImBiAS7matgONCVb12U02zW5EMxR
 S4S5VIC14LZTmMO6mQE1dEBaLxRIoeW7T6CIxpmklqWZgUlNn+lj25vEMae/u1cIO9BbuyR+5ug
 AepqFYDggclW92gP3ibdY5DKHJJHzeM3s4xQA9Xwe5xbeO0/oKh8khjDcHM5sYzVCDZAnGILDr7
 S7PdhqzeuRhIdfj6+h1/8PI7vJEti5dUQbu7rIZ7tch87sK9tPh8j4HpeDwpwfLWtZGkGYDC1zF
 Znl2MzaQas7rbrWJ4IQs9GbF1vjOQvikDPHsiuHEdkD2Kxrw8THvqJABJk3no66DCl84VGHKra4
 v26p2c0j1kV4RzmrYSzfHpbVFPppDvF7gZ8gr+TTWJdNipZbmKPM8
X-Received: by 2002:a05:6214:e8f:b0:702:d1aa:46e6 with SMTP id
 6a1803df08f44-7051a113c5amr35693506d6.28.1752835934553; 
 Fri, 18 Jul 2025 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKvAUe8ztGpRE1cKK45MSgMouCPAT64Xsgug+JyUGRTY/H140Uw/uocYvI3w9Cr7n97LJF1w==
X-Received: by 2002:a05:6214:e8f:b0:702:d1aa:46e6 with SMTP id
 6a1803df08f44-7051a113c5amr35692906d6.28.1752835934062; 
 Fri, 18 Jul 2025 03:52:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c6b2sm212215e87.86.2025.07.18.03.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 03:52:13 -0700 (PDT)
Date: Fri, 18 Jul 2025 13:52:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Xilin Wu <sophon@radxa.com>, Dale Whinham <daleyo@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
Message-ID: <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
 <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a275f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=pGLkceISAAAA:8
 a=7PkR_4yZ3uwBbB41sqoA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: u34z6ri3W6gJEdYM6vD9JooM3su5p5Et
X-Proofpoint-GUID: u34z6ri3W6gJEdYM6vD9JooM3su5p5Et
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NSBTYWx0ZWRfX85kgJmbjgCAZ
 Nphp0waQ5nXUm/6EJGlVzvRiA1wa8b+wOhJVora+JBKfkgmnYzsw/sHLHWLvO3Xh0vIt2olYcOr
 FLu4KLYUbIWAUKS6yfI7JwRhPj2UPpjNQMA8e7aq8MLLy9ZWzLVMLtcaN/RydlOsziJOnwCQQ6e
 ez44KxyrVjZ6a3gN/ryp5njHxPGXqqq72fCRWfScwdM4cy1DjLdJiv0mpP+xBe45rVDMiE9We3a
 rTPTBS5pdBTSDAjiPv2hLNONIDaCGsbGleD6wJMsMe6FpcpXqRg52JWj/AAHtUkh7IVXGG7dGWS
 0jUUYJQhFdUmChx+lmFWe0KuPvF8njFDMzsC0ciIFQfCBIgUaEe1lprPRnaR771x3bBdbSB9M4D
 M0SRBKvSaE4hXS605jCCSF5acn0YPZUSoPdb5XWF366McnRs5+iiMylpj6YPBbIzHL0dU1xi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180085
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

On Thu, Jul 17, 2025 at 11:36:38PM +0200, Jérôme de Bretagne wrote:
> Le jeu. 17 juil. 2025 à 23:10, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> a écrit :
> >
> > On 7/17/25 10:27 PM, Jérôme de Bretagne wrote:
> > > On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
> > >>
> > >> On 2025/7/15 01:35:42, Dale Whinham wrote:
> > >>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > >>>
> > >>> The OLED display in the Surface Pro 11 reports a maximum link rate of
> > >>> zero in its DPCD, causing it to fail to probe correctly.
> > >>>
> > >>> The Surface Pro 11's DSDT table contains some XML with an
> > >>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> > >>> (8.1Gbps/HBR3).
> > >>>
> > >>> Add a quirk to conditionally override the max link rate if its value
> > >>> is zero specifically for this model.
> > >>>
> > >>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> > >>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > >>> ---
> > >>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> > >>>   1 file changed, 13 insertions(+)
> > >>>

[...]

> 
> > >
> > > Is it a feature planned in the short-medium term within the MSM driver?
> > > If not, would a quirk like [4] be acceptable upstream in the meanwhile?
> >
> > I'm not a display guy, but this looks like yet another block of code
> > begging to be commonized across DP drivers,
> 
> I agree 100% in principle, but the 3 implementations are different today.
> 
> > so I wouldn't expect it to be a big blocker.
> 
> Well, it is for me :)
> 
> > Adding a panel quirk doesn't seem in order, as the panel is /probably/
> > very much in spec, and it's the driver bit that's missing.
> 
> I agree that a quirk shouldn't be needed. I guess we'll work on
> upstreaming everything else and keep an out-of-tree patch for this
> issue for the moment That's a bit sad as this will block regular
> users from easily installing / testing via the Ubuntu Concept ISO
> for instance.
> 
> Or could the quirk be accepted temporarily with good comments
> then reverted when the driver adds the missing support? I guess
> it would depend on the time scale of this support landing.

Unforutunately, there is more than that. We should also be writing the
LINK_RATE_SET register. So, just setting the max_bw is not enough.

-- 
With best wishes
Dmitry
