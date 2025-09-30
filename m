Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325BABAE6E0
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 21:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D20410E28D;
	Tue, 30 Sep 2025 19:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvqfauCo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4798B10E09D
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 19:20:51 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBxU2Z012446
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 19:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=; b=QvqfauCoLCsFHunX
 BW86ook4l0mDvdjjOiDOGqcsZnMBR0QjXPr5w0Fh1ir4MAaYUxNmE6N3CorKuHcS
 QKTAtV50kLvUayA/gTgxQnrycTPzg4KvRmimnmFUCiVKhAEQxjHx4tdZxfvES3RG
 oTFF1PIpdIK82Q9Z7I+5YFb272irfvWvirWb4OkSI+9/Ldi9J8ogcHCM3H6mbGyw
 K1vSOcf++D5HqneStj8qqQlRJKQLOQ18NF3asMJW1gRAIbj9R/P8vwxt2OBXCsX2
 UTiu3mKqXDwbiLQ+13xAqQqmcQTt/j7yeCJvE5wF2yAzDnBMZ6uXPiee71XLOU3w
 7VoiXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a627vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 19:20:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4df22892603so89457861cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 12:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759260049; x=1759864849;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KVXK3wyj4xgxBO/QQE/5ijkihmvihUgMziMTP7OJVrk=;
 b=M/w7LBZMeaRoRa2ncyCebl8sYqLsBvdN4VZbNajtTYHNLbG1F3kYajLOuAewBChYJc
 fL73OuWGUJ1dtqDNN5qCJIHn3KustHg+4kK69TfUfDHXmepFqBazs8uSZwFdxsqjN6r4
 50osQUQfy7cJRJYwLZjE5q/mGXuVLnOuqRCes4O8xdTgSznf7/2vuUl8RsM36GcZ0/6f
 Ck/NSthlU2uA2//lBAS1eWiGFc6KxLoyIrSQCTHTZtne7VVFeHmj5X7wioPlJggh8li8
 s7zQ4yXy1u9e5vns/4ISwoAi21O3qR0tJicn+k6QhedkJzfsnemJUSoX9/qOZikPj13c
 jKig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoSGhWHE18itJCsct12UJJEiz6jsHzoQnsty39RYL6uczxpN4sWCprU57io0GtZGsJ1lLBfDhP6xg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZpRYmYdGxLuKnrlVTC4PruqblgsyFql1R13vBHrh6nxz4+uD5
 DzqkRDjcNHw5ogZnwAtGIa4zAU8aFnNWNn3a6K0v1cFdh0PIEw5+HjfJFvevmVBMX6683fxNT1a
 Hp86nIPhSSZUDH+5I4qmuDgyK+o+v8VtNbzpCbz+XI9ERgamTff0LG2Mgr4OE80Rth5SgBcI=
X-Gm-Gg: ASbGncsQGZogy/brk2fjWHbBGgHcmlmZOf9hnaStXWYBauJiE9OgpK9EMDyKJ0iiG/t
 Rvs2pVrX5Qq1nYaUs/80A7gxdaghUDlF13BK2J2fqUXLXWaOGeyakF1JMhc5bKj2zY0K3PcZQ/e
 Ei3/6tSyu7H+NOqtBue21CrTuG6HtyvvouObjg+fnlrxsVcMF4awkAgdhTatxACtXtJ0x7dSc9R
 PHugEp0TrKMxZwucW+Yfjst5XLHkhYW8oNuUwoQGx1XJMphNwUyT8Hhxz4pOTDc1t8WSboRrTAj
 OESQYxuZbudhOoudtbO+YHjR7kG2bD6pWkZU032Z11WG/IZ5+QFKiI1iiZmC6rfGrx0RgIVdXKg
 seuQteCx2eVJ39O2gI7tjG0MxHlNO3ylBG/5uhhzWD/9oJOrzEqqqci18jA==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id
 d75a77b69052e-4e41e256b01mr10937251cf.64.1759260049473; 
 Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlv8GouDfLH9jxcZXz4sZ9qg6O7hSAY2xOrBu+sewtGI48yKBVhvRDPT2OTQMfLyqgcLMpDQ==
X-Received: by 2002:ac8:6906:0:b0:4d2:d413:1f3a with SMTP id
 d75a77b69052e-4e41e256b01mr10936801cf.64.1759260049035; 
 Tue, 30 Sep 2025 12:20:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583134310bfsm5244156e87.26.2025.09.30.12.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 12:20:48 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
Message-ID: <ftbecn7dlcp6pqtpfl5v7kv2kevz5m4yqcy7fg3atkdjabkt67@zqwwostqqfou>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com>
 <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
 <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dc2d92 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IkzWstXsGuqL4x2q7pEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: K5g6Py5wycmUQn6nBxQv6Pb91E1g9_-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXw7LIwQrCR78w
 eLoVoS8WcGRzjnhC+YRgEUsxw+NqYr7mxnFuiZiKqIYXAe0LESZFpQVUhYEEM73N++paQ+Xwec0
 7YISq+jE8TEwoPGfbe49hG2OP/ztmT5FIWjmO30rqdaOtLrqgUoHeyHu63ot8cIDqGnLrt6a4C5
 tCQL8nEkfOLLGyY5vm617+x4WWqa8QFzYqdZ79tDGuKjUcKrdQhvewDi+S2Tlb4zy5bwk9rePfv
 KaecYWW6MfW3tkV1YzEgwFMlniqMH1FcaRkQVHAWy9efKZv5sOMp4kvL4Yxj3b4jmD/Zt1oy+Wt
 A299ZQzwEE+YRRS0tKLeCbH78hJwtLzb2msoSr8kSZiSzVMRFSLa6LlYMMvwf+Hsk/mnklTOdHq
 F0/ZXOfVNl5cS813y6dWMxUcLRVTLw==
X-Proofpoint-ORIG-GUID: K5g6Py5wycmUQn6nBxQv6Pb91E1g9_-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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

On Tue, Sep 30, 2025 at 12:25:55AM -0700, Rob Clark wrote:
> On Tue, Sep 30, 2025 at 12:05 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> > > PIPE enum definitions are backward compatible. So move its definition
> > > to adreno_common.xml.
> >
> > What do you mean here by 'backward compatible'. Are they going to be
> > used on a6xx? a5xx? If not, then why do we need to move them?
> 
> Newer gen's introduce pipe enums which do not exist on older gens, but
> the numeric values do not conflict.  Ie. each gen is a superset of the
> previous.

I see.

With the updated commit message:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> BR,
> -R
> 
> > >
> > > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
> > >  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++---------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++--------
> > >  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++-----------
> > >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
> > >  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
> > >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
> > >  7 files changed, 617 insertions(+), 613 deletions(-)
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
