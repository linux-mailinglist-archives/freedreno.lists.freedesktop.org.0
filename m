Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC55B44454
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 19:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F1810E33E;
	Thu,  4 Sep 2025 17:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5RlK2Nt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B969210E33E
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 17:29:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUxSi018575
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 17:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U4HSqJJKUJgHemW3ItHKzJuo91NgrXy7FmK7UmSqX0Y=; b=o5RlK2NtZhXh/To8
 HGTDqprDWTCdb3Uv0MLTr9XBz7AGVAOGsMBa924oyD28uRFBUguVz47Vw36w3aQ9
 GEjEmkSjFoNUz8vWNaaN2GFLT+kVidJB5ovdUoJQTMLGEbELElXfhtzCnjKzW8t5
 eCHjmdOIi5TyquYgcWdoVOGtCLXq6VghiCmoVz/grGWRXb8GolZV4V7AxMWSjOpB
 mIEzF43zpojRWkMG8fSqPZio0EAYteIbnGbx+aj04Rvnc3M7j9CfKA9gxMkyiUBg
 VqPICSnwK8LUk6M0aU4qGt0+CUj8wo8vC9cr6cZDFsZdCiWUa1ajlxo8EXoah1qo
 mGi45Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebur6cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 17:29:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b3118ab93aso22207061cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 10:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757006950; x=1757611750;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U4HSqJJKUJgHemW3ItHKzJuo91NgrXy7FmK7UmSqX0Y=;
 b=npTppoaACQNNqCGBDJQ+p5RaSho1SZB2ci5ZXRMJufI/xH0h82Qrud26h4mXgGsFxN
 cFNOjenum18tt5UNH+jM51X45GYlIBwFFhiXJ1H/swbKMcBlPFeqUO/qzlGwl6X1+MDt
 b0nGm3JF5sIi9yDApAF3bNPtKYWqeSvLpdggOk4VoBpPtPUm85MYZisDsDf7ae6e+lyW
 v0nqnwkNoZ5DvHQ0KAmimgz88RR3mejw/l6xYmWGGaq7iUGJZUtx5TeYzV8HN9dkkRhV
 jmKuLHHHXLcFus3uLJtKm3z1xti/3l3eRvexnASQxpv3ck2qYP7jDUmZ2KCpV8QnrBfx
 9ABA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGXGZVLxmARZkvJR7vC7Ag8BuDAx6JaETwrv/PV4P94fmHKktnQQK2iFi05se8YrB4ethqX8ZqGoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP+Wy4VwB/0ythCDBITqlMGWjtPU822Rk0xFdBDy+10MCHxCe7
 iNpbevOtuY+PXQ5hNP0R8rraEM6H28n4vhO6o62N8YArvdGX8KCF7XkxxrpmJ7ZrxAIsJT7iZQf
 0ggqbtK4yrkB1eGi3YLQttZCEhSeW0Y6qKl9VaoY5TERngyPrdbqhROV9odtPLQu7K2i3DyU=
X-Gm-Gg: ASbGncsZc8boVH76YB+AgR43yewMn9mPCwf8tRHcMUdRlivHdLFZyiQG3wgMCsbi0Hd
 lDu4sBwj3sLf2YpgYvULNAJHZmnHi9zKamoJJMPNNHkVgCXVeY0pj+e56m9BLIXPXMEHXfAdN5e
 b43TWSH9CBv9KGBSBRu3IYK/JuK3OiM6kZlBlr+6ECginaagd/lEtPltDaH6unZSmKkIMDBrmRQ
 siNK7fNlKTv24T11EKT6nQbYKf1DrT5r3tVOdabRy/2x/dh0KuPkrF2yf8tHSaKUWigaAi4OWFZ
 d8Rr7v9ErjIZCWiWhPcCSNuHbcMrmHAaSbVUTiSa61R6CFlTCr5rhb6E0+FS4DdjFdFF2jkan9g
 G6Nm1T3i9jtF6sQGd1JQYXlB1QWjmNvTo0PV+e0KAx2Kwzn33odPl
X-Received: by 2002:a05:622a:4e:b0:4b2:fbbb:cd47 with SMTP id
 d75a77b69052e-4b31dd1ffe2mr257449451cf.79.1757006949704; 
 Thu, 04 Sep 2025 10:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNSvNTXAJpiFlDTiLw2UNIBHVhJ1puSDzs/X0PalMSkD4/kVf+SzhWlkUHsBE8oJ71Jpu99g==
X-Received: by 2002:a05:622a:4e:b0:4b2:fbbb:cd47 with SMTP id
 d75a77b69052e-4b31dd1ffe2mr257449121cf.79.1757006949162; 
 Thu, 04 Sep 2025 10:29:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c90454sm16554751fa.18.2025.09.04.10.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 10:29:07 -0700 (PDT)
Date: Thu, 4 Sep 2025 20:29:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 12/13] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <hzkvl7zyuq2fsavp2butdvbfykpzw5lz4f2eg2rzu4hgbxxq4j@tmoxnq2t5koq>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
 <xcq25wmw7roelcmoljypn3ozt7kqvylgibz2cloxghaeurcwvs@jjay7hton6md>
 <CABymUCNXVfZyhCbkiqzJ-K2zGe=bofD82OD20d-CG+a-KkgN5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNXVfZyhCbkiqzJ-K2zGe=bofD82OD20d-CG+a-KkgN5Q@mail.gmail.com>
X-Proofpoint-GUID: 8_PbV2r1nqm6T-ljiuMQfuir1p3Gj8KD
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68b9cc66 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=oA6wIzCi5S8-5R6LlW4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfXw805eRYmnq5u
 akpx4fall5oIHdVv7plhXmNEEpRfqeZDFNP4XGXCcSubYci7VN3gXBog4eWdiKYpeHICj486bsO
 OuK3Ns7qdq+raIHdBnGADAsWVDbuWq1tAXqCG1eFjcCQCMflmzhInww0G6FwxhgCkO20/Ord0x5
 4fOh40IRSYdug3Rw4prdnx8iAJ/AX2HRHnPz7vTw7YkPlHvZ8zpCAQHMHUPiSSK1J1cC8VO83z8
 gcPMKdUcadcLi2IVgs6cMwHXG5JQMeWyIIaNokObc2N0aWZaKAJvYe07sBTuRTW1OQbtSxtqFq3
 h49co7Jj4PdUI8tBoOCwg4FK3Ys9a/aSv2HOu+kLtLkppH+tbGORb9auujke7WKGduAizlFyhI0
 7lfW8rBW
X-Proofpoint-ORIG-GUID: 8_PbV2r1nqm6T-ljiuMQfuir1p3Gj8KD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
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

On Fri, Sep 05, 2025 at 12:09:52AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月3日周三 17:39写道：
> >
> > On Tue, Aug 19, 2025 at 09:31:06AM +0800, Jun Nie wrote:
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen is futher handled by two
> > > pipes if its width exceeds a limit for a single pipe.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > I've run several CI workloads. This is the first commit which breaks IGT
> > tests. See https://gitlab.freedesktop.org/drm/msm/-/pipelines/1503075
> 
> Thanks for the work! I did test locally with all my patch set on sm8650 and
> did not reproduce the issue. The baseline is not aligned with msm-next-lumag
> yet because I need to port my platform patches to it. I will do it tomorrow.
>  Do you think this issue is related to difference of sm8650 and sm8350?
> Regarding all failure cases are write back related.

First of all, It's not only about SM8350. Tests also fail on SC7180.

Second, it's not about write back. I see various test failures. Please
rerun the test suite with virtual planes being disabled on SM8650 HDK.

-- 
With best wishes
Dmitry
