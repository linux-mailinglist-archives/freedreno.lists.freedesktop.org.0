Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7437B47A92
	for <lists+freedreno@lfdr.de>; Sun,  7 Sep 2025 12:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1CE10E1AD;
	Sun,  7 Sep 2025 10:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcHGEupK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C468510E1A9
 for <freedreno@lists.freedesktop.org>; Sun,  7 Sep 2025 10:57:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5879WBPT027661
 for <freedreno@lists.freedesktop.org>; Sun, 7 Sep 2025 10:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Utiwmvf7x+ib9aisS1Pi13DrFz7GSmiEyGwpkMiTHUI=; b=HcHGEupKcXYaoVUc
 QoJz2YXnCAJB6vwcxdVSqlUcYD9PyqGiHfH/BPE31XTRUDQfzpQJoI9IEPOEJhDj
 UrEOzbgoLxuK+2V1pqipwvVQ6/2oHylhtzNoklEGJpFBzFT6Kfhnoe0XmwmwbUtD
 LIgE+FGlDcvebMANa5dSwvRIV/F0/XAO2jBpQ94RMTIUwUeyaAQF2hXPPy4nRUb+
 cDG71JBruJnAXI6cHa9+YeI8B08IcwU2C5Bj+95CLCj6ybR+22QUp6DtXfqouRn2
 zc4lem4XcQUCKgtlfLs4Awdc1sE2ing+r2QjJYl0sZRP5dHXjJ+VhF1GV0+9vW4z
 pcYYiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1va04d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 07 Sep 2025 10:57:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-726aec6cf9fso114171676d6.1
 for <freedreno@lists.freedesktop.org>; Sun, 07 Sep 2025 03:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757242665; x=1757847465;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Utiwmvf7x+ib9aisS1Pi13DrFz7GSmiEyGwpkMiTHUI=;
 b=HC0G63oSowee7twYK4AXbuAz+ME4eQIdedWhzU7Ac1SesjLhtoMO1IIHnTO4rgCunX
 rZVJevLZErJNn37Fgrab8Iy+2AidsnNJNrfFHPE06/phrWXWn93KiqrpMWOcEMbGQvby
 ZezgO5kWo6HVkVuhuqIvbTGK0PBMFSTFOPDUq7pQ2B2Lqe0m8X7yw7JlMpLN+U+7uEnO
 goTEL6pYUSE9qKDJkLES7vk84sSKNyD5+zDEbdUwOXV0M9WSonXp1UfEKntpeich2toO
 RJZGYpOaVzURVCoHjo+X1bk9IjW3BDTKetvTkZ3MzL+TFGIn4skjdM+9qTfP+iqJeFtO
 VEng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWcEmHKTFB0I+RWMxgI6IzmblHCrxnkVQYPwwx39Tt6wA58zFf/76XqJAVcxvsD78dTb0gOCWPd/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzMw1si6TjJmEqYvgAZ30T14KAreaxcKrSWs454UYN1O0aJUCb
 9+l+BQsGlQpx+Z/3QCwdb9DK6NNa/lCeThI/qLekLdTZWk5MCKVNXmPHw95fCF5zp1rZeEjTgEz
 vF7A9kNVmC53GQ3EXIKBicmELVjP+4nb+a/FLymCfk3QglXxkUyIPJ4YnIL1JucghFYX+pME=
X-Gm-Gg: ASbGncuKLdAW2lIi5+0NiXhh48a7heQ5+Ef0B6wFDXZCKvvd7xc8DohNfATT2xdkBoM
 xcjiFnUhNYLUtc1vpezzmyV0cPNVAKcwCBjLqFPam2bEEJR3mXnc0TgH7YMusnEZ6fsxZ7TGb5o
 FOZaGXZdwoT37GQJJSSgvCw8gkQe+k4NVwng04UO0E0RpDBmMMwDhPhbFIb+dANU+AVbgOh79xP
 +feJru0XjX2Y/hkdxxrmyQI6cERHTjDeIM79kKTw1smqr3Gy3klBJU4NMv6rj0l3x+isJ6kzjx7
 GB7VqWgXkSb07SEvX9B4eVKjF7a3Uwn5EZbZHEqB+f4xcem4w40shvO6kU3Y515ZQV9sd8HZhTX
 7lO7vMqqe02kZs/mS/uglk7lh8WuG84sWaDmkDlFbHONkWP4tEzMS
X-Received: by 2002:a05:6214:e48:b0:70f:a8a4:e987 with SMTP id
 6a1803df08f44-7393ca985e0mr52736976d6.44.1757242664790; 
 Sun, 07 Sep 2025 03:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH67snNXBDbOrGPpeIUXj3nTtQsTDZBXe0/FNWFzMKo22DEE8TPYZk+Wta8WeNkI8sjpu08A==
X-Received: by 2002:a05:6214:e48:b0:70f:a8a4:e987 with SMTP id
 6a1803df08f44-7393ca985e0mr52736756d6.44.1757242664396; 
 Sun, 07 Sep 2025 03:57:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad4e2e3sm2850443e87.147.2025.09.07.03.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 03:57:43 -0700 (PDT)
Date: Sun, 7 Sep 2025 13:57:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <eoqcx4cjrfuf5a447c62ydrrvxncbya5iw3jgpvfdeijp6be6v@goctbvocjywa>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: 1nnjogL7RBZKnt_z93DUpYMrLzQQpJ5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfX0RmWFlkB+wYW
 gbNGuUU/XLLMjLq1r8IYHR5kpUfbHTCONoBpabBFlOxxdiqxpeYJbdhs/5mQ0c0OKPDbAXnaUt7
 W5zll0pjYICpgPo6lgf+NHZExxhufh0w8dMugx3WmE023kifZo5WLDjMRBnhIVmMkvFDCuWWL5H
 cgvUI6RfBvW/eSd/LYTFyHuXtTwo29as09mCAL1sDdJOLuWW5+cpV+zXuZ3Yzv8trUm/TshP/Lg
 que9f58fO1ucwyiMtjaqwROdBNpBxg2PPHCtSGbDMBFDcSUzVWxXShuRUM62QlrE34imXRPM9RZ
 YNuaiPfbUctCaHIlE9FBbMDcnGK1oZHk2Q6gKkchPXdjakDGnD4E4moWammd31kRb2nhyGBKkTW
 JnasC0ed
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68bd6529 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=-TsAvhh9eNYMg2Gy3vkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 1nnjogL7RBZKnt_z93DUpYMrLzQQpJ5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027
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

On Sat, Sep 06, 2025 at 04:24:29PM -0700, Rob Clark wrote:
> On Sat, May 24, 2025 at 10:15 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> > > From: Ryan Eatmon <reatmon@ti.com>
> > >
> > > The files generated by gen_header.py capture the source path to the
> > > input files and the date.  While that can be informative, it varies
> > > based on where and when the kernel was built as the full path is
> > > captured.
> > >
> > > Since all of the files that this tool is run on is under the drivers
> > > directory, this modifies the application to strip all of the path before
> > > drivers.  Additionally it prints <stripped> instead of the date.
> > >
> > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> > > ---
> > > The files generated by gen_header.py include the source path to the
> > > input files and the build date. While this information can be useful,
> > > it inadvertently exposes build system configuration details in the
> > > binaries. This hinders binary reproducibility, as the output will
> > > vary if the build environment changes.
> > >
> > > This change was originally submitted to the linux-yocto-dev kernel [1]
> > > to address binary reproducibility QA errors. However, the fix is generic
> > > enough to be applicable to the mainline kernel and would benefit other
> > > distributions as well. So proposing it here for broader inclusion.
> > >
> > > [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> > > ---
> > > Changes in v2:
> > > - Corrected author id
> > > - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> > > ---
> > >  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> >
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Rob, WDYT?
> 
> I'm revisiting this one, in the context of trying to re-sync
> gen_header.py with mesa.. but it is only changing the contents of
> comments, so it's not quite clear to me how this ends up mattering for
> binary reproducibility.
> 
> That said, since the generated files are no longer checked in to mesa
> or the kernel, we could probably just drop all of this if it mattered.

SGTM.

-- 
With best wishes
Dmitry
